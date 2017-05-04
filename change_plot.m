function change_plot(objHandle, ~)
slider_value = get(objHandle, 'Value');
new_A_t = slider_value;
update_plot(new_A_t);
pause(3000); %Arbitrarily large pause so weird 
              %buffer stuff doesn't happen.
