#include "Tainted.h"
void BasicSbxCallThatJustReturns()
{
	return ;
}

void simple(void)
{
        int* ptr = (int*)malloc(1);
        ptr = (int*)calloc(2, sizeof(int));
        ptr = realloc(ptr, 1 * sizeof(int));
        free(ptr);
}

