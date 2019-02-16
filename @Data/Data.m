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
        function obj = Data(data, varargin)
            p = inputParser;
            
            correct_fieldnames = {'time', 'values'};
            valid_data = @(x) isstruct(x) && (isequal(sort(fieldnames(x)), correct_fieldnames));
            valid_label_type = @(x) ischar(x) || isstring(x);

            empty_label = '|';
            
            addRequired(p, 'data', valid_data_type);
            addParameter(p, 'title', empty_label, valid_label_type);
            addParameter(p, 'legend', empty_label, valid_label_type);
            addParameter(p, 'xlabel', empty_label, valid_label_type);
            addParameter(p, 'ylabel', empty_label, valid_label_type);
            
            parse(p, data, varargin{:});
                        
            obj.new_data(data);
            obj.title = p.Results.title;
            obj.legend = p.Results.legend;
            obj.xlabel = p.Results.xlabel;
            obj.ylabel = p.Results.ylabel;
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

