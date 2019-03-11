function subplot(obj, varargin)

    [rows, cols] = size(obj.data);
    subp = zeros(rows, cols);

    obj.fig = figure;
    
    valid_modes = {'plot', 'loglog', 'stairs'};
    
    if ~isempty(varargin)
        
        modes = varargin{1};
    
        if any(size(modes) ~= [rows, cols])
            error('Modes cell array must be same dimension as data cell array.');
        end
        
        for i = 1:length(varargin)
            validatestring(modes{i}, valid_modes); 
        end
    end
    
    for i = 1:rows
        for j = 1:cols
            subp(i, j) = subplot(rows, cols, (i-1)*cols + j);
            D = Plotex(obj.data(i, j));
            D.disable('figure');
            if ~isempty(varargin) && ~strcmp(modes{i, j}, 'plot')
                D.enable(modes{i, j});
            end
            D.plot();
        end
    end
    
end
