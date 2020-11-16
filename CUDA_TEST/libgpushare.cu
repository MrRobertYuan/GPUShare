#include <stdio.h>
#include <cuda.h>
#include "libgpushare.h"
#include "libMyCudaMalloc.h"

const size_t maxSize = 20000000;
size_t allocatedSize = 0;

const int mod = 9999987;
long long keys[mod + 100];
size_t values[mod + 100];

void Insert(long long key, size_t value){
	int hashKey = key % mod;
	while(keys[hashKey] != 0 && keys[hashKey] != key){
		hashKey ++;
	}
	keys[hashKey] = key;
	values[hashKey] = value;	
}

size_t Query(long long key){
	int hashKey = key % mod;
	while(keys[hashKey] != 0 && keys[hashKey] != key){
		hashKey ++;
	}
	if(keys[hashKey] == key){
		return values[hashKey];
	}
	return 0;
}

cudaError_t cudaMalloc(void **devPtr, size_t size)
{
	if(allocatedSize + size <= maxSize){
		cudaError_t res = myCudaMalloc(devPtr, size);
		if(res == cudaSuccess){
			allocatedSize += size;
			Insert((long long)*devPtr, size);
		}
		return res;
	}
	else{
		*devPtr = NULL;
		return cudaErrorMemoryAllocation;
	}
}

cudaError_t cudaFree(void *devPtr){
	cudaError_t res = myCudaFree(devPtr);	
	if(res == cudaSuccess){
		allocatedSize -= Query((long long)devPtr);
	}
	return res;
}
