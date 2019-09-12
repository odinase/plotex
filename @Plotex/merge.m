function p = merge(varargin)

    % Needs to check if parameter list or cell array
    if iscell(varargin{1}) && length(varargin) == 1
        plots = varargin{1};
        p = Plotex.merge(plots{:});
        return;
    end
    
    p = Plotex(0, 0, '');
    p.data = cell(length(varargin), 1);
    p.amount_of_data = 0;
    
    for i = 1:length(varargin)
        for j = 1:varargin{i}.amount_of_data
            p.data{i} = Data(varargin{i}.data{j}.X, varargin{i}.data{j}.Y, varargin{i}.data{j}.legend);
            p.amount_of_data = p.amount_of_data + 1;
        end
    end
    
end

