close all
clear
clc

data = load('test.mat');
data = data.measured_data;
[r, c] = size(data);

X = data(1, :);
Y = data(2:end, :);
l = cell(r - 1, 1);
for i = 1:length(l)
    l{i} = strcat('Y', num2str(i));
end

p = cell(r - 1, 1);
for i = 1:(r - 1)
    p{i} = Plotex(X, Y(i, :), l{i});
end