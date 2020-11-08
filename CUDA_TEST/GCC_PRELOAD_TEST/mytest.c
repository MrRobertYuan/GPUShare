#include<stdio.h>
#include "mymalloc.h"

int main(){
	int* a = (int *)malloc(sizeof(int) * 50);
	if(a == NULL)
		printf("it works!");
	else
		printf("%ld\n",sizeof(a));
	return 0;
}
