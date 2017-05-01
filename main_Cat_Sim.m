clear all;
A_t = 15;

ff = figure;
axes('Parent',ff, 'units', 'normalized',...
    'position',[0.05 0.15  0.9 0.8])

update_plot(A_t);

b = uicontrol('Parent',ff,'Style','slider',...
    'value',A_t, 'min',5, 'max',30,...
    'units', 'normalized',...
    'position', [0.33 0 0.4 0.1],...
    'SliderStep', [0.001 0.1],...
    'callback', @change_plot);

disp_h = uicontrol('style', 'edit',...
    'units', 'normalized',...
    'position', [0.15 0.05 0.15 0.05]);


bgcolor = ff.Color;
