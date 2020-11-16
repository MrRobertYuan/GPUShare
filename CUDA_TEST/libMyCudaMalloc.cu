#include <stdio.h>
#include <cuda.h>
#include "libMyCudaMalloc.h"

cudaError_t myCudaMalloc(void** devPtr, size_t size){
	return cudaMalloc(devPtr, size);
}

cudaError_t myCudaFree(void* devPtr){
	return cudaFree(devPtr);
}
