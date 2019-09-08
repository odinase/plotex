function plot2pdf(this, varargin)

    p = inputParser;
    
    valid_string = @(x) ischar(x) || istring(x);
    default_path = '';
    default_file_format = 'pdf';
    default_filename = strcat('subplot_', num2str(fix(clock)));
    default_filename = default_filename(default_filename ~= ' ');
    
    addParameter(p, 'filename', default_filename, valid_string);
    addParameter(p, 'path', default_path, valid_string);
    addParameter(p, 'fileformat', default_file_format, valid_string);
    
    parse(p, varargin{:});
    
    filename = p.Results.filename;
    fileformat = ['-d', p.Results.fileformat];
    path = p.Results.path;
    
    set(this.fig, 'Units', 'Inches');
    pos1 = get(this.fig, 'Position');
    
    fig_width = pos1(3);
    fig_height = pos1(4);
    
    set(this.fig, 'PaperPositionMode', 'Auto', 'PaperUnits', 'Inches',...
        'PaperSize', [fig_width, fig_height]);    
    
    if (strcmp(path, default_path))
        path = strcat(pwd, '/');
    end
    
    if path(end) ~= '/'
        path(end + 1) = '/';
    end
    
    print(this.fig, strcat(path, filename), fileformat, '-r0');

end

