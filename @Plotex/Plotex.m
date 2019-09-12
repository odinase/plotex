classdef Plotex < handle
    %% Properties %%
       properties
          font_size; 
       end
    properties (SetAccess = private)
       data;
       parameters;
       use_title;
       use_xlabel;
       use_ylabel;
       use_legend;
    end
   
    properties (Constant)
       VALID_PARAMS = {'loglog',...
                'grid',...
                'thick_lines',...
                'stairs',...
                'figure',...
                'title',...
                'xlabel',...
                'ylabel'...
                'legend'};
        VALID_EXT = {'.mat'};
       DEFAULTS = struct(...
           'loglog',        false,...
           'grid',          false,...
           'thick_lines',   false,...
           'stairs',        false,...
           'figure',        true,...
           'title',         'Plot',...
           'xlabel',        'Time',...
           'ylabel',        'Values',...
           'legend',        true);
    end
   
   properties (Access = {?Subplotex, ?Plotex})
      amount_of_data;
      fig;
      pl;
   end
   %% Methods %%
   methods
      
       %%% Constructor %%%
      function this = Plotex(varargin)
          
            if nargin == 0
                error('No input parameters given. Must at least provide source for data as filename or three input parameters X, Y, label.');
            end
                        
            p = inputParser;            
            
            isbool = @(x) isa(x, 'logical');
            
            % If no data source is provided, this function throws an error.
            [data, params] = this.split_input(varargin{:});
            
            this.parse_data(data);
            
            addParameter(p, 'title', this.DEFAULTS.title, @Data.valid_label);
            addParameter(p, 'xlabel', this.DEFAULTS.xlabel, @Data.valid_label);
            addParameter(p, 'ylabel', this.DEFAULTS.ylabel, @Data.valid_label);
            addParameter(p, 'loglog', this.DEFAULTS.loglog, isbool);
            addParameter(p, 'stairs', this.DEFAULTS.stairs, isbool);
            addParameter(p, 'figure', this.DEFAULTS.figure, isbool);
            addParameter(p, 'grid', this.DEFAULTS.grid, isbool);
            addParameter(p, 'thick_lines', this.DEFAULTS.thick_lines, isbool);
            addParameter(p, 'legend', this.DEFAULTS.legend, isbool);
            
            parse(p, params{:});
            
            this.init(p.Results, p.UsingDefaults);
          
      end
      %%% ----------- %%%
      
      plot2pdf(this, varargin);
      p = plot(this);
      subplot(this, varargin);
      
      function enable(this, parameter)
        
          switch char(lower(parameter))
          
              case 'loglog'
                  this.parameters.loglog = true;
                  
              case 'grid'
                  this.parameters.grid = true;
                  
              case 'thick_lines'
                  this.parameters.thick_lines = true;
                  
              case 'stairs'
                  this.parameters.stairs = true;
                  
              case 'figure'
                  this.parameters.figure = true;
                  
              case 'title'
                  this.use_title = true;
              
              case 'xlabel'
                  this.use_xlabel = true;
              
              case 'ylabel'
                  this.use_ylabel = true;
              
              case 'legend'
                  this.use_legend = true;
          end
      end
      
      function disable(this, parameter)
        
          switch char(lower(parameter))
          
              case 'loglog'
                  this.parameters.loglog = false;
                  
              case 'grid'
                  this.parameters.grid = false;
                  
              case 'thick_lines'
                  this.parameters.thick_lines = false;
                  
              case 'stairs'
                  this.parameters.stairs = false;
                  
              case 'figure'
                  this.parameters.figure = false;
              
              case 'title'
                  this.use_title = false;
              
              case 'xlabel'
                  this.use_xlabel = false;
              
              case 'ylabel'
                  this.use_ylabel= false;

              case 'legend'
                  this.use_legend = false;
          end
      end
    
      
      function set(this, varargin)
            p = inputParser;            
        
            addParameter(p, 'title', this.title, @Data.valid_label);
            addParameter(p, 'xlabel', this.xlabel, @Data.valid_label);
            addParameter(p, 'ylabel', this.ylabel, @Data.valid_label);
            
            parse(p, varargin{:});
                        
            this.title = p.Results.title;
            this.xlabel = p.Results.xlabel;
            this.ylabel = p.Results.ylabel; 
      end
   end
   
   methods (Access = private)
       validity = valid_plot_data(data);
       legends = extract_legends(this);
       init(obj, parse_results, parse_defaults);
       [data, params] = split_input(this, varargin);
       vl = get_valid_len(this, data);
       set_line_width(this, line_width);
       parse_data(this, data);
   end
   
   methods (Static)
       p = merge(varargin);
   end
   
   methods (Access = private, Static)
       font_size = new_font_size(varargin);
       lineStyles = linspecer(N,varargin);
   end
   %%
end