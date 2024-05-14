#include <stdio.h>
#include <stdlib.h>
#include "f.h"
int main(int argc, char *argv[]){
	if (argc < 3){
		printf("Arg missing.\n");
		return -1;
	}

    int num;

    if (sscanf(argv[2], "%d", &num) != 1) {
        printf("Invalid argument: %s\n", argv[1]);
        return -1;
    }
	char* result = f(argv[1], num);
	printf("%s\n", result);
	return 0;
}