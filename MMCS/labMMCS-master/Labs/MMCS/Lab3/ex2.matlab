%{
When a random variable is equally likely to be either positive or negative, then the Laplacian or the double exponential distribution can be used to model it. 
The Laplacian probability density function for λ > 0 is given by

f(x) = 1/2 λe ^ ( –λ|x| )￼ ￼ ; –∞ < x < ∞.


a. Derive the cumulative distribution function for the Laplacian.
b. Write a MATLAB function that will evaluate the Laplacian proba- bility density function for given values in the domain.
c. Write a MATLAB function that will evaluate the Laplacian cumu- lative distribution function.
d. Plot the probability density function when λ = 1 .
%}


function [f] = functie (nr, lambda)
	f = (1/2) * lambda * exp(-lambda * abs(nr));

end

% linie de comanda
quad(@(x)functie(x, 1), -5, 5)

% Grafic
x = -5:0.1:5;
y = functie(x,1);
plot(x,y,'.b');