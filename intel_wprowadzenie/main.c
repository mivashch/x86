#include <stdio.h>
#include "f.h"
int main(int argc, char *argv[]){
	if (argc < 2){
		printf("Arg missing.\n");
		return -1;
	}
	f(argv[1]);
	printf("%s\n", argv[1]);
	return 0;
}
