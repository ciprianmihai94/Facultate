%{	
	Metoda inversa de generare
		
		f(x) =  la * e^(la*x), x  > 0
				0		   , X <= 0		

		P(X <= x) = F(x) = integrala de la -∞ la x [ f(x) dt ]  

					F(X) = integrala de la -∞ la x [ f(t) dt ]
						 = integrala de la -∞ la 0 [ f(t) dt ] + integrala de la 0 la x [ f(t) dt ]
						 = integrala de la 0 la x [ la * e^(-la * t) dt]
						 = -(e^-(la * t)'| 0 la x
						 = 1 - e^(-la * x)

		F(x) = 1 - e^(- la * x) , X  > 0
			   0				, X <= 0


	Teorema lui Hincin (la = lambda)
		Pentru o variabila care are o functie de repartitie inversabila, o selectie poate fi obitnuta daca generam o variabila uniforma pe (0,1).

			U ~ u(0,1) (U = rand(1)) => X = F ^ -1 (U) => x = F^-1(U)

			F^-1(y) = - (1 / la * ln(1 - y)) 			F^-1 : [0,1] -> R
%}

function [ y ] = functie_inv (U, la)

	
	y = - (1/la) * log(1 - U)

end

u = rand(1, 1000);
[y] = functie_inv(u, 1);
[N X] = hist(y, 15);
bar(X, N, 1, 'b');c


z = exppdf(u, 1);
subplot(1, 2, 2);
hist(y, 15);
subplot(1, 2, 1);
hist(z, 15);

