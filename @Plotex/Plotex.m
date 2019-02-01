classdef Plotex < handle
    %% Properties %%
   properties
       data;
   end
   
   %properties (Access = private)
   %   CSV_FOLDER = "CSV data/";
   %end
   %% Methods %%
   methods
      
       %%% Constructor %%%
      function obj = Plotex(varargin)
         obj.data = new_data(varargin{:});
      end
      %%% ----------- %%%
      
      data = new_data(varargin);
      plot2pdf(path, filename, fig, varargin);
      
      %rms = calculateRMS(obj);
      %avg = calculateAvg(obj);
      %printData(obj);
      %plotData(obj);
      %retrieveDataFromCSV(obj);
      %setInterval(obj, start, stop);
      %time_length = findTimeLength(obj);
      
   end
   
   methods (Access = private)
       approximatedIndex = approximateIndex(obj, vector, index);
       cleanVariablesForUnderscore(obj);
   end
end