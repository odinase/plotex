function p = plot(this)
%% Function description
% Makes a nice plot of arbitrary data in LaTeX font and returns a handler
% to the figure and the plots in the figure
%% Code
    
    if this.parameters.figure
        this.fig = figure;
    end
    
    this.pl = zeros(1, this.amount_of_data);
    
    % Used to get pretty colors
    colors = Plotex.linspecer(this.amount_of_data);
    
    %% Actual plotting
    if this.parameters.loglog
        for i = 1:this.amount_of_data

            this.pl(i) = loglog(this.data{i}.X, this.data{i}.Y, 'color', colors(i, :));
            hold on

        end
    % Default is ordinary 'plot'    
    elseif this.parameters.stairs
        for i = 1:this.amount_of_data
        
            this.pl(i) = stairs(this.data{i}.X, this.data{i}.Y, 'color', colors(i, :));
            hold on
            
        end
    else
        for i = 1:this.amount_of_data
        
            this.pl(i) = plot(this.data{i}.X, this.data{i}.Y, 'color', colors(i, :));
            hold on
            
        end
    end
    
    % Turn on grid if requested
    if this.parameters.grid
       grid on; 
    end
    
    if this.use_title
        title({this.parameters.title},   'Interpreter', 'latex', 'fontsize', this.font_size.title);
    end
    
    if this.use_legend
        legend(this.extract_legends(),   'Interpreter', 'latex', 'fontsize', this.font_size.legend, 'location', 'best');
    end
    
    if this.use_ylabel
        ylabel({this.parameters.ylabel}, 'Interpreter', 'latex');
    end
    
    if this.use_xlabel
        xlabel({this.parameters.xlabel}, 'Interpreter', 'latex');
    end
    
    % Set font size for axis
    
    xl = get(gca,'XLabel');
    xAX = get(gca,'XAxis');
    set(xAX,'FontSize', this.font_size.ticklabel)
    set(xl, 'FontSize', this.font_size.xlabel);
    
    yl = get(gca,'YLabel');
    yAX = get(gca,'YAxis');
    set(yAX,'FontSize', this.font_size.ticklabel)
    set(yl, 'FontSize', this.font_size.ylabel);
    set(gca, 'TickLabelInterpreter', 'latex');
    
    if this.parameters.thick_lines
        set(this.pl, 'LineWidth', 2);
    end
    
    p = this;
    
end

