%{
2.1. Write a function using MATLAB’s functions for numerical integration such as quad or quadl 
that will find P(X ≤ x) when the random variable is exponentially distributed with parameter λ . 
See help for information on how to use these functions.
%}

function [f] = functie (nr, lambda)

f = lambda * exp(-1 * nr);

end

% linie de comanda
quad(@(y)functie(y, 1), 0, 1)

% Grafic
x = 0:0.1:5;
y = functie(x,1);
plot(x,y,'.b');
