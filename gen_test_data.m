close all
clear
clc

D = Data.combine(Data.parse_data('test.mat'), {'1', '2', '3', '4', '5', '6'});

[r, c] = size(D);

p = cell(r, c);

for i = 1:r
    for j = 1:c
        p{i, j} = Plotex(D(i,j));
    end
end