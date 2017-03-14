%{
2.12. Using normpdf or csnormp, find the value of the probability 
density for N(0,1) at ±∞. Use a small (large) value of x for –∞ (∞).
%}

function [f] = functie (x, U, O)

f = (1 / (sqrt(O) * sqrt(2 * pi))) * exp ( (- (x - U)^2 ) / 2 * O ^ 2 );

end

% linie de comanda
quad(@(y)functie(y, 1), -5, 5)

% Grafic
x = 0:0.1:5;
y = functie(x,1);
plot(x,y,'.b');