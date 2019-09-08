function set_line_width(this, line_width)

    set(findall(this.fig, 'Type', 'Line'), 'LineWidth', line_width);

end

