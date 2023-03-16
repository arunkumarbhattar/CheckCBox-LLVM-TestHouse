//#include <stdlib_tainted.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <stdlib_tainted.h>
extern void w2c_BasicSbxCallThatJustReturns();


double ReadingAndWritingToCheckedPtr100ktimes()
{
    clock_t start, end;
    double cpu_time_used;
    start = clock();
    int* pVal = (int*)malloc(sizeof(int));
    *pVal = 0;
    for (int i = 0; i < 100000; i++)
    {
        *pVal += 1;
    }
    end = clock();
    cpu_time_used = ((double) (end-start)) / CLOCKS_PER_SEC;
    return cpu_time_used;


}
double ReadingAndWritingToTaintedPtr100ktimes()
{
    clock_t start, end;
    double cpu_time_used;
    start = clock();
    _TPtr<int> pVal = (_TPtr<int>)t_malloc(sizeof(int));
    *pVal = 0;
    for (int i = 0; i < 100000; i++)
    {
        *pVal += 1;
    }
    end = clock();
    cpu_time_used = ((double) (end-start)) / CLOCKS_PER_SEC;
    return cpu_time_used;
}
int main() {

    for (int i = 0 ; i < 10; i++)
    {
        printf("******************Iteration: %d **************************\n", i+1);
        printf("ReadingAndWritingToCheckedPtr100ktimes takes %f seconds\n", ReadingAndWritingToCheckedPtr100ktimes());
        printf("ReadingAndWritingToTaintedPtr100ktimes takes %f seconds\n", ReadingAndWritingToTaintedPtr100ktimes());
        printf("**********************************************************\n");
    }

    return 0;

}
