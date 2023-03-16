// -*- C++ -*-

/*

  Heap Layers: An Extensible Memory Allocation Infrastructure
  
  Copyright (C) 2000-2020 by Emery Berger
  http://www.emeryberger.com
  emery@cs.umass.edu
  
  Heap Layers is distributed under the terms of the Apache 2.0 license.

  You may obtain a copy of the License at
  http://www.apache.org/licenses/LICENSE-2.0

*/

#ifndef HL_MMAPWRAPPER_H
#define HL_MMAPWRAPPER_H

#include <assert.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>
#include <queue>
#include <iostream>

#if defined(_WIN32)
#include <windows.h>
#else
// UNIX
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <map>
#endif

#if defined(__SVR4)
// Not sure why this is needed for Solaris, but there it is.
extern "C" int madvise (caddr_t, size_t, int);
#endif

#if !defined(HL_MMAP_PROTECTION_MASK)
#if HL_EXECUTABLE_HEAP
#define HL_MMAP_PROTECTION_MASK (PROT_READ | PROT_WRITE | PROT_EXEC)
#else
#if !defined(PROT_MAX)
#define PROT_MAX(p) 0
#endif
#define HL_MMAP_PROTECTION_MASK (PROT_READ | PROT_WRITE | PROT_MAX(PROT_READ | PROT_WRITE))
#endif
#endif

#if !defined(MAP_ANONYMOUS) && defined(MAP_ANON)
#define MAP_ANONYMOUS MAP_ANON
#endif

namespace HL {
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
  extern MmapChunk* Cache;
  class MmapWrapper {
  public:


#if defined(_WIN32) 
  
    // Microsoft Windows has 4K pages aligned to a 64K boundary.
    enum { Size = 4 * 1024UL };
    enum { Alignment = 64 * 1024UL };

#elif defined(__SVR4)
    // Solaris aligns 8K pages to a 64K boundary.
    enum { Size = 8 * 1024UL };
    enum { Alignment = 64 * 1024UL };

#else
    // Linux and most other operating systems align memory to a 4K boundary.
    enum { Size = 4 * 1024UL };
    enum { Alignment = 4 * 1024UL };

#endif

    // Release the given range of memory to the OS (without unmapping it).
    void release (void * ptr, size_t sz) {
      if ((size_t) ptr % Alignment == 0) {
	// Extra sanity check in case the superheap's declared alignment is wrong!
#if defined(_WIN32)
	VirtualAlloc (ptr, sz, MEM_RESET, PAGE_NOACCESS);
#elif defined(__APPLE__)
	madvise (ptr, sz, MADV_DONTNEED);
	madvise (ptr, sz, MADV_FREE);
#else
	// Assume Unix platform.
	madvise ((caddr_t) ptr, sz, MADV_DONTNEED);
#endif
      }
    }

#if defined(_WIN32) 
  
    static void protect (void * ptr, size_t sz) {
      DWORD oldProtection;
      VirtualProtect (ptr, sz, PAGE_NOACCESS, &oldProtection);
    }

    static void unprotect (void * ptr, size_t sz) {
      DWORD oldProtection;
      VirtualProtect (ptr, sz, PAGE_READWRITE, &oldProtection);
    }

    static void * map (size_t sz) {
      void * ptr;
#if HL_EXECUTABLE_HEAP
      const int permflags = PAGE_EXECUTE_READWRITE;
#else
      const int permflags = PAGE_READWRITE;
#endif
      ptr = VirtualAlloc(nullptr, sz, MEM_RESERVE | MEM_COMMIT | MEM_TOP_DOWN, permflags);
      return  ptr;
    }

    static void unmap (void * ptr, size_t) {
      VirtualFree (ptr, 0, MEM_RELEASE);
    }

#else // UNIX

    static MmapChunk* createNode(void* MmapAddress, size_t MmapSize) {
        MmapChunk* NewChunk = (MmapChunk*)malloc(sizeof(MmapChunk));
        NewChunk->ChunkStartingAddress = MmapAddress;
        NewChunk->left = NULL;
        NewChunk->right = NULL;
        NewChunk->ChunkSize = MmapSize;
        return NewChunk;
    }

    static MmapChunk* insertNode(MmapChunk* root, void* MmapAddress, size_t MmapSize) {
        if (root == NULL) {
            root = createNode(MmapAddress, MmapSize);
            return root;
        }
        if (MmapAddress < (root->ChunkStartingAddress)) {
            root->left = insertNode(root->left, MmapAddress, MmapSize);
        }
        else {
            root->right = insertNode(root->right, MmapAddress, MmapSize);
        }
        return root;
    }

    static MmapChunk* findNode(MmapChunk* root, void* MmapAddress) {
        //This is the most critical function
        //It is called for every malloc and free
        //The MmapAddress necessarily need not be the same as the root->ChunkStartingAddress
        //It can be anywhere in the range of the chunk starting address and the chunk ending address (root->ChunkStartingAddress + root->ChunkSize)
        if (root == NULL) {
            return NULL;
        }
        //Check for Cache Hit (This is the most common case)
        if (Cache != NULL) {
            if ((MmapAddress > Cache->ChunkStartingAddress)
                && ((size_t)MmapAddress < ((size_t)Cache->ChunkStartingAddress + (size_t)Cache->ChunkSize))) {
                //cout << "CACHE HIT "<< endl;
                return Cache;
            }
        }

        if (MmapAddress == (root->ChunkStartingAddress)) {
            //This is pretty obvious
            //If this is a Cache Miss, we will have to update the cache
            //Check if this is a Cache Miss
            if (Cache != root) {
               // cout << "CACHE MISS "<< endl;
                Cache = root;
            }
            return root;
        }


        else if ((MmapAddress > root->ChunkStartingAddress)
        && ((size_t)MmapAddress < ((size_t)root->ChunkStartingAddress + (size_t)root->ChunkSize))) {
            //If this is a Cache Miss, we will have to update the cache
            //Check if this is a Cache Miss
            if (Cache != root) {
                //cout << "CACHE MISS "<< endl;
                Cache = root;
            }
            return root;
        }

        //else we need to recurse the entire tree look for the node
        if (MmapAddress < (root->ChunkStartingAddress)) {
            return findNode(root->left, MmapAddress);
        }
        else {
            return findNode(root->right, MmapAddress);
        }
    }

    static MmapChunk* findParent(MmapChunk* root, void* MmapAddress) {
        if (root == NULL) {
            return NULL;
        }
        if ((root->left != NULL) && (MmapAddress == (root->left->ChunkStartingAddress))) {
            return root;
        }
        if ((root->right != NULL) && (MmapAddress == (root->right->ChunkStartingAddress))) {
            return root;
        }
        if ((size_t)MmapAddress < (size_t)(root->ChunkStartingAddress)) {
            return findParent(root->left, MmapAddress);
        }
        else {
            return findParent(root->right, MmapAddress);
        }
    }

    static MmapChunk* findMin(MmapChunk* root) {
        if (root == NULL) {
            return NULL;
        }
        if (root->left == NULL) {
            return root;
        }
        return findMin(root->left);
    }

    static MmapChunk* RecursivereduceNodeSzOrDelete(MmapChunk* root, void* MmapAddress, size_t MmapSize) {
        if (root == NULL) {
            return NULL;
        }
        if ((size_t)MmapAddress < (size_t)(root->ChunkStartingAddress)) {
            root->left = RecursivereduceNodeSzOrDelete(root->left, MmapAddress, MmapSize);
        }
        else if ((size_t)MmapAddress > (size_t)(root->ChunkStartingAddress)
        && ((size_t)MmapAddress > ((size_t)root->ChunkStartingAddress + (size_t)root->ChunkSize))) {
            root->right = RecursivereduceNodeSzOrDelete(root->right, MmapAddress, MmapSize);
        }
        else {
            //sometimes you may free from between. In that case, you gotta split the node into two
            //            if ((size_t)MmapAddress > (size_t)(root->ChunkStartingAddress)
            //            && ((size_t)MmapAddress < ((size_t)root->ChunkStartingAddress + (size_t)root->ChunkSize))) {
            //                //split the node
            //                root->ChunkSize -= MmapSize; //this should match with the freed size
            //                //insert the second chunk
            //                auto root_ =  insertNode(root, (void*)((size_t)MmapAddress + MmapSize), (size_t)(((size_t)MmapAddress + MmapSize) -
            //                ((size_t)root->ChunkStartingAddress + (size_t)root->ChunkSize) - MmapSize));
            //                return root_;
            //            }

            /*
             * Our observation above was wrong.
             * Even though you may need to free from between, the requested sz for deletion is
             * such that the second half of the chunk is unmapped (cut off).
             * Therfore, we can just reduce the size of the chunk and return the same node
             *
             */
            if ((size_t)MmapAddress > (size_t)(root->ChunkStartingAddress)
            && ((size_t)MmapAddress < ((size_t)root->ChunkStartingAddress + (size_t)root->ChunkSize))) {
                //split the node and shave off the second half
                root->ChunkSize -= MmapSize; //this should match with the freed size
                return root;
            }
            if (root->ChunkSize - MmapSize > 0)
            {
                root->ChunkSize = root->ChunkSize - MmapSize;
                root->ChunkStartingAddress = (void*)((size_t)root->ChunkStartingAddress + MmapSize);
                return root;
            }

            if (root->left == NULL) {
                MmapChunk* temp = root->right;
                if (root == Cache)
                    Cache = NULL;
                free(root);
                return temp;
            }
            else if (root->right == NULL) {
                MmapChunk* temp = root->left;
                if (root == Cache)
                    Cache = NULL;
                free(root);
                return temp;
            }
            MmapChunk* temp = findMin(root->right);
            root->ChunkStartingAddress = temp->ChunkStartingAddress;
            root->right = RecursivereduceNodeSzOrDelete(root->right, temp->ChunkStartingAddress, MmapSize);
        }
        return root;
    }

    //print the tree
    static void printTree(MmapChunk* node, int level) {
        if (node != nullptr) {
            printTree(node->right, level + 1);
            for (int i = 0; i < level; i++) {
                cout << "   ";
            }
            cout << "{ " << node->ChunkStartingAddress <<", "<< (void*)((size_t)node->ChunkStartingAddress + (size_t)node->ChunkSize) <<" }"<< endl;
            printTree(node->left, level + 1);
        }
    }

    //write a function to remove a node from the tree
    static void reduceNodeSizeOrRemove(MmapChunk** root, void* MmapAddress, size_t MmapSize) {
        if (root == NULL) {
            return;
        }
        MmapChunk* node = findNode(*root, MmapAddress);
        if (node == NULL) {
            return;
        }
        if (node->left == NULL && node->right == NULL) {
            *root = RecursivereduceNodeSzOrDelete(*root, MmapAddress, MmapSize);
        }
        else if (node->left == NULL) {
            MmapChunk* parent = findParent(*root, MmapAddress);
            if (parent->left == node) {
                parent->left = node->right;
            }
            else {
                parent->right = node->right;
            }
            // If the node is in the cache, remove it
            if (node == Cache)
                Cache = NULL;
            free(node);
        }
        else if (node->right == NULL) {
            MmapChunk* parent = findParent(*root, MmapAddress);
            if (parent->left == node) {
                parent->left = node->left;
            }
            else {
                parent->right = node->left;
            }
            // If the node is in the cache, remove it
            if (node == Cache)
                Cache = NULL;
            free(node);
        }
        else {
            MmapChunk* temp = findMin(node->right);
            node->ChunkStartingAddress = temp->ChunkStartingAddress;
            node->right = RecursivereduceNodeSzOrDelete(node->right, temp->ChunkStartingAddress, MmapSize);
        }
    }

    static void protect (void * ptr, size_t sz) {
      mprotect ((char *) ptr, sz, PROT_NONE);
    }

    static void unprotect (void * ptr, size_t sz) {
      mprotect ((char *) ptr, sz, PROT_READ | PROT_WRITE | PROT_EXEC);
    }

    static void * map (size_t sz) {

      if (sz == 0) {
	return nullptr;
      }

      // Round up the size to a page-sized value.
      sz = Size * ((sz + Size - 1) / Size);

      void * ptr;
      int mapFlag = 0;
      char * startAddress = 0;

#if defined(MAP_ALIGN) && defined(MAP_ANON)
      int fd = -1;
      startAddress = (char *) Alignment;
      mapFlag |= MAP_PRIVATE | MAP_ALIGN | MAP_ANON;
#elif defined(MAP_ALIGNED)
      int fd = -1;
      // On allocations equal or larger than page size, we align it to the log2 boundary
      // in those contexts, sometimes (on NetBSD notably) large mappings tends to fail
      // without this flag.
      size_t alignment = ilog2(sz);
      mapFlag |= MAP_PRIVATE | MAP_ANON;
      if (alignment >= 12ul)
          mapFlag |= MAP_ALIGNED(alignment);
#elif !defined(MAP_ANONYMOUS)
      static int fd = ::open ("/dev/zero", O_RDWR);
      mapFlag |= MAP_PRIVATE;
#else
      int fd = -1;
      //      mapFlag |= MAP_ANONYMOUS | MAP_PRIVATE;
      mapFlag |= MAP_ANON | MAP_PRIVATE;
#if HL_EXECUTABLE_HEAP
#if defined(MAP_JIT)
      mapFlag |= MAP_JIT;
#endif
#endif
#endif

      ptr = mmap(startAddress, sz, HL_MMAP_PROTECTION_MASK, mapFlag, fd, 0);

      if (ptr == MAP_FAILED) {
	tprintf::tprintf("MAP_FAILED\n");
	perror("MmapWrapper");
	return nullptr;
      } else {
          //update the MmapChunk Structure tree with the ptr address
            //cout<<"+++++++++INSERTED a node and the tree is"<<endl;
            MmapChunkRoot = insertNode(MmapChunkRoot, ptr, sz);
            //printTree(MmapChunkRoot,0);
            //cout<<"end of tree"<<endl;
	        return ptr;
      }
    }

    static void unmap (void * ptr, size_t sz) {
      // Round up the size to a page-sized value.
      sz = Size * ((sz + Size - 1) / Size);
      munmap ((caddr_t) ptr, sz);
      //cout<<"-------REMOVED " << sz <<" Bytes from "<< ptr <<" a node and the tree is"<<endl;
      //remove the ptr address from the MmapChunk Structure tree
      reduceNodeSizeOrRemove(&MmapChunkRoot, ptr, sz);
      //printTree(MmapChunkRoot, 0);
      //cout<<"end of tree"<<endl;
    }
   
#endif

  };

}

#endif
