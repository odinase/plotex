close all
clear
clc

load('test.mat');

X = measured_data(1, :);
Y1 = measured_data(2, :);
Y2 = measured_data(3, :);
l1 = {'X', 'Y1'};
l2 = {'X', 'Y2'};