%{	
2.17. Using the function normspec, find the probability that 
the random variable defined in Example 2.5 assumes a value that is 
less than 3. What is the probability that the same random variable 
assumes a value that is greater than 5? 
Find these probabilities again using the function normcdf.
%}



% linie de comanda
SPEC = [-5 5]
normspec(SPEC, 0, 5)