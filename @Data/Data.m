classdef Data < handle
    
    properties
        % Empty
    end
    
    properties (SetAccess = private)
        values;
        time;
        legend;
    end
        
    methods
        function obj = Data(data, legend)
            p = inputParser;            
        
            addRequired(p, 'data', @Data.valid_data);
            addRequired(p, 'legend', @Data.valid_label);
            
            parse(p, data, legend);
                        
            obj.values = p.Results.data.values;
            obj.time = p.Results.data.time;
            obj.legend = p.Results.legend;
        end
        
        function set_data(obj, data)
            if Data.valid_data(data)
                obj.values = data.values;
                obj.time = data.time;
            end
        end
        
        function set_legend(obj, legend)
            if Data.valid_label(legend)
                obj.legend = legend;
            end
        end
        
    end
    
    methods (Static)
        parsed_data = parse_data(data); 
        combined_data = combine(data, legends);
    end
    
    methods (Access = ?Plotex, Static)
         structified_data = structify_data(time, values);
         validity = valid_data(data)
         validity = valid_label(legend)
    end
    
end

