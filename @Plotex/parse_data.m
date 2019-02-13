function parse_data(obj, data)

    data_type = class(data);    

    switch data_type
        case 'struct'
            obj.data = struct(...
            'time', data.time,...
            'values', data.signals.values);
        case 'double'
            [rows, ~] = size(data);
            obj.data = cell(1, rows - 1);
            for i = 2:rows
                obj.data{i - 1} = struct(...
                    'time', data(1, :),...
                    'values', data(i, :));
            end
        otherwise
            obj.data = {};   
   end
end

% switch n
%     case -1
%         disp('negative one')
%     case 0
%         disp('zero')
%     case 1
%         disp('positive one')
%     otherwise
%         disp('other value')
% end