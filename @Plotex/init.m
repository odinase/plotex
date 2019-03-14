function init(obj)
    obj.amount_of_data = length(obj.data);
    obj.font_size = Plotex.new_font_size();
    obj.disable_figure = false;
    obj.use_loglog = false;
    obj.use_stairs = false;
    obj.use_grid_on = false;
    obj.use_thick_lines = false;
    obj.use_title = ~strcmp('Plot', obj.title);
    obj.use_xlabel = ~strcmp('Time', obj.xlabel);
    obj.use_ylabel = ~strcmp('Values', obj.ylabel);
    obj.use_legend = obj.amount_of_data > 1;
end

