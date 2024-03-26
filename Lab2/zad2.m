function zad2()
r_max = 2;
n_max = 200;
a = 10;
[circles, index_number, circle_areas] = generate_circles(a, r_max, n_max);
end
function [circles, index_number, circle_areas] = generate_circles(a, r_max, n_max)
    index_number = 196751;
    circles = [];
    circle_areas = [];
    areas = [];
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
            areas = [areas; pi * rs^2];
            circle_areas = cumsum(areas);
            i = i + 1;
        end
        
    end
end