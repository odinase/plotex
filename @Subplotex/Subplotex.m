classdef Subplotex
    %SUBPLOTEX Summary of this class goes here
    %   Detailed explanation goes here
    properties
        plots;
    end
    
    properties (SetAccess = private)
        title;
        use_title;
    end
    
    properties (Access = private)
        rows;
        cols;
        fig;
        subpl;
    end
    
    methods
        function this = Subplotex(plots, varargin)
            p = inputParser;            
            
            isPlotex = @(x) isa(x, 'Plotex');
            valid_plots = @(x) length(plots) > 1 && iscell(plots) && all(all(cellfun(isPlotex, x)));
            valid_label = @(x) ischar(x) || isstring(x);
            
            default_title = '';
            
            addRequired(p, 'plots', valid_plots);
            addOptional(p, 'title', default_title, valid_label);
            
            parse(p, plots, varargin{:});
                        
            this.plots = p.Results.plots;         
            this.title = p.Results.title;
            [this.rows, this.cols] = size(this.plots);
            
            this.use_title = ~strcmp(p.Results.title, '');
            
            for i = 1:this.rows
                for j = 1:this.cols
                    this.plots{i, j}.disable('figure');
                end
            end
        end        
        plot(this);
        
    end
end

