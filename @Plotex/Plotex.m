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
       use_grid_on;
       use_thick_lines;
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
      
      %% Enable functions
      function enable_loglog(obj)
        obj.use_loglog = true;
      end
      
      function enable_grid_on(obj)
        obj.use_grid_on = true;
      end
      
      function enable_thick_lines(obj)
        obj.use_thick_lines = true;
      end
      
      %% Disable functions
      
      function disable_loglog(obj)
        obj.use_loglog = false;
      end
      
      function disable_grid_on(obj)
        obj.use_grid_on = false;
      end
      
      function disable_thick_lines(obj)
        obj.use_thick_lines = false;
      end

      %%
   end
   
   methods (Access = private)
       validity = valid_plot_data(data);
       legends = extract_legends(obj);
       init(obj, data);
   end
   
   methods(Static)
    
   end
end