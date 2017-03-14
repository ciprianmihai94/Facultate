/*A17. Scrieti un program care sa verifice daca schimbandu-si valoarea
 variabilei de environment PWD, functia getcwd returneaza acelasi director
 curent.*/

 #include <stdio.h>
 #include <string.h>
 #include <unistd.h>
 #include <stdlib.h>
 #include <limits.h>
 
 #define CALE 255
 
 int main(int argc, char** argv){
    char cwd[CALE], nwd[CALE], t[CALE], var[CALE];
    getcwd(cwd, sizeof(cwd));
    printf("CWD: %s\n", cwd);
    printf("PWD: %s\n", (char *)getenv("PWD"));
    printf("PWD nou: ");
    fgets(t, PATH_MAX-1, stdin);
    strcpy(var, "PWD=");
    strcat(var, t);
    putenv(var);
    printf("PWD=%s\n", (char *)getenv("PWD"));
    getcwd(nwd, sizeof(nwd));
    printf("getcwd dupa modificarea PWD: %s\n", nwd);
    if(strcmp(nwd, cwd) == 0) printf("Nu se modifica\n");
    	else printf("Se modifica\n");
    return 0;
 }
 
/*** ATENTIE !!!!!!!!!!!!!!!!!!!!! Intentionat am lasat #define CALE 255. Va va pune sa modificati !!!
De fata cu el, stergeti #define CALE 255, iar in locul sintagmei CALE din cod, scrieti PATH_MAX+1 !!!
***/

