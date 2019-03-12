function plot(this)

close all;

% Measured data closed loop

% measured_data = [measured_data(1), measured_data(2); measured_data(3), measured_data(4); measured_data(5), measured_data(6)];

[r, c] = size(D);

P = cell(r, c);

for i = 1:r
    for j = 1:c
        P{i, j} = Plotex(D(i, j), 'ylabel', labels{i, j}, 'title', titles{i, j}, 'xlabel', '$t$');
        P{i, j}.font_size.ticklabel = 11;
        P{i, j}.disable('figure');
        P{i, j}.enable('grid');
    end
end
    fig1 = figure(1);
   
    
for i = 1:N
    for j = 1:M
        subplot(N, M, k);
        P{i, j}.plot();
        k = k + 1;
    end
end
    
    sgtitle(fig1, 'Measured data, open loop');
    %P.plot2pdf();


end

