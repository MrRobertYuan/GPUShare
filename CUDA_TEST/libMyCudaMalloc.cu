#include <stdio.h>
#include <cuda.h>
#include "libMyCudaMalloc.h"

cudaError_t myCudaMalloc(void** devPtr, size_t size){
	return cudaMalloc(devPtr, size);
}
