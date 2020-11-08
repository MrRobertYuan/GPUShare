#include <stdio.h>
#include <cuda.h>

cudaError_t cudaMalloc(void **devPtr, size_t size)
{
	return cudaErrorMemoryAllocation;
}
