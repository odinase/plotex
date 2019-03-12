classdef Plotex < handle
    %% Properties %%
   properties (SetAccess = private)
       data;
       xlabel;
       ylabel;
       title;
       font_size;
       disable_figure;
       use_loglog;
       use_stairs;
       use_grid_on;
       use_thick_lines;
       use_title;
       use_xlabel;
       use_ylabel;
       use_legend;
   end
   
   properties (Access = private)
      amount_of_data;
      fig;
      pl;
   end
   %% Methods %%
   methods
      
       %%% Constructor %%%
      function obj = Plotex(data, varargin)
            p = inputParser;            
        
            default_xlabel = 'Time';
            default_ylabel = 'Values';
            default_title = 'Plot';
            
            isData = @(x) isa(x, 'Data');
            
            validate_data = @(x) all(cellfun(isData, data)) || isData(data);
            
            addRequired(p, 'data', validate_data);
            addParameter(p, 'title', default_title, @Data.valid_label);
            addParameter(p, 'xlabel', default_xlabel, @Data.valid_label);
            addParameter(p, 'ylabel', default_ylabel, @Data.valid_label);
            
            parse(p, data, varargin{:});
            
            obj.data = p.Results.data;
            if ~iscell(obj.data)
                obj.data = {obj.data};
            end
            obj.title = p.Results.title;
            obj.xlabel = p.Results.xlabel;
            obj.ylabel = p.Results.ylabel;
            obj.init();
          
      end
      %%% ----------- %%%
      
      plot2pdf(obj, path, filename, fig, varargin);
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
                  obj.disable_figure = false;
          end
      end
      
      %% Disable functions
%       
%       function disable_loglog(obj)
%         obj.use_loglog = false;
%       end
%       
%       function disable_grid_on(obj)
%         obj.use_grid_on = false;
%       end
%       
%       function disable_thick_lines(obj)
%         obj.use_thick_lines = false;
%       end
      
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
                  obj.disable_figure = true;
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
       init(obj, data);
   end
   
   methods (Access = private, Static)
       font_size = new_font_size(varargin);
       lineStyles = linspecer(N,varargin);
   end
end