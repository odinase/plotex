function parsed_data = parse_data(data)

    data_type = class(data);    

    switch data_type
        case {'char', 'string'}
            parsed_data = load_from_file(data);
        case 'struct'
            parsed_data = Data.structify_data(data.time, data.signals.values);
        case 'double'
            [rows, ~] = size(data);
            parsed_data = cell(1, rows - 1);
            for i = 2:rows
                parsed_data{i - 1} = Data.structify_data(data(1, :), data(i, :));
            end
        otherwise
            parsed_data = {};   
   end
end

function loaded_data = load_from_file(data)

    loaded_data = load(data);
    fn = fieldnames(loaded_data);
    buffer = loaded_data.(fn{1});
    [rows, ~] = size(buffer);
    if (rows > 2)
        
        loaded_data = cell(rows - 1, 1);
       
        for i = 2:rows
        
            loaded_data{i - 1} = Data.structify_data(buffer(1, :), buffer(i, :));
            
        end
    else
        loaded_data = Data.structify_data(buffer(1, :), buffer(2, :));
    end

end