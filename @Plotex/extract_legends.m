function legends = extract_legends(obj)

    legends = cell(obj.amount_of_data, 1);
    
    for i = 1:obj.amount_of_data
       
        legends{i} = obj.data{i}.legend;
        
    end

end

