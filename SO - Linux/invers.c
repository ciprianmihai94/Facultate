#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <limits.h>
#include <string.h>
int main(int argc, char * argv[]){
    int aux;
    int base;
    char *endptr,*parametru;
    long val, invers=0;

    if (!(argc==2 || argc==3)) {
               //printf("Eroare: functia primeste maxim 2 parametrii. Apelul se va face conform sintaxei: nume_functie parametru1 <parametru2>");
	       fprintf(stderr, "Utilizare: %s numar [baza]\n", argv[0]);
               return(1);
    }

    parametru = argv[1];
    base = (argc > 2) ? atoi(argv[2]) : 10;    
    val = strtol(parametru, &endptr, base);

    if (val == LONG_MAX || val == LONG_MIN || val == 0 || *endptr!='\0' || strcmp(argv[1],"")==0){
        perror("strtol");
	fprintf(stderr,"%s nu este numar valid\n",argv[1]);
        return(1);
    }
   
    aux=val;

    while(aux!=0)
    {
        invers=invers*10+aux%10;
        aux=aux/10;
    }
    printf("Inversul lui %ld este: %ld\n",val,invers);
    
    return(0);     
}












// if (endptr == parametru) {
//        printf("Nu s-au gasit cifre pentru numar");
//        return (1);
//    }
