function [xsolution,ysolution,iterations,xtab,xdif] = bisection_method(a,b,max_iterations,ytolerance,fun)
% a - lewa granica przedziału poszukiwań miejsca zerowego
% b - prawa granica przedziału poszukiwań miejsca zerowego
% max_iterations - maksymalna liczba iteracji działania metody bisekcji
% ytolerance - wartość abs(fun(xsolution)) powinna być mniejsza niż ytolerance
% fun - nazwa funkcji, której miejsce zerowe będzie wyznaczane
%
% xsolution - obliczone miejsce zerowe
% ysolution - wartość fun(xsolution)
% iterations - liczba iteracji wykonana w celu wyznaczenia xsolution
% xtab - wektor z kolejnymi kandydatami na miejsce zerowe, począwszy od xtab(1)= (a+b)/2
% xdiff - wektor wartości bezwzględnych z różnic pomiędzy i-tym oraz (i+1)-ym elementem wektora xtab; xdiff(1) = abs(xtab(2)-xtab(1));

xsolution = [];
ysolution = [];
iterations = [];
xtab = [];
xdif = [];
count = 0;
while true
    count = count + 1;
    c = (a + b) / 2;
    xtab = [xtab; c];
    [r, t] = size(xtab);
    if r >= 2
        xdif = [xdif; abs(xtab(r, 1) - xtab(r - 1, 1))];
    end
    if abs(fun(c)) < ytolerance
        xsolution = [xsolution, c];
        ysolution = [ysolution, fun(c)];
        iterations = [iterations, count];
        count = 0;
        break;
    elseif fun(a) * fun(c) < 0
        b = c;
    else
        a = c;
    end
    if count == max_iterations
        break
    end
end
end
