function Zad9
% Definiowanie opcji dla funkcji fzero
options = optimset('Display','iter');

% Wyznaczanie miejsc zerowych funkcji tan(x) dla punktu startowego x0 = 6
[x1, fval1, exitflag1, output1] = fzero(@tan, 6, options);

% Wyznaczanie miejsc zerowych funkcji tan(x) dla punktu startowego x0 = 4.5
[x2, fval2, exitflag2, output2] = fzero(@tan, 4.5, options);

% Zapisywanie wyników do pliku zadanie9.txt
fileID = fopen('zadanie9.txt','w');
fprintf(fileID, 'Wyniki dla punktu startowego x0 = 6:\n');
fprintf(fileID, 'Miejsce zerowe: %.10f\n', x1);
fprintf(fileID, 'Wartość funkcji w miejscu zerowym: %.10f\n', fval1);
fprintf(fileID, 'Kod wyjścia: %d\n', exitflag1);
fprintf(fileID, 'Dodatkowe informacje: %s\n\n', output1.message);

fprintf(fileID, 'Wyniki dla punktu startowego x0 = 4.5:\n');
fprintf(fileID, 'Miejsce zerowe: %.10f\n', x2);
fprintf(fileID, 'Wartość funkcji w miejscu zerowym: %.10f\n', fval2);
fprintf(fileID, 'Kod wyjścia: %d\n', exitflag2);
fprintf(fileID, 'Dodatkowe informacje: %s\n\n', output2.message);

fclose(fileID);
end