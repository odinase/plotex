function parse_data(this, data)
    
    if Data.valid_label(data{1})
        [~, name, ext] = fileparts(data{1});
        if ismember(ext, this.VALID_EXT)
            % Extract labels depending on if it is passed as cell
            % array or raw input parameters.
            if length(data) > 2
                labels = data(2:end);
            else
                labels = data{2};
            end
            this.load_from_file(name, ext, labels);
        else
            error('Could not detect correct file extension, aborting.');
        end
    else
        l = length(data);
        vl = this.get_valid_len(data);

        if vl < l && vl > 0
            warning('Detected less readable data than given, are all parameter names typed correctly? Data must be given as X, Y, label, in that specific order.');
        elseif vl <= 0
            error('No valid data given, make sure to pass data as X, Y, label, in that specific order.');
        end

        this.data = cell(vl/3, 1);
        for i = 1:vl/3
            % Iteration variable to get every third element of
            % input data
            j = 3*(i - 1) + 1;
            this.data{i} = Data(data{j}, data{j + 1}, data{j + 2});
        end
    end
    
end

