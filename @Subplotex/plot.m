function p = plot(this)

    close(this.fig);

    this.fig = figure;
    k = 1;
    set(0, 'defaultAxesTickLabelInterpreter','latex'); set(0, 'defaultLegendInterpreter','latex');
    for i = 1:this.rows
        for j = 1:this.cols
            this.subpl(i, j) = subplot(this.rows, this.cols, k);
            this.plots{i, j}.plot();
            k = k + 1;
        end
    end
    
    if this.use_title
        sgtitle(this.fig, strcat('\textbf{', this.title, '}'), 'Interpreter', 'latex', 'Fontsize', 16', 'fontweight', 'bold');
    end
    
    p = this;
   
end

