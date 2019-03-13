function combined_data = combine(data, legends)

    if ~(iscell(data) && iscell(legends) && all(size(data) == size(legends)))
        error('Incompatible types, both inputs must be cell arrays of same dimensions');
    end
    
    
    [r, c] = size(data);
    
    combined_data = cell(r, c);
    
    for i = 1:r
        for j = 1:c
            combined_data{i, j} = Data(data{i, j}, legends{i, j});
        end
    end

end

