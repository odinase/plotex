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
    
    properties (Access = private)
        empty_title;
        empty_legend;
        empty_xlabel;
        empty_ylabel;
    end
    
    
    
    methods
        function obj = Data(data, legend)
            p = inputParser;            
            
            valid_label_type = @(x) ischar(x) || isstring(x);

            addRequired(p, 'data', @validify_data);
            addRequired(p, 'legend', valid_label_type);
            
            parse(p, data, legend);
                        
            obj.new_data(data);
            obj.legend = p.Results.legend;
        end
    end
    
    methods (Static)
        parse_data(data);
        
    end
    
    methods (Access = private)
        new_data(obj, varargin);
        structified_data = structify_data(obj, data);
    end
end

