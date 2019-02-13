function new_data(obj, varargin)
    obj.data = cell(1, length(varargin));
    
    if ~iscell(varargin)
        varargin = num2cell(varargin);
    end
    
    for i = 1:length(varargin)

                 
       if isstring(varargin{i}) || ischar(varargin{i})
           
           [~,name,ext] = fileparts(varargin{i});
           
           if strcmp(ext, '.mat')
               loaded_data = struct2table(load([name, ext]));
               data_name = loaded_data.Properties.VariableNames;
               loaded_data = loaded_data.(data_name{1});
               obj.parse_data(loaded_data);
           else
               fprintf('Parameter %d not recognized and ignored, continuing.\nFilename: %s', i, [name, ext]);
               continue % Ignore input data
           end
       else
           obj.data{i} = parse_data(varargin{i});           
       end
    end
    
end


