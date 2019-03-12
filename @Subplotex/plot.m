function plot(this)

    this.fig = figure;
    k = 1;

    for i = 1:this.rows
        for j = 1:this.cols
            this.subpl = subplot(this.rows, this.cols, k);
            this.plots{i, j}.plot();
            k = k + 1;
        end
    end
    
    if this.use_title
        sgtitle(this.fig, this.title);
    end
end

