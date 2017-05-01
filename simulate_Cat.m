function [x, y] = simulate_Cat(x1, x2, y1, y2, fine, initial_length)


points_x = linspace(x1, x2, fine);
points_y = linspace(y1, y2, fine);


for it = 1:fine-1
    springs(it) = Spring;
    springs(it).x_1 = points_x(it);
    springs(it).x_2 = points_x(it+1);
    springs(it).y_1 = points_y(it);
    springs(it).y_2 = points_y(it+1);
    springs(it).r = (springs(it).calcLen()+initial_length)/fine;
    springs(it).k = 1.01;
end

final_length1 = 0;
for it = 1:(fine-1)
    final_length1 = final_length1 + springs(it).calcLen;
end
final_length1;
time = 1000;

for it = 1:time
    for p_it = 2:fine-1
 
%         dist_L = sqrt((points_x(p_it-1)-points_x(p_it))^2+(points_y(p_it-1)-points_y(p_it))^2);
%         spring_L = sqrt((springs(p_it-1).x_1-springs(p_it-1).x_2)^2+(springs(p_it-1).y_1-springs(p_it-1).y_2)^2);
        force1_mag = springs(p_it-1).calcForce();
        force1_V = [-(springs(p_it-1).x_1-springs(p_it-1).x_2), (springs(p_it-1).y_1-springs(p_it-1).y_2)]/springs(p_it-1).calcLen*force1_mag;
        
        force2_mag = springs(p_it).calcForce();
        force2_V = [(springs(p_it).x_1-springs(p_it).x_2), (springs(p_it).y_1-springs(p_it).y_2)]/springs(p_it).calcLen*force2_mag;
%         springs = points_y(3)-.05;
        
        force_y = (-force2_V(2) + force1_V(2))-.001;
        force_x = (-force2_V(1) - force1_V(1));
        
        if (force_y > .01)
            force_y = .01;
        elseif force_y <-.01
            force_y = -.01;
        end
        
        if (force_x > .01)
            force_x = .01;
        elseif force_x <-.01
            force_x = -.01;
        end
        
        points_y(p_it) = points_y(p_it) + force_y;
        
        
        points_x(p_it) = points_x(p_it) + force_x;
        
        
        springs(p_it-1).x_2 = points_x(p_it);
        springs(p_it).x_1 = points_x(p_it);
        
        springs(p_it-1).y_2 = points_y(p_it);
        springs(p_it).y_1 = points_y(p_it);
   
        
    end
    
    plot(points_x, points_y)
    axis([-1, 1, -2, 1])
    grid on
    pause(.00001);
end

final_length = 0;
for it = 1:(fine-1)
    final_length = final_length + springs(it).calcLen;
end
final_length;
x = points_x;
y = points_y;
end
