function solLab5()
% Solutia aplicatiilor din Laboratorul nr. 5

clear
clc

n = 1000; % dimensiunea esantionului/multimii de valori de selectie
% Testati pentru n = 10000. Observati o imbunatatire a estimarii!

m = 3; % numarul de valori pe care le poate lua v.a. X
X = [0 1 2]; % valorile x1, x2, x3 pe care le poate lua v.a. X
p = [0.3 0.2 0.5]; % probabilitatile p1, p2, p3; p(i) = P(X = xi) = pi


% 2. Apelati functia creata la punctul 1. pentru a genera o multime de 1000
% de valori de selectie asupra v.a. discrete definite in Exemplu 1. 
% Validati rezultatul obtinut construind histograma asociata multimii de 
% selectie.

% Multimea esantion asociata variabilei discrete X

x = zeros(1, n);
for i = 1 : n
    x(i) = simVarDiscreta(X, p);
end

% Histograma esantionului generat in x.
% Se estimeaza probabilitatile pi = P(X = xi) cu frecventa relativa de 
% aparitie a evenimentului X = xi

C = 0 : m - 1;
N = zeros(size(C));

for i = 1 : m 
    
    N(i) = sum(x == i - 1);
    
end

figure(1)
bar(C, N/n, 1, 'w')
title('Histograma asociata variabilei aleatoare discrete X')
xlabel('X')
ylabel('Frecventa relativa')
hold on
% Valorile teoretice ale probabilitatilor pi = P(X = xi)
plot(C, p, '*');

% 3. Apelati functia creata la punctul 1. pentru a simula v.a. X ~ Bin(10, 0.5).
% Validati rezultatul obtinut construind histograma asociata multimii de selectie
% generate in concordanta cu repartitia Bin(10, 0.5).

% clear
% 
% X = 0 : 10;
% p = binopdf(X, 10, 0.5);
% 
% n = 1000;
% x = zeros(1, n);
% for i = 1 : n
%     x(i) = simVarDiscreta(X, p);
% end
% 
% C = 0 : 10;
% N = zeros(size(C));
% 
% for i = 1 : length(C) 
%     
%     N(i) = sum(x == i - 1);
%     
% end

% figure(2)
% bar(C, N/n, 1, 'w')
% title('Histograma asociata variabilei aleatoare discrete X \sim Bin(10, 0.5)')
% xlabel('X')
% ylabel('Frecventa relativa')
% hold on
% % Valorile teoretice ale probabilitatilor pi = P(X = xi)
% plot(C, p, '*');

end


% 1. Scrieti o functie care simuleaza v.a. discreta X.
% parametrul de intrare X este vectorul continand valorile pe care le poate 
% lua v.a. X: X = [x1 x2 ... xm]
% p este vectorul continand probabilitatile de aparitie a valorilor din X, 
%si anume p = [p1 p2 ... pm].

function x = simVarDiscreta(X, p)

u = rand(1);

indice = find(u <= cumsum(p));
x = X(indice(1));

end









