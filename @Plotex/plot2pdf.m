function plot2pdf(obj, varargin)

    p = inputParser;
    
    valid_string = @(x) ischar(x) || istring(x);
    default_path = '';
    default_filename = strcat('plot_', num2str(fix(clock)));
    default_filename = default_filename(default_filename ~= ' ');
    
    addOptional(p, 'filename', default_filename, valid_string);
    addOptional(p, 'path', default_path, valid_string);
    
    parse(p, varargin{:});
    
    filename = p.Results.filename;
    path = p.Results.path;
    
    set(obj.fig, 'Units', 'Inches');
    pos1 = get(obj.fig, 'Position');
    
    fig_width = pos1(3);
    fig_height = pos1(4);
    
    set(obj.fig, 'PaperPositionMode', 'Auto', 'PaperUnits', 'Inches',...
        'PaperSize', [fig_width, fig_height]);    
    
    if (strcmp(path, default_path))
        path = strcat(pwd, '/');
    end
    
    print(obj.fig, strcat(path, filename), '-dpdf', '-r0', '-bestfit');

end

