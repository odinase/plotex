function vl = get_valid_len(this, data)
    
    if ~this.isPlotex(data{1})
        error('Number of valid data is zero, aborting.');
    end
    
    vl = 0;
    i = 1;
    
    while i <= length(data) && this.isPlotex(data{i})
        vl = vl + 1;
        i = i + 1;
    end
    
end
