#include <stdio.h>
#include <cuda.h>
#include "libgpushare.h"

cudaError_t cudaMalloc(void **devPtr, size_t size)
{
	*devPtr = NULL;
	return cudaErrorMemoryAllocation;
}
