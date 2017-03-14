%{	
	Metoda inversa de calculare a densitatii de probabilitate
	
	lim (F(x+h) - F(x)) / x0 = F'(x) = f(x)
	x0->0
	
		F:R->[0,1], F(x) = P(X <= x) (X:Ω -> R)
	
		F -> functie de repartitie
		f -> densitate de probabilitate
		
		F(x+h) - F(x) = P(x <= x+h) - P(X <= x) = P(X ∈ (x, x+h) )
		{X <= x+h} = {X <= x} U x ∈ (x, x+h]}
		
		x = rand(1, 1000)
		[N h] = list(N1 N2 ... N15) <- frecvente absolute
		
		Ni  - reprezinta numarul de valori din vectorul (x) care ∈ intervalului i 
		si indica inaltimea unui dreptunghi
		    - se numeste frecventa absoluta
		
		H   - contine centrele fiecarui interval
		* bar - se construieste histograma
		
		|
		|
		|
	      Ni| ---------------________
		|		|	|
		0------------------|----->
		 0 1 h(z)..........i
		 
		 Mai sus am construit histograma frecventelor absolute.
		 
		 n = length(x) <- cate valori sunt in x (=1000), nr valorilor de selectie
		 
		 Frecvente relative
		 N = [N1/n N2/n ...N15/n] (=1)
		
		       P
		 Ni/n ---> P(X ∈ ( h(i) - (h(2) - h(1))/2, h(i) + (h(2) -h(1)/2)
		      n->∞
		 
		|
		|		
		|
	    Ni/h|----------------________
		|		|	|_______	
		|		|	|	|
		0------------------|-------|-----------|-------------------->
				| h(i) |  h(m)		h(15)
				x0	x+x0
				
		Cum gasim factorul de scalare a histogramei frecventelor relative. Daca f este densitate,
		atunci 
		
		∞
		∫ f(x) dt = F(∞) = 1
	       -∞
	       
	       Not l = h(2) - h(1)
	       
	       	N1/n * l + N2/n * l + ... + N15/n *l = l
	       	
	       -> Definim histograma asociata densitatii de probabilitate in care inaltimea dreptunghiului i devine 
	       Ni/n *l
	       
	       frecventa asociata densitatii	N = N|(n*l)
	       de probabilitate
	       				     -> bar(h, N, 1)

%}

u=rand(1, 10000);
x=functie_inv(u, 5);
[N h]= hist(x,15);
% bar(X,N,1, 'r')
X=0:0.1:1;
Y=exppdf(X,1/5);
% hold on

N=N/(length(x)*(h(2)-h(1)));
bar(h,N,1,'r');
hold on
plot(X,Y,'b')