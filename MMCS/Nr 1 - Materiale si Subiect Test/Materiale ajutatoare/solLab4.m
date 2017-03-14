function solLab4()
% Solutia aplicatiilor propuse in Laboratorul 4

% Aplicatii - Generarea numerelor aleatoare (numerelor uniforme)

% Fie U ~ U(a, b), a < b.

%--------------------------------------------------------------------------

% 2. Aplicati functia 'my_rand' pentru a genera o multime de numere aleatoare
% uniforme pe [-2, 2] avand 1000 de elemente.

n = 1000;
a = -2;
b = 2;
A = my_rand(a, b, 1, n);

%--------------------------------------------------------------------------

% 3. Reprezentati grafic histograma asociata multimii de valori de selectie
% generate la punctul 2.

figure(1)
[N, X] = hist(A, 15);
% A: multimea esantion
% 15 reprezinta numarul de dreptunghiuri ale histogramei
% N: vector continand numarul de elemente din fiecare dintre dreptunghiuri
% X: vector continand centrele dreptunghiurilor
% Folosirea functiei 'bar' pentru reprezentarea grafica a histogramei.
bar(X, N, 1, 'w')
title('Histograma asociata unei variabile aleatoare uniforme')
xlabel('X')
ylabel('Frecventa absoluta')

%--------------------------------------------------------------------------

% 4. Calculati P(U apartine intervalului (i, i + 0.1]) considerand pe rand
% i = -2,-1.9,...,1.8, 1.9. Interpretati rezultatele obtinute.

i = -2 : 0.1 : 1.9;
P = zeros(size(i));

for l = 1 : length(P)
    
    P(l) = (i(l) + 0.1 - i(l)) / (b - a);
    
end

% Probabilitatea ca o v.a. uniforma sa apartina unui interval [u1, u2] 
% inclus in [a, b] este proportionala cu lungimea intervalului; 
% in cazul nostru lungimile intervalelor studiate sunt egale cu 0.1.

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

% Aplicatii - Metoda inversa

% 1. Fie X ~ Exp(lambda)

%--------------------------------------------------------------------------

% (b) Apelati functia definita la punctul (a) pentru lambda = 1si n = 1000.
lambda = 1;
n = 1000;
X = myExp(n, lambda);

%--------------------------------------------------------------------------

% (c) Realizati histograma asociata multimii de valori de selectie generate la
% punctul (b). Scalati inaltimile dreptunghiurilor astfel incat suma ariilor
% tuturor dreptunghiurilor sa fie 1 - vezi Curs 4.

figure(2)
[N, C] = hist(X, floor(1 + log2(n)));
% X: multimea esantion
% k = floor(1 + log2(n)) reprezinta numarul de dreptunghiuri ale histogramei
                       % vezi Regula lui Sturges 
% N: vector continand numarul de elemente din fiecare dintre dreptunghiuri.
% C: vector continand centrele dreptunghiurilor
% Folosirea functiei 'bar' pentru reprezentarea grafica a histogramei.
bar(C, N/(n * (C(2) - C(1))), 1, 'w')
title('Histograma asociata unei variabile aleatoare exponentiale')
xlabel('X')
ylabel('Valoarea estimata a densitatii de repartitie f_X(x)')

%--------------------------------------------------------------------------

% (d) Reprezentati grafic curba densitatii de repartitie a variabilei X. Curba
% densitatii va fi reprezentata in aceeasi fereastra cu graficul histogramei.
hold on
x = min(X) : 0.1 : max(X);
plot(x, exppdf(x,1/lambda));

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

% 2. Fie X ~ Exp(lambda) si Y = e^{X} (Y = exp(X))

% (a) Se arata prin calcul.

%--------------------------------------------------------------------------

% (c) Apeland functia implementata la punctul (b), generati o multime de 
% valori de selectie asupra variabilei Y continand 1000 de valori.

n = 1000;
lambda = 5;
Y = simY(n, lambda);

%--------------------------------------------------------------------------

% (d) Realizati histograma asociata multimii generate la punctul (c). 
% Adaugati in acest grafic curba densitatii de repartitie a variabilei Y.

figure(3)
[N, C] = hist(Y, floor(1 + log2(n)));
bar(C, N/(n * (C(2) - C(1))), 1, 'w')
title('Histograma asociata variabile aleatoare Y = exp(X)')
xlabel('Y')
ylabel('Valoarea estimata a densitatii de repartitie f_Y(x)')

% Reprezentarea grafica a densitatii de repartitie a variabilei Y, definita
% prin f_Y(x) = F'(x) = lambda * (x^(-lambda - 1)), unde 
hold on
x = min(Y) : 0.01 : max(Y);
plot(x, lambda * x.^(-lambda - 1), 'r');
hold off

%--------------------------------------------------------------------------

% (e) Scrieti o functie pentru generarea a 1000 de valori de selectie asupra
% variabilei Y folosind definitia variabilei (adica, Y = e^{X})si multimea 
% de valori de selectie generata la punctul 1(b).

Y = exp(myExp(n, lambda));

% (f) Realizati histograma asociata multimii generate la punctul (e). 
% Adaugatin acest grafic curba densitatii de repartitie a variabilei Y .

figure(4)
[N, C] = hist(Y, floor(1 + log2(n)));
bar(C, N/(n * (C(2) - C(1))), 1, 'w')
title('Histograma asociata variabile aleatoare Y = exp(X)')
xlabel('Y')
ylabel('Valoarea estimata a densitatii de repartitie f_Y(x)')

% Reprezentarea grafica a densitatii de repartitie a variabilei Y, definita
% prin f_Y(x) = F'(x) = lambda * (x^(-lambda - 1)), unde 
hold on
x = min(Y) : 0.01 : max(Y);
plot(x, lambda * x.^(-lambda - 1), 'r');

% Comparati histogramele obtinute la punctele (d) si (f).

% Raspuns: Graficele sunt asemanatoare, deoarece formula de calcul a lui Y
% este aceeasi; inlocuind in Y = e^X, v.a. X ~ Exp(lambda), definita prin
% X = -1/lambda * log(1 - U) (conform metodei inverse); 1 - U poate fi 
% inlocuit cu U. 
% Atentie: numerele aleatoare (valorile uniforme) generate pentru calculul 
% variabilei Y folosind metoda inversa pot fi diferite de numerele aleatoare
% generate pentru calculul variabilei X ~ Exp(lambda) si ulterior pentru 
% calcului variabilei Y = e^X. De aceea, graficele nu sunt identice, dar
% deoarece numarul de valori de selectie (n = 1000) generate este suficient 
% de mare ambele histograme ofera o buna estimare a curbei densitatii de
% repartitie.

end

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

% 1. Scrieti o functie care genereaza o matrice A de numere aleatoare uniforme
% pe intervalul [a, b]. 
% m si n reprezinta numarul de linii, respectiv numarul de coloane ale
% matricei A returnata de functia 'my_rand'.

function A = my_rand(a, b, m, n)

A = (b - a) * rand(m, n) + a;

end

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

% Functii -- metoda inversa

% (a) Scrieti o functie care genereaza n valori de selectie asupra variabilei X,
% folosind metoda inversa.

function X = myExp(n, lambda)

X = -1/lambda * log(rand(1,n));

end

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

% (b) Scrieti o functie pentru simularea variabilei Y folosind functia de 
% repartitie determinata la punctul (a)si metoda inversa.

% Y = F^{-1}(u) = (1/(1 - u))^(1/lambda)

function Y = simY(n, lambda)

Y = (1./(1 - rand(1, n))) .^ (1/lambda);

end




