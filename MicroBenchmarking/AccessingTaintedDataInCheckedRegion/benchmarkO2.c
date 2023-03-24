//
// Created by arun on 3/22/23.
//

#include "benchmarkO2.h"

int main()
{
    int arr[SIZE];
    int i;
    clock_t start, end;
    double time_taken;

    // initialize array with random numbers
    for(i = 0; i < SIZE; i++) {
        arr[i] = rand() % 1000;
    }

    // benchmark sorting algorithm
    start = clock();
    for(i = 0; i < SIZE - 1; i++) {
        int j, min_idx = i;
        for(j = i + 1; j < SIZE; j++) {
            if(arr[j] < arr[min_idx]) {
                min_idx = j;
            }
        }
        int temp = arr[i];
        arr[i] = arr[min_idx];
        arr[min_idx] = temp;
    }
    end = clock();

    time_taken = ((double)(end - start))/CLOCKS_PER_SEC;
    printf("Time taken: %f seconds\n", time_taken);

    return 0;
}