#include <stdio.h>
#include <cuda.h>
#include "myCudaMalloc.h"

cudaError_t myCudaMalloc(void** devPtr, size_t size){
	return cudaMalloc(devPtr, size);
}
