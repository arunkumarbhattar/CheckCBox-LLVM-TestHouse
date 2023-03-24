//
// Created by supercharger on 3/16/23.
//

#ifndef MYPROJECT_MEMORYPROFILER_H
#define MYPROJECT_MEMORYPROFILER_H
#include <cstddef>
#include <stdlib.h>
#include <iostream>
#include <assert.h>
using namespace std;
struct MmapChunk{
    void* ChunkStartingAddress;
    size_t ChunkSize;
    MmapChunk* left;
    MmapChunk* right;

    MmapChunk(void* address, size_t size, MmapChunk* left = nullptr, MmapChunk* right = nullptr) {
        this->ChunkStartingAddress = address;
        this->ChunkSize = size;
        this->left = left;
        this->right = right;
    }
    MmapChunk() {
        this->ChunkStartingAddress = NULL;
        this->ChunkSize = 0;
        this->left = NULL;
        this->right = NULL;
    }
};

extern MmapChunk* MmapChunkRoot;
extern MmapChunk* CoalescedMmapChunkRoot;
extern MmapChunk* Cache;
extern long lowerbound_1;
extern long upperbound_1;
extern long lowerbound_2;
extern long upperbound_2
;
extern "C" void CacheUpdateandCheck(void* Address);
 MmapChunk* createNode(void* MmapAddress, size_t MmapSize);
 MmapChunk* insertNode(MmapChunk* root, void* MmapAddress, size_t MmapSize);
MmapChunk* findNode(MmapChunk* root, void* MmapAddress);
 MmapChunk* findParent(MmapChunk* root, void* MmapAddress);
 MmapChunk* findMin(MmapChunk* root);
 MmapChunk* RecursivereduceNodeSzOrDelete(MmapChunk* root, void* MmapAddress, size_t MmapSize);
void printTree(MmapChunk* node, int level);
void reduceNodeSizeOrRemove(MmapChunk** root, void* MmapAddress, size_t MmapSize);
MmapChunk* reduceTree(MmapChunk* root);
MmapChunk* cloneBinaryTree(MmapChunk* root);
void deleteTree(MmapChunk* node);
#endif //MYPROJECT_MEMORYPROFILER_H
