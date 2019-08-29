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
      function obj = Plotex(varargin)
          
            if nargin == 0
                error('No input parameters given. Must at least provide source for data as filename or three input parameters X, Y, label.');
            end
                        
            p = inputParser;            
            
            isData = @(x) isa(x, 'Data');
            isbool = @(x) isa(x, 'logical');
            
            % If no data source is provided, this function throws an error.
            [data, params] = obj.split_input(varargin{:});
            
            if Data.valid_label(data{1})
                [~, name, ext] = fileparts(data{1});
                if ismember(ext, obj.VALID_EXT)
                    obj.load_from_file(name, ext, data{2});
                end
            end
            
            
            addParameter(p, 'title', obj.DEFAULTS.title, @Data.valid_label);
            addParameter(p, 'xlabel', obj.DEFAULTS.xlabel, @Data.valid_label);
            addParameter(p, 'ylabel', obj.DEFAULTS.ylabel, @Data.valid_label);
            addParameter(p, 'loglog', obj.DEFAULTS.loglog, isbool);
            addParameter(p, 'stairs', obj.DEFAULTS.stairs, isbool);
            addParameter(p, 'figure', obj.DEFAULTS.figure, isbool);
            addParameter(p, 'grid', obj.DEFAULTS.grid, isbool);
            addParameter(p, 'thick_lines', obj.DEFAULTS.thick_lines, isbool);
            
            parse(p, params{:});
            
            obj.init(p.Results);
          
      end
      %%% ----------- %%%
      
      plot2pdf(obj, filename, varargin);
      plot(obj);
      subplot(obj, varargin);
      
      %% Enable functions
%       function enable_loglog(obj)
%         obj.use_loglog = true;
%       end
%       
%       function enable_grid_on(obj)
%         obj.use_grid_on = true;
%       end
%       
%       function enable_thick_lines(obj)
%         obj.use_thick_lines = true;
%       end
%       
%       function enable_stairs(obj)
%         obj.use_thick_lines = true;
%       end
      
      function enable(obj, parameter)
        
          switch char(parameter)
          
              case 'loglog'
                  obj.use_thick_lines = true;
                  
              case 'grid'
                  obj.use_grid_on = true;
                  
              case 'thick_lines'
                  obj.use_thick_lines = true;
                  
              case 'stairs'
                  obj.use_stairs = true;
                  
              case 'figure'
                  obj.use_figure = true;
                  
              case 'title'
                  obj.use_title = true;
              
              case 'xlabel'
                  obj.use_xlabel = true;
              
              case 'ylabel'
                  obj.use_ylabel= true;
          end
      end
      
      function disable(obj, parameter)
        
          switch char(parameter)
          
              case 'loglog'
                  obj.use_thick_lines = false;
                  
              case 'grid'
                  obj.use_grid_on = false;
                  
              case 'thick_lines'
                  obj.use_thick_lines = false;
                  
              case 'stairs'
                  obj.use_stairs = false;
                  
              case 'figure'
                  obj.use_figure = false;
              
              case 'title'
                  obj.use_title = false;
              
              case 'xlabel'
                  obj.use_xlabel = false;
              
              case 'ylabel'
                  obj.use_ylabel= false;
          end
      end
    
      %%
      function set(obj, varargin)
            p = inputParser;            
        
            ok_label = @(x) ischar(x) || isstring(x);
            ok_boolean = @(x) isa(x, 'logical');
            
            addParameter(p, 'title', obj.title, ok_label);
            addParameter(p, 'xlabel', obj.xlabel, ok_label);
            addParameter(p, 'ylabel', obj.ylabel, ok_label);
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
                        
            obj.title = p.Results.title;
            obj.xlabel = p.Results.xlabel;
            obj.ylabel = p.Results.ylabel; 
      end
   end
   
   methods (Access = private)
       validity = valid_plot_data(data);
       legends = extract_legends(obj);
       init(obj, parse_results);
       [data, params] = split_input(this, varargin);
   end
   
   methods (Access = private, Static)
       font_size = new_font_size(varargin);
       lineStyles = linspecer(N,varargin);
   end
end