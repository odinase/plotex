function validity = validify_data(data)
    
    validity = false;
    data_type = class(data);    

    switch data_type
        case {'char', 'string'}
            [~,~,ext] = fileparts(data);
            validity = strcmp(ext, '.mat');
        case 'struct'
            correct_fieldnames = {'signals', 'time'};
            correct_subfieldnames = {'dimensions', 'values'};
            validity = (isequal(sort(fieldnames(x)), correct_fieldnames))...
                && (isequal(sort(fieldnames(x.signals)), correct_subfieldnames));
        case 'double'
            [rows, cols] = size(data);
            validity = (rows == 2) || (cols == 2);
        otherwise
            validity = false;
   end
end
