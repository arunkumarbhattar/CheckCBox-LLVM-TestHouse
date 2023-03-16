#include "Tainted.h"
double MemoryAccessInLoop()
{
	clock_t start, end;
	double cpu_time_used;
	start = clock();
	double count = 1;
	double* pcount = (double*)malloc(sizeof(double));
	for (int i = 0; i < 100000; i++)
	{
		count += *pcount;
		*pcount = count;
	}
	end = clock();
	cpu_time_used = ((double) (end-start)) / CLOCKS_PER_SEC;
	return cpu_time_used;

}
void simple(void)
{
        int* ptr = (int*)malloc(1);
        ptr = (int*)calloc(2, sizeof(int));
        ptr = realloc(ptr, 1 * sizeof(int));
        free(ptr);
}

