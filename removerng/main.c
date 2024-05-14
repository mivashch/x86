#include <stdio.h>
#include "f.h"
int main(int argc, char *argv[]){
	if (argc < 2){
		printf("Arg missing.\n");
		return -1;
	}
	char* result = f(argv[1], argv[2][0], argv[3][0]);
	printf("%s\n", result);
	return 0;
}