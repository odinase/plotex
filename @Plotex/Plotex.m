classdef Plotex < handle
    %% Properties %%
   properties
       data;
       labels;
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
      function obj = Plotex(varargin)
            obj.new_data(varargin{:});
            obj.init();
      end
      %%% ----------- %%%
      
      new_data(obj, varargin);
      plot2pdf(path, filename, fig, varargin);
      plot(obj);

   end
   
   methods (Access = private)
       parse_data(obj, data);
       init(obj);
   end
end