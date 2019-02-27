function plot2pdf(obj, filename, varargin)

    p = inputParser;
    
    valid_string = @(x) ischar(x) || istring(x);
    default_width = 0.9;
    default_height = 1;
    default_path = '';
    
    addRequired(p, 'filename', valid_string);
    addParameter(p, 'width', default_width, @isnumeric);
    addParameter(p, 'height', default_height, @isnumeric);
    addParameter(p, 'path', default_path, valid_string);

    parse(p, filename, varargin{:});
    
    filename = p.Results.filename;
    width = p.Results.width;
    height = p.Results.height;
    path = p.Results.path;
    
    set(obj.fig, 'Units', 'Inches');
    pos1 = get(obj.fig, 'Position');
    
    fig_width = pos1(3);
    fig_height = pos1(4);
    
    set(obj.fig, 'PaperPositionMode', 'Auto', 'PaperUnits', 'Inches',...
        'PaperSize', [fig_width*width, fig_height*height]);    
    
    if (strcmp(path, default_path))
        path = strcat(pwd, '/');
    end
    
    print(obj.fig, strcat(path, filename), '-dpdf', '-r0');

end

