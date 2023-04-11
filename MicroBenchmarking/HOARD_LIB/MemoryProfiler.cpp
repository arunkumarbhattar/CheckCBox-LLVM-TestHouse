//
// Created by supercharger on 3/16/23.
//

#include "MemoryProfiler.h"

 MmapChunk* createNode(void* MmapAddress, size_t MmapSize) {
    MmapChunk* NewChunk = (MmapChunk*)malloc(sizeof(MmapChunk));
    NewChunk->ChunkStartingAddress = MmapAddress;
    NewChunk->left = nullptr;
    NewChunk->right = nullptr;
    NewChunk->ChunkSize = MmapSize;
    return NewChunk;
}

MmapChunk* mergeNodes(MmapChunk* root, void* MmapAddress, size_t MmapSize) {
    if (root == nullptr) {
        return nullptr;
    }
    if ((size_t)MmapAddress + MmapSize == (size_t)root->ChunkStartingAddress) {
        root->ChunkStartingAddress = MmapAddress;
        root->ChunkSize += MmapSize;
        return root;
    } else if ((size_t)MmapAddress == (size_t)root->ChunkStartingAddress + root->ChunkSize) {
        root->ChunkSize += MmapSize;
        return root;
    }
    return nullptr;
}

 MmapChunk* insertNode(MmapChunk* root, void* MmapAddress, size_t MmapSize) {
    if (root == nullptr) {
        root = createNode(MmapAddress, MmapSize);
        return root;
    }

     MmapChunk* mergedNode = mergeNodes(root, MmapAddress, MmapSize);
     if (mergedNode) {
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

MmapChunk* findNode(MmapChunk* root, void* MmapAddress) {
    // This is the most critical function
    // It is called for every malloc and free
    // The MmapAddress necessarily need not be the same as the root->ChunkStartingAddress
    // It can be anywhere in the range of the chunk starting address and the chunk ending address (root->ChunkStartingAddress + root->ChunkSize)
    if (root == nullptr) {
        return nullptr;
    }
    // Check for Cache Hit (This is the most common case)
    if (Cache != nullptr) {
        if ((MmapAddress >= Cache->ChunkStartingAddress)
            && ((size_t)MmapAddress < ((size_t)Cache->ChunkStartingAddress + (size_t)Cache->ChunkSize))) {
            //cout << "CACHE HIT "<< endl;
            return Cache;
        }
    }

    if (MmapAddress == (root->ChunkStartingAddress)) {
        // This is pretty obvious
        // If this is a Cache Miss, we will have to update the cache
        // Check if this is a Cache Miss
        if (Cache != root) {
            //cout << "CACHE MISS "<< endl;
            Cache = root;
        }
        return root;
    }

    else if ((MmapAddress >= root->ChunkStartingAddress)
             && ((size_t)MmapAddress < ((size_t)root->ChunkStartingAddress + (size_t)root->ChunkSize))) {
        // If this is a Cache Miss, we will have to update the cache
        // Check if this is a Cache Miss
        if (Cache != root) {
            //cout << "CACHE MISS "<< endl;
            Cache = root;
        }
        return root;
    }

    // else we need to recurse the entire tree look for the node
    if (MmapAddress < (root->ChunkStartingAddress)) {
        return findNode(root->left, MmapAddress);
    }
    else {
        return findNode(root->right, MmapAddress);
    }
}

 MmapChunk* findParent(MmapChunk* root, void* MmapAddress) {
    if (root == nullptr) {
        return nullptr;
    }
    if ((root->left != nullptr) && (MmapAddress == (root->left->ChunkStartingAddress))) {
        return root;
    }
    if ((root->right != nullptr) && (MmapAddress == (root->right->ChunkStartingAddress))) {
        return root;
    }
    if ((size_t)MmapAddress < (size_t)(root->ChunkStartingAddress)) {
        return findParent(root->left, MmapAddress);
    }
    else {
        return findParent(root->right, MmapAddress);
    }
}

 MmapChunk* findMin(MmapChunk* root) {
    if (root == nullptr) {
        return nullptr;
    }
    if (root->left == nullptr) {
        return root;
    }
    return findMin(root->left);
}
MmapChunk* splitNode(MmapChunk* root, void* MmapAddress, size_t MmapSize) {
    size_t newChunkSize = (size_t)root->ChunkStartingAddress + root->ChunkSize - (size_t)MmapAddress;
    void* newChunkAddress = (void*)((size_t)MmapAddress + MmapSize);

    root->ChunkSize = (size_t)MmapAddress - (size_t)root->ChunkStartingAddress;
    root->right = insertNode(root->right, newChunkAddress, newChunkSize);

    return root;
}

MmapChunk* RecursivereduceNodeSzOrDelete(MmapChunk* root, void* MmapAddress, size_t MmapSize) {
    if (root == nullptr) {
        return nullptr;
    }
    if ((size_t)MmapAddress < (size_t)(root->ChunkStartingAddress)) {
        root->left = RecursivereduceNodeSzOrDelete(root->left, MmapAddress, MmapSize);
    }
    else if ((size_t)MmapAddress > (size_t)(root->ChunkStartingAddress)
             && ((size_t)MmapAddress > ((size_t)root->ChunkStartingAddress + (size_t)root->ChunkSize))) {
        root->right = RecursivereduceNodeSzOrDelete(root->right, MmapAddress, MmapSize);
    }
    else {
        if ((size_t)MmapAddress > (size_t)(root->ChunkStartingAddress)
            && ((size_t)MmapAddress < ((size_t)root->ChunkStartingAddress + (size_t)root->ChunkSize))) {
            // Split the node and shave off the second half
            root = splitNode(root, MmapAddress, MmapSize);
            return root;
        }
        if (root->ChunkSize - MmapSize > 0)
        {
            root->ChunkSize = root->ChunkSize - MmapSize;
            root->ChunkStartingAddress = (void*)((size_t)root->ChunkStartingAddress + MmapSize);
            return root;
        }

        if (root->left == nullptr) {
            MmapChunk* temp = root->right;
            if (root == Cache)
                Cache = nullptr;
            free(root);
            return temp;
        }
        else if (root->right == nullptr) {
            MmapChunk* temp = root->left;
            if (root == Cache)
                Cache = nullptr;
            free(root);
            return temp;
        }
        MmapChunk* temp = findMin(root->right);
        root->ChunkStartingAddress = temp->ChunkStartingAddress;
        root->right = RecursivereduceNodeSzOrDelete(root->right, temp->ChunkStartingAddress, MmapSize);
    }
    return root;
}

//write a function to remove a node from the tree
void reduceNodeSizeOrRemove(MmapChunk** root, void* MmapAddress, size_t MmapSize) {
    if (root == nullptr) {
        return;
    }
    MmapChunk* node = findNode(*root, MmapAddress);
    if (node == nullptr) {
        return;
    }
    if (node->left == nullptr && node->right == nullptr) {
        *root = RecursivereduceNodeSzOrDelete(*root, MmapAddress, MmapSize);
    }
    else if (node->left == nullptr) {
        MmapChunk* parent = findParent(*root, MmapAddress);
        if (!parent)
            return;
        if (parent->left == node) {
            parent->left = node->right;
        }
        else {
            parent->right = node->right;
        }
        // If the node is in the cache, remove it
        if (node == Cache)
            Cache = nullptr;
        free(node);
    }
    else if (node->right == nullptr) {
        MmapChunk* parent = findParent(*root, MmapAddress);
        if (!parent)
            return;
        if (parent->left == node) {
            parent->left = node->left;
        }
        else {
            parent->right = node->left;
        }
        // If the node is in the cache, remove it
        if (node == Cache)
            Cache = nullptr;
        free(node);
    }
    else {
        MmapChunk* temp = findMin(node->right);
        if (!temp)
            return;
        node->ChunkStartingAddress = temp->ChunkStartingAddress;
        node->right = RecursivereduceNodeSzOrDelete(node->right, temp->ChunkStartingAddress, MmapSize);
    }
}

extern "C" void CacheUpdateandCheck(void* Address)
{
    MmapChunk* temp = findNode(MmapChunkRoot, Address);

    assert(temp != nullptr && "Tainted Pointer Illegal");
    lowerbound_2 = lowerbound_1;
    upperbound_2 = upperbound_1;

    lowerbound_1 = (long)(temp->ChunkStartingAddress);
    upperbound_1 = (long)temp->ChunkStartingAddress + (long)temp->ChunkSize;
}

MmapChunk* reduceTree(MmapChunk* root) {
    if (root == nullptr)
        return nullptr;

    //recursively reduce the left and right subtrees
    root->left = reduceTree(root->left);
    root->right = reduceTree(root->right);

    //Try to merge with left child
    if (root->left != nullptr && ((size_t)root->left->ChunkStartingAddress + (size_t)root->left->ChunkSize) == (size_t)root->ChunkStartingAddress) {
        root->left->ChunkSize += root->ChunkSize;
        free(root);
        root = root->left;
    }
        // Try to merge with right child
    else if (root->right != nullptr && (size_t)root->ChunkStartingAddress + root->ChunkSize == (size_t)root->right->ChunkStartingAddress) {
        root->ChunkSize += root->right->ChunkSize;
        free(root->right);
        root->right = root->right->right;
    }

    return root;
}

MmapChunk* cloneBinaryTree(MmapChunk* root) {
    if (!root) {
        return nullptr;
    }

    MmapChunk* newRoot = createNode(root->ChunkStartingAddress, root->ChunkSize);

    newRoot->left = cloneBinaryTree(root->left);
    newRoot->right = cloneBinaryTree(root->right);

    return newRoot;
}

void deleteTree(MmapChunk* node) {
    if (node == nullptr) {
        return;
    }
    deleteTree(node->left);
    deleteTree(node->right);
    free(node);
}

//print the tree
void printTree(MmapChunk* node, int level) {
    if (node != nullptr) {
        printTree(node->right, level + 1);
        for (int i = 0; i < level; i++) {
            cout << "   ";
        }
        cout << "{ " << node->ChunkStartingAddress <<", "<< (void*)((size_t)node->ChunkStartingAddress + (size_t)node->ChunkSize) <<" }"<< endl;
        printTree(node->left, level + 1);
    }
}
