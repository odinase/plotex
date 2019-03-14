function plot(this)

    this.fig = figure;
    k = 1;
    set(0, 'defaultAxesTickLabelInterpreter','latex'); set(0, 'defaultLegendInterpreter','latex');
    for i = 1:this.rows
        for j = 1:this.cols
            this.subpl(i, j) = subplot(this.rows, this.cols, k);
            this.plots{i, j}.plot();
            ax = gca;
            ax.TickLabelInterpreter='latex';
            yticks([-pi/2 -pi/4 0 pi/4 pi/2 3*pi/4 pi 5*pi/4 3*pi/2 7*pi/4 2*pi])
            yticklabels({'-\pi', '$-\pi/4$', '0','$\pi/2$', '$\pi$', '$3\pi/2$', '$2\pi$'})
            k = k + 1;
        end
    end
    
    if this.use_title
        sgtitle(this.fig, strcat('\textbf{', this.title, '}'), 'Interpreter', 'latex', 'Fontsize', 16', 'fontweight', 'bold');
    end
   
end

