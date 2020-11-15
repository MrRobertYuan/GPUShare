#include <stdio.h>
#include <cuda.h>
#include "libgpushare.h"
#include "libMyCudaMalloc.h"

size_t maxSize = 20000000;

cudaError_t cudaMalloc(void **devPtr, size_t size)
{
	if(size <= maxSize){
		return myCudaMalloc(devPtr, size);
	}
	else{
		*devPtr = NULL;
		return cudaErrorMemoryAllocation;
	}
}
