function scheletDeCod_Lab6()

clear
clc

% Parametrul variabilei Laplace
lambda = 2;

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

% Punctul 2: Apelati functia creata la punctul 1. pentru a genera o multime
% de 1000 de valori de selectie asupra v.a. Laplace.

n = 1000; % dimensiunea multimii de valori de selectie
X = zeros(1, n);
for i = 1 : n
    % COMPLETATI!!!
    X(i) = 
end


%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

% Punctul 3: Studiati multimea de valori de selectie obtinuta la punctul 2.
% folosind cele trei metode de validare a algoritmilor de simulare descrise
% in curs:

% 3 (a) - Histograma - o validare empirica a algoritmului de simulare

k = floor(1 + log2(n)); % numarul de dreptunghiuri
[N C] = hist(X, k);
bar(C, N/(n * (C(2) - C(1))), 1, 'w');

hold on
% Adaugam in acelasi grafic cu histograma densitatea de repartitie a
% variabilei Laplace
x = min(X) : 0.1 : max(X);
% COMPLETATI!!!
plot()

%--------------------------------------------------------------------------

% 3 (b) - Testul bazat pe momentele de selectie

% Media si dispersia variabilei Laplace - valorile teoretice
mediaTeoretica = 0;
dispersiaTeoretica = 2/(lambda^2);

% Media de selectie si dispersia de selectie ale variabilei Laplace 
% Se poate folosi functia mean - vezi help
% COMPLETATI!!!
mediaEstimata =
% Se poate folosi functia var - vezi help
% COMPLETATI!!!
dispersiaEstimata = 

eroareMedia = abs(mediaEstimata - mediaTeoretica);
eroareDispersia = abs(dispersiaEstimata - dispersiaTeoretica);

% Considerati n = 10000, observati ca erorile vor scadea!

%--------------------------------------------------------------------------

% 3 (c) - Testul X^2

%Observatii: 

% Vectorul N returnat de functia hist contine N = [f1, f2, ..., fk].

% Punctele a1, a2, ..., ak pot fi obtinute translatand la dreapta cu o
% jumatate de interval (adica (C(2) - C(1))/2 ) punctele asociate centrelor
% intervalelor de la baza; centrele sunt returnate in vectorul C de catre 
% functia hist. Definim vectorul a = [a1, a2, ..., ak]
a = C + (C(2) - C(1))/2;

% Construim vectorul p = [p1, p2, ..., pk]
p = zeros(1, k);
% COMPLETATI!!!
p(1) = 
for i = 2 : k - 1
    % COMPLETATI!!!
    p(i) = 
end
% COMPLETATI!!!
p(k) = 

% Calculam statistica X^2
X2 = sum(((N - n * p) .^ 2) ./ (n * p));

% cuantila superioara de ordin 1 - alpha a variabilei chi2 (hi patrat), 
% notata 'prag', unde alpha este o valoare mica
% k - 1 reprezinta numarul gradelor de libertate
alpha = 0.01;
prag = chi2inv(1 - alpha, k - 1);

% Testul X^2
if X2 <= prag
    disp('Acceptam ipoteza nula: X are functia de repartitie F(x)')
else
    disp('Respingem ipoteza nula')
end

end

% Punctul 1: Functia pentru simularea variabilei aleatoare Laplace

function X = simLaplace(lambda)

% Se implementeaza metoda compunerii - vezi slide-ul 14 din Cursul nr. 4

% Pas 1
U = rand(1);

% Pas 2 - Pas 4
if U <= 0.5
    % COMPLETATI!!!
    s = 
else
    % COMPLETATI!!!
    s =
end

% Pas 5
% se simuleaza variabila X1 ~ Exp(lambda) - se poate folosi functia
% implementata in Laborator 4 sau functia 'exprnd' (vezi help)
% COMPLETATI!!!
X1 = 

% Pas 6
X = s * X1;

end

% Functie ce calculeaza valoarea functiei de repartitie Laplace intr-un
% punct x
function rez = F(x, lambda)

% COMPLETATI!!!

end




