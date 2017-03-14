/*
D1. Program care primeste ca argument in linia de comanda un
 director si afisaza arborescenta de directoare si fisiere cu originea
 in el (similar comenzii arbore /f din DOS).*/
 
#include <stdio.h>
#include <sys/types.h>
#include <dirent.h>
#include <sys/stat.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <limits.h>

int arbore(char* string){
	DIR* director=NULL;
 	int spatiu = 1;
	char cale[PATH_MAX];
	if((director = opendir(string)) == NULL){
		perror(string); 
		return -1;
	}
	strcpy(cale, string);
	if(strlen(cale) > 0 && cale[strlen(cale)-1] != '/')
		strcat(cale, "/");
	struct dirent *intrareDirector;
	while((intrareDirector = readdir(director)) != NULL){
		if(strcmp(intrareDirector->d_name, ".") == 0 || strcmp(intrareDirector->d_name, "..") == 0) 
			continue;
		struct stat entryStatus;
		char caleNoua[PATH_MAX];
		strcpy(caleNoua, cale);
		strcat(caleNoua, intrareDirector->d_name);
		if(stat(caleNoua, &entryStatus) == -1){
			perror(cale);
			continue;
		}
		if(S_ISDIR(entryStatus.st_mode)){
			int i;
			for(i = 0; i < spatiu; ++i)
				printf("  ");
			printf("%s",intrareDirector->d_name);
			printf("\n");
			spatiu++;
			arbore(caleNoua);
			spatiu--;
		}
		else{
			int i;
			for(i = 0; i < spatiu; ++i)
				printf("  ");
			printf("%s\n", intrareDirector->d_name);
		}
	}
	closedir(director);
	return 0;
}



int main(int argc, char **argv){
	if (argc!=2){
	fprintf(stderr,"\nPrea putine argumente!\n");
	return -1;
	}
	arbore(argv[1]);
	return 0;
}
