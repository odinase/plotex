classdef Subplotex < handle
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
    
    properties (Constant, Access = private)
        VALID_PARAMS = {'title',...
                        'shape'};
        VALID_EXT = {'.mat'};
        DEFAULTS = struct('title', '');
    end
    
    methods
        function this = Subplotex(varargin)
            p = inputParser;            
            
            [data, params] = this.split_input(varargin{:});
            
            % If data is originally passed as cell array it will be nested within
            % another cell array, needs to extract first.
            if length(data) == 1 && iscell(data{1})
                data = data{1};
            end

            % Transpose to get plots aligned vertically
            [this.rows, this.cols] = size(data');
            
            this.parse_data(data);
            
            valid_shape = @(x) isnumeric(x) && (length(x) == 2) && (x(1)*x(2) == this.rows*this.cols);
            
            addParameter(p, 'title', this.DEFAULTS.title, @Data.valid_label);
            addParameter(p, 'shape', [this.rows, this.cols], valid_shape);
            
            parse(p, params{:});
            
            this.rows = p.Results.shape(1);
            this.cols = p.Results.shape(2);       
            this.title = p.Results.title;
            
            this.use_title = ~strcmp(p.Results.title, '');
            
            this.plots = reshape(this.plots, this.rows, this.cols);
            
            for i = 1:this.rows
                for j = 1:this.cols
                    this.plots{i, j}.disable('figure');
                end
            end
        end        
        p = plot(this);
        plot2pdf(this, varargin);
        
      function enable(this, parameter)
        
          switch char(lower(parameter))
              case 'title'
                  this.use_title = true;
          end
      end
      
      function disable(this, parameter)
        
          switch char(lower(parameter))
              case 'title'
                  this.use_title = false;
          end
      end
    
      
      function set(this, varargin)
            p = inputParser;            
        
            addParameter(p, 'title', this.title, @Data.valid_label);
            
            parse(p, varargin{:});
                        
            this.title = p.Results.title;
      end
    end
        
       methods (Access = private)
           [data, params] = split_input(this, varargin);
           vl = get_valid_len(this, data);
           parse_data(this, data);
           function valid = isPlotex(this, x) 
               valid = isa(x, 'Plotex');
           end
       end
end

