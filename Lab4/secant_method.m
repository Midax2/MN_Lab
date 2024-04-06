function [xsolution,ysolution,iterations,xtab,xdif] = secant_method(a,b,max_iterations,ytolerance,fun)
% a - lewa granica przedziału poszukiwań miejsca zerowego (x0=a)
% b - prawa granica przedziału poszukiwań miejsca zerowego (x1=b)
% max_iterations - maksymalna liczba iteracji działania metody siecznych
% ytolerance - wartość abs(fun(xsolution)) powinna być mniejsza niż ytolerance
% fun - nazwa funkcji, której miejsce zerowe będzie wyznaczane
%
% xsolution - obliczone miejsce zerowe
% ysolution - wartość fun(xsolution)
% iterations - liczba iteracji wykonana w celu wyznaczenia xsolution
% xtab - wektor z kolejnymi kandydatami na miejsce zerowe, począwszy od x2
% xdiff - wektor wartości bezwzględnych z różnic pomiędzy i-tym oraz (i+1)-ym elementem wektora xtab; xdiff(1) = abs(xtab(2)-xtab(1));

xsolution = [];
ysolution = [];
iterations = [];
xtab = [];
xdif = [];

count = 0;
while true
    count = count + 1;
    c = b - ((fun(b) * (b - a))/(fun(b) - fun(a)));
    xtab = [xtab; c];
    [r, t] = size(xtab);
    if r >= 2
        xdif = [xdif; abs(xtab(r, 1) - xtab(r - 1, 1))];
    end
    if abs(fun(c)) < ytolerance || count == max_iterations
        xsolution = [xsolution, c];
        ysolution = [ysolution, fun(c)];
        iterations = [iterations, count];
        count = 0;
        break;
    end
    a = b;
    b = c;
end

end
