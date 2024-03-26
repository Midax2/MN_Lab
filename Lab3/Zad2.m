function Zad2
    N = 1000:1000:8000;
    n = length(N);
    vtime_direct = ones(1,n); 
    for i = 1:n
        [A,b,x,time_direct,err_norm,index_number] = solve_direct(N(i));
        vtime_direct(i) = time_direct;
    end
    plot_direct(N, vtime_direct);
end

function plot_direct(N, vtime_direct)
    % N - wektor zawierający rozmiary macierzy dla których zmierzono czas obliczeń metody bezpośredniej
    % vtime_direct - czas obliczeń metody bezpośredniej dla kolejnych wartości N
    plot(N, vtime_direct);
    xlabel("Size");
    ylabel("Time [s]");
    title("Time of Direct Method");
end