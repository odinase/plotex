function init(obj, parse_results)
    obj.amount_of_data = length(obj.data);
    obj.font_size = Plotex.new_font_size();
    obj.parameters = parse_results;
%     obj.disable_figure = parse_results.figure;
%     obj.use_loglog = false;
%     obj.use_stairs = false;
%     obj.use_grid_on = false;
%     obj.use_thick_lines = false;
    obj.use_title = ~strcmp('Plot', obj.parameters.title);
    obj.use_xlabel = ~strcmp('Time', obj.parameters.xlabel);
    obj.use_ylabel = ~strcmp('Values', obj.parameters.ylabel);
    obj.use_legend = obj.amount_of_data > 1;
end

