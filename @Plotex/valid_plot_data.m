function validity = valid_plot_data(data)

    validity = (iscell(data) && all(cellfun(@Data.valid_data, data)))...
        || (isstruct(data) && Data.valid_data(data));

end

