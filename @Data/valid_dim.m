function validity = valid_dim(x)

    validity = isnumeric(x) && (any([1, 1] == size(x)));
            
end
