classdef Plotex < handle
    %% Properties %%
   properties
       
   end
   
   %properties (Access = private)
   %   CSV_FOLDER = "CSV data/";
   %end
   %% Methods %%
   methods
      
       %%% Constructor %%%
      function obj = CompetitionAnalyzer(event, competition, driver, channel, varargin)
          
          obj.event = lower(event);
          obj.competition = lower(competition);
          obj.driver = lower(driver);
          obj.channel = lower(channel);
          retrieveDataFromCSV(obj);
          
          % If the user inserts start and stop times, add these as
          % properties
          switch length(varargin)
              case 2
                  obj.start = varargin{1};
                  obj.stop = varargin{2};
                  obj.setInterval(obj.start, obj.stop);
          end
          obj.cleanVariablesForUnderscore();
          
      end
      %%% ----------- %%%
      
      rms = calculateRMS(obj);
      avg = calculateAvg(obj);
      printData(obj);
      plotData(obj);
      retrieveDataFromCSV(obj);
      setInterval(obj, start, stop);
      time_length = findTimeLength(obj);
      
   end
   
   methods (Access = private)
       approximatedIndex = approximateIndex(obj, vector, index);
       cleanVariablesForUnderscore(obj);
   end
end