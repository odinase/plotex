classdef Data < handle
    
    properties (Access = private)
        data_size;
    end
    
    properties (SetAccess = private)
        X;
        Y;
        legend;
    end
        
    methods
        function obj = Data(X, Y, legend)
            p = inputParser;            
            
            addRequired(p, 'X', @Data.valid_dim);
            addRequired(p, 'Y', @Data.valid_dim);
            addRequired(p, 'legend', @Data.valid_label);
            
            parse(p, X, Y, legend);
                        
            obj.X = p.Results.X;
            obj.Y = p.Results.Y;
            
            if (length(obj.X) ~= length(obj.Y))
                error('X and Y vector of unequal lengths.');
            end
            
            obj.legend = p.Results.legend;
        end
        
%         function set_data(obj, parameter, value)
%             assert(Data.valid_label(parameter), 'First input must be a char array or string.');
%             
%             switch parameter
%                 case 'XY'
%                     assert(Data.valid_dim(value(1, 1) && ), 'Not a valid data vector. Must be one dimensional');
%                 case 'legend'
%                     
%             end
%         end
        
        
    end
    
    methods (Static)
        obj = parse2Data(source, legend); 
        combined_data = combine(data, legends);
    end
    
    methods (Access = ?Plotex, Static)
         structified_data = structify_data(time, values);
         validity = valid_dim(data)
         validity = valid_label(legend)
    end
    
end

