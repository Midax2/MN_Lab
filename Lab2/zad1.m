function zad1()
format compact

n_max = 200;
a = 100;
r_max = a/2; 

[circles, index_number] = generate_circles(a, r_max, n_max);
plot_circles(a, circles, index_number); 
print -dpng zadanie1.png 
end

function [circles, index_number] = generate_circles(a, r_max, n_max)
    index_number = 196751;
    circles = [];
    i = 1;
    while i <= n_max
        isInter = false;
        rs = rand() * r_max;
        X = rand() * (a - 2 * rs) + rs;
        Y = rand() * (a - 2 * rs) + rs;
        for j = 1:size(circles, 2)
            r1 = circles(1, j);
            x1 = circles(2, j);
            y1 = circles(3, j);
            r2 = rs;
            x2 = X;
            y2 = Y;
            dis = sqrt((x2 - x1)^2 + (y2 - y1)^2);
            if dis < r1 + r2
                isInter = true;
                break;
            end
        end
        if ~isInter
            circles = [circles, [rs; X; Y]];
            i = i + 1;
        end
    end
end

function plot_circles(a, circles, index_number)
    axis equal;
    axis([0 a 0 a]);
    hold on;
    for i = 1:size(circles, 2)
        plot_circle(circles(1, i), circles(2, i), circles(3, i));
    end
    hold off;
end