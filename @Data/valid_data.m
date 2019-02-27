function validity = valid_data(data)
    
    correct_fieldnames = {'time'; 'values'};            
    validity = isequal(sort(fieldnames(data)), correct_fieldnames);
    
end
