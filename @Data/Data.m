classdef Data < handle
    
    properties
        % Empty
    end
    
    properties (SetAccess = private)
        data;
        legend;
    end
        
    methods
        function obj = Data(data, legend)
            p = inputParser;            
        
            addRequired(p, 'data', @Data.valid_data);
            addRequired(p, 'legend', @Data.valid_legend);
            
            parse(p, data, legend);
                        
            obj.data = p.Results.data;
            obj.legend = p.Results.legend;
        end
        
        function set_data(obj, data)
            if Data.valid_data(data)
                obj.data = data;
            end
        end
        
        function set_label(obj, legend)
            if Data.valid_legend(legend)
                obj.legend = legend;
            end
        end
        
    end
    
    methods (Static)
        parsed_data = parse_data(data); 
    end
    
    methods (Access = private, Static)
         structified_data = structify_data(time, values);
         validity = valid_data(data)
         validity = valid_legend(legend)
    end
    
    methods (Access = private)
        new_data(obj, varargin);
        
    end
end

