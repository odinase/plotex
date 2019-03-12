classdef Subplotex
    %SUBPLOTEX Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (SetAccess = private)
        plots;
        title;
    end
    
    properties (Access = private)
        rows;
        cols;
    end
    
    methods
        function this = Subplotex(plots, varargin)
            p = inputParser;            
            
            isPlotex = @(x) isa(x, 'Plotex');
            valid_plots = @(x) all(all(cellfun(isPlotex, x))) || all(isPlotex(x));
            valid_label = @(x) ischar(x) || isstring(x);
            
            default_title = '';
            
            addRequired(p, 'plots', valid_plots);
            addOptional(p, 'title', default_title, valid_label);
            
            parse(p, plots, varargin{:});
                        
            this.plots = p.Results.plots;
            this.title = p.Results.title;
            [this.rows, this.cols] = size(this.plots);
        end
        
        plot(this);
        
    end
end

