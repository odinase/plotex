function [fig, subp] = subplot(obj)

    [rows, cols] = size(obj.data);
    subp = zeros(rows, cols);

    fig = figure;
    
    obj.disable_figure = true;
    
    for i = 1:rows
        for j = 1:cols
            subp(i, j) = subplot(rows, cols, (i-1)*cols + j);
            obj.plot();
        end
    end
    
    obj.disable_figure = false;
    
end

