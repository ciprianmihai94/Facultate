%{	
Generarea unor numere aleatoare folosint sintaxa rand(’state’,0).
Histograma: functia hist 		[N X] = hist(x, 15):
									15 - nr de dreptunghiuri
									returneaza N - frecvente absolute din fiecare interval
									X -> (OX) vector ce contine centrele intervalelor, X = [x2 x2 ... x15]
									N -> (OY) vector ce contine frecventele, 		   N = [f1 f2 ... f15]

pentru a vedea graficul, folosim functia BAR

%}

X = rand(1, 1000);
[N X] = hist(x, 15);
bar(X, N, 1, 'b')

X = [1 2 3];
Y = [0.1 0.2 0.3 0.4; 0.2 0.3 0.4 0.5; 0.3 0.4 0.5 0.6];
bar(X, Y);

x = rand(1, 1000);
[N X] = hist(x, 15);
bar(X, N, 1, 'r');