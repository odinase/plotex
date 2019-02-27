function combined_data = combine(data, legends)

    if ~(iscell(data) && iscell(legends) && length(data) == length(legends))
        error('Incompatible types, both inputs must be cell arrays of same dimensions');
    end
    
    combined_data = cell(length(data), 1);
    
    for i = 1:length(data)
       
        combined_data{i} = Data(data{i}, legends{i});
        
    end

end

