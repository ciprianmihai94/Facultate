/*
 * A13. Scrieti un program care verifica daca un numar apare sau 
 * nu intr-un vector (numarul se vectorul sunt dati ca argumente in linia
 * de comanda) printr-o strategie de tip divide et impera: se imparte
 * vectorul in doua, apoi se initiaza cate un proces fiu care cauta
 * numarul in fiecare jumatate, in aceeasi maniera; cele doua procese se
 * desfasoara in paralel. Fiecare subproces returneaza 0 = negasit, 1 =
 * gasit. Fiecare proces nu se termina pana nu i se termina toti fii si
 * in final returneaza suma valorilor returnate de ei. Procesul initial
 * trebuie in plus sa afiseze un mesaj de tip "gasit"/"negasit".
 */

#include <stdio.h>
#include <fcntl.h>
#include <signal.h>
#include <sys/wait.h>
#include <unistd.h>
#include <sys/types.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <limits.h>

long stol(char* string)
{
	char* eptr=NULL;
	long number = strtol(string, &eptr, 10);
	if (errno == ERANGE && (number == LONG_MAX || number == LONG_MIN || (errno !=0 && number == 0))){
		fprintf(stderr, "Eroare la strtol... \n");
		exit(-1);
	}
	
	if (strcmp(string,"")==0 || *eptr != '\0'){
		fprintf(stderr,"%s nu este valid\n",string);
		exit(-1);
	} 
	return number;
}

int check(pid_t pidret, int s)
{
    if (WIFEXITED(s))
	return WEXITSTATUS(s);
    return 0;
}

int divideEtImpera(long *vector, int stanga, int dreapta, long numar)
{

    if (stanga == dreapta)
		return vector[stanga] == numar;
    pid_t           f1,
                    f2;
    int             m = (dreapta + stanga)/2;
    errno = EAGAIN;
    while (errno == EAGAIN) {
	errno = 0;
	if (!(f1 = fork())) {
	    exit(divideEtImpera(vector, stanga, m, numar));
	}
    }
    errno = EAGAIN;
    while (errno == EAGAIN) {
	errno = 0;
	if (!(f2 = fork())) {
	    exit(divideEtImpera(vector, m + 1, dreapta, numar));
	}
    }
    pid_t           r1,
                    r2;
    int             status1,
                    status2;
    r1 = waitpid(f1, &status1, 0);
    r2 = waitpid(f2, &status2, 0);
    return check(r1, status1) + check(r2, status2);
}

int main(int argc, char **argv)
{
    long nr = 0, result = 0;
    long *vector;
    int i=0;
    
    if (argc==1){
    	fprintf(stderr,"\n\tPrea putine argumente. \n\n");
		return -1;    
	}
	
	if (argc==2){
		    stol(argv[1]);
			printf("Vectorul este vid.\n");
			exit(-1);
	}
    
    vector = (long *) malloc((argc - 2) * sizeof(long));
    nr = stol(argv[1]);
    for (i = 2; i < argc; ++i) 
		vector[i - 2] = stol(argv[i]);
	result=divideEtImpera(vector, 0, argc - 3, nr);
	free(vector);
	if (result > 0)
	    printf("\nGasit de %li ori.\n", result);
	else
	    printf("\n%li nu a fost gasit.\n", nr);
    return 0;
}
