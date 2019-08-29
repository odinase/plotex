function init(obj, parse_results, parse_defaults)
    obj.amount_of_data = length(obj.data);
    obj.font_size = Plotex.new_font_size();
    obj.parameters = parse_results;
    obj.use_title = ~ismember('title', parse_defaults);
    obj.use_xlabel = ~ismember('xlabel', parse_defaults);
    obj.use_ylabel = ~ismember('ylabel', parse_defaults);
    obj.use_legend = obj.amount_of_data > 1;
end

