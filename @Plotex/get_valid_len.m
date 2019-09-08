function vl = get_valid_len(this, data)
    l = length(data);
    k = 1;
    vl = 0;
    while k < l && (isnumeric(data{k}) && isnumeric(data{k + 1}) && Data.valid_label(data{k + 2}) && length(data{k}) == length(data{k + 1}))
        vl = vl + 3;
        k = k + 3;
    end

end
