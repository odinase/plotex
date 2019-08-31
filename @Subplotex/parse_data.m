function parse_data(this, data)
    
    data = flatten(data);
    
    l = length(data);
    vl = this.get_valid_len(data);

    if vl < l && vl > 0
        warning('Detected less readable data than given, are all parameter names typed correctly? Data must be passed as Plotex instances, either in a cell array or as individual inputs.');
    elseif vl <= 0
        error('No valid data given, make sure to pass data as all Plotex instances, either in a cell array or as individual inputs.');
    end

    this.plots = data(1:vl);
    
end

function flattened_data = flatten(data)

    flattened_data = reshape(data', numel(data), 1);

end
