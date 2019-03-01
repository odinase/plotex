function parsed_data = parse2struct(data_source)
%% Function description
% Assumes all data in array format comes with the first row with time and
% the following rows are data
%%
    data_type = class(data_source);    

    switch data_type
        case {'char', 'string'}
            parsed_data = load_from_file(data_source);
        case 'struct'
            parsed_data = cell(data_source.signals.dimensions, 1);
            for i = 1:data_source.signals.dimensions
                parsed_data{i} = Data.structify_data(data_source.time, data_source.signals.values(i, :));
            end
        case 'double'
            [rows, ~] = size(data_source);
            parsed_data = cell(rows - 1, 1);
            for i = 2:rows
                parsed_data{i - 1} = Data.structify_data(data_source(1, :), data_source(i, :));
            end
        otherwise
            parsed_data = {};   
   end
end
%%
function loaded_data = load_from_file(data)

    loaded_data = load(data);
    fn = fieldnames(loaded_data);
    buffer = loaded_data.(fn{1});
    [rows, ~] = size(buffer);
    loaded_data = cell(rows - 1, 1);
       
    for i = 2:rows

        loaded_data{i - 1} = Data.structify_data(buffer(1, :), buffer(i, :));

    end
end