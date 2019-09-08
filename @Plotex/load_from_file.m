function load_from_file(this, name, ext, labels)

    if ~iscell(labels)
        error('Labels for data from file must be in a cell array.');
    end

    switch ext
        case '.mat'
            loaded_data = struct2table(load(strcat(name, ext)));
            data_name = loaded_data.Properties.VariableNames;
            loaded_data = loaded_data.(data_name{1});
            
            switch class(loaded_data)
                case 'struct'
                    if length(labels) ~= loaded_data.signals.dimensions
                        error('Dimension of cell array with labels not equal to dimension of data in file');
                    end

                    this.data = cell(loaded_data.signals.dimensions, 1);

                    for i = 1:loaded_data.signals.dimensions
                        this.data{i} = Data(loaded_data.time, loaded_data.signals.values(i, :), labels{i});
                    end
                case 'double'
                    [data_dim, ~] = size(loaded_data);
                    data_dim = data_dim - 1;
                    
                    if length(labels) ~= data_dim
                        warning('Dimension of cell array with labels not equal to dimension of data in file, are parameters passed correctly? Use char array for optional parameter names and make sure they are correctly spelled.');
                    end
                    
                    this.data = cell(data_dim, 1);

                    for i = 1:data_dim
                        this.data{i} = Data(loaded_data(1, :), loaded_data(i + 1, :), labels{i});
                    end
            end
    end
end

