classdef Data < handle
    %LABELS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        data;
        title;
        legend;
        xlabel;
        ylabel;
    end
    
    methods
        function obj = Data(data, varargin)
            p = inputParser;
            
            valid_data_type = @(x) ischar(x) || isstring(x) || isstruct(x) || isnumeric(x);
            valid_label_type = @(x) ischar(x) || isstring(x);

            empty_label = '';
            
            addRequired(p, 'data', valid_data_type);
            addOptional(p, 'title', empty_label, valid_label_type);
            addOptional(p, 'legend', empty_label, valid_label_type);
            addOptional(p, 'xlabel', empty_label, valid_label_type);
            addOptional(p, 'ylabel', empty_label, valid_label_type);
            
            
            loaded_data = struct2table(load([name, ext]));
            data_name = loaded_data.Properties.VariableNames;
            
            parse(p, data, varargin{:});
            
            new_data(obj, data);
            obj.title = varargin{1};
            obj.legend = varargin{2};
            obj.xlabel = varargin{3};
            obj.ylabel = varargin{4};
        end
        
    end
    
    methods (Access = private)
        parse_data(obj, data);
        new_data(obj, varargin);
    end
end

