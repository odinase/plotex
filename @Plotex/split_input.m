function [data, params] = split_input(this, varargin)

    MIN_DATA_ELEMS = 3;

    str_matches = zeros(length(varargin), 1);
    
    for i = 1:length(this.VALID_PARAMS)
        str_matches = or(str_matches, strcmp(this.VALID_PARAMS{i}, varargin'));
    end
    
    split_index = find(str_matches, 1, 'first');
    
    if ~isempty(split_index)
        if split_index == 1
            error('No data source given. Provide filename as string or minimum three inputs X, Y, label');
        end
        
        data = varargin(1:split_index - 1);
        params = varargin(split_index:end);
    else
        data = varargin;
        params = {};
    end
    
end

