function plot(obj)
%% Function description
% Makes a nice plot of arbitrary data in LaTeX font and returns a handler
% to the figure and the plots in the figure
% -----------------------------------
% Input:
%
% 1. data: cell array (if only one then also struct)
%       --- struct
%           --- 'time' : time array corresponding to 'values'
%           --- 'values' : value array corresponding to 'time'
% 2. labels: struct
%         --- 'title' : String containing the title, in LaTeX syntax
%         --- 'legend' : String containing the legend, in LaTeX syntax. If only one legend,
%            pass as string. Otherwise, pass as cell array.
%         --- 'ylabel' : String containing the ylabel, in LaTeX syntax
%         --- 'xlabel' : String containing the xlabel, in LaTeX syntax
% 3. font_size: struct
%            --- 'title' : Size of the 'title' font
%            --- 'legend' : Size of the 'legend' font. 
%            --- 'ylabel' : Size of the 'ylabel' font
%            --- 'xlabel' : Size of the 'xlabel' font
% 4. varargin: Optional input parameters
%            --- 'loglog' : Pass in the string 'loglog' for loglog plot
%            --- 'grid'   : Pass in the strin 'grid' to turn on grids
%            --- 'thicklines' : Turns linewidth to 3
%            --- 'disablefigure': Disable creating new figure
%
% ----------------------------------
% Output:
% 
% 1. fig: Handle to the figure created.
% 2. pl : Array with handles to all overlapping plots created
% ----------------------------------
%% Code
    
    if ~obj.disable_figure
        obj.fig = figure;
    end
    
    obj.pl = zeros(1, obj.amount_of_data);
    
    % Used to get pretty colors
    colors = Plotex.linspecer(obj.amount_of_data);
    
    %% Actual plotting
    if obj.use_loglog
        for i = 1:obj.amount_of_data

            obj.pl(i) = loglog(obj.data{i}.time, obj.data{i}.values, 'color', colors(i, :));
            hold on

        end
    % Default is ordinary 'plot'    
    elseif obj.use_stairs
        for i = 1:obj.amount_of_data
        
            obj.pl(i) = stairs(obj.data{i}.time, obj.data{i}.values, 'color', colors(i, :));
            hold on
            
        end
    else
        for i = 1:obj.amount_of_data
        
            obj.pl(i) = plot(obj.data{i}.time, obj.data{i}.values, 'color', colors(i, :));
            hold on
            
        end
    end
    
    % Turn on grid if requested
    if obj.use_grid_on
       grid on; 
    end
    
    if obj.use_title
        title({obj.title},   'Interpreter', 'latex', 'fontsize', obj.font_size.title);
    end
    
    if obj.use_legend
        legend(obj.extract_legends(),   'Interpreter', 'latex', 'fontsize', obj.font_size.legend, 'location', 'best');
    end
    
    if obj.use_ylabel
        ylabel({obj.ylabel}, 'Interpreter', 'latex');
    end
    
    if obj.use_xlabel
        xlabel({obj.xlabel}, 'Interpreter', 'latex');
    end
    
    % Set font size for axis
    
    xl = get(gca,'XLabel');
    %xlFontSize = get(xl,'FontSize');
    xAX = get(gca,'XAxis');
    set(xAX,'FontSize', obj.font_size.ticklabel)
    set(xl, 'FontSize', obj.font_size.xlabel);
    
    yl = get(gca,'YLabel');
    %ylFontSize = get(yl,'FontSize');
    yAX = get(gca,'YAxis');
    set(yAX,'FontSize', obj.font_size.ticklabel)
    set(yl, 'FontSize', obj.font_size.ylabel);
    set(gca, 'TickLabelInterpreter', 'latex');
    
    if obj.use_thick_lines
        set(obj.pl, 'LineWidth', 2);
    end
    
end

