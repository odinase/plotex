function parsed_data = parse_data(data)

    data_type = class(data);    

    switch data_type
        case {'char', 'string'}
            handle_string(data);
        case 'struct'
            parsed_data = struct(...
            'time', data.time,...
            'values', data.signals.values);
        case 'double'
            [rows, ~] = size(data);
            parsed_data = cell(1, rows - 1);
            for i = 2:rows
                parsed_data{i - 1} = struct(...
                    'time', data(1, :),...
                    'values', data(i, :));
            end
        otherwise
            parsed_data = {};   
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