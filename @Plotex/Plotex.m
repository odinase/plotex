classdef Plotex < handle
    %% Properties %%
       properties
          font_size; 
       end
    properties (SetAccess = private)
       data;
       parameters;
%         xlabel;
%         ylabel;
%         title;
%        use_figure;
%        use_loglog;
%        use_stairs;
%        use_grid_on;
%        use_thick_lines;
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
                'ylabel'};
        VALID_EXT = {'.mat'};
       DEFAULTS = struct(...
           'loglog',        false,...
           'grid',          false,...
           'thick_lines',   false,...
           'stairs',        false,...
           'figure',        true,...
           'title',         'Plot',...
           'xlabel',        'Time',...
           'ylabel',        'Values');
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
            
            isData = @(x) isa(x, 'Data');
            isbool = @(x) isa(x, 'logical');
            
            % If no data source is provided, this function throws an error.
            [data, params] = this.split_input(varargin{:});
            
            if Data.valid_label(data{1})
                [~, name, ext] = fileparts(data{1});
                if ismember(ext, this.VALID_EXT)
                    this.load_from_file(name, ext, data{2});
                else
                    error('Could not detect correct file extension, aborting.');
                end
            end
            
            l = length(data);
            vl = this.get_valid_len(data);
            if vl < l
                warning('Detected less readable data than given, are all parameter names typed correctly? Data must be given as X, Y, label, in that specific order.');
            end
            this.data = cell(vl/3, 1);
                for i = 1:vl/3
                    % Iteration variable to get every third element of
                    % input data
                    j = 3*(i - 1) + 1;
                    this.data{i} = Data(data{j}, data{j + 1}, data{j + 2});
                end
            
            
            addParameter(p, 'title', this.DEFAULTS.title, @Data.valid_label);
            addParameter(p, 'xlabel', this.DEFAULTS.xlabel, @Data.valid_label);
            addParameter(p, 'ylabel', this.DEFAULTS.ylabel, @Data.valid_label);
            addParameter(p, 'loglog', this.DEFAULTS.loglog, isbool);
            addParameter(p, 'stairs', this.DEFAULTS.stairs, isbool);
            addParameter(p, 'figure', this.DEFAULTS.figure, isbool);
            addParameter(p, 'grid', this.DEFAULTS.grid, isbool);
            addParameter(p, 'thick_lines', this.DEFAULTS.thick_lines, isbool);
            
            parse(p, params{:});
            
            this.init(p.Results, p.UsingDefaults);
          
      end
      %%% ----------- %%%
      
      plot2pdf(this, filename, varargin);
      plot(this);
      subplot(this, varargin);
      
      function enable(this, parameter)
        
          switch char(parameter)
          
              case 'loglog'
                  this.use_thick_lines = true;
                  
              case 'grid'
                  this.use_grid_on = true;
                  
              case 'thick_lines'
                  this.use_thick_lines = true;
                  
              case 'stairs'
                  this.use_stairs = true;
                  
              case 'figure'
                  this.use_figure = true;
                  
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
        
          switch char(parameter)
          
              case 'loglog'
                  this.use_thick_lines = false;
                  
              case 'grid'
                  this.use_grid_on = false;
                  
              case 'thick_lines'
                  this.use_thick_lines = false;
                  
              case 'stairs'
                  this.use_stairs = false;
                  
              case 'figure'
                  this.use_figure = false;
              
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
    
      %%
      function set(this, varargin)
            p = inputParser;            
        
            ok_label = @(x) ischar(x) || isstring(x);
            ok_boolean = @(x) isa(x, 'logical');
            
            addParameter(p, 'title', this.title, ok_label);
            addParameter(p, 'xlabel', this.xlabel, ok_label);
            addParameter(p, 'ylabel', this.ylabel, ok_label);
            % addParameter(p, 'line_width', 2, @isnumeric);
%             
%        font_size;
%        disable_figure;
%        use_loglog;
%        use_stairs;
%        use_grid_on;
%        use_thick_lines;
%        use_title;
%        use_xlabel;
%        use_ylabel;
%        use_legend;
            
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
   end
   
   methods (Access = private, Static)
       font_size = new_font_size(varargin);
       lineStyles = linspecer(N,varargin);
   end
end