#include <stdio.h>
#include <cuda.h>

cudaError_t myCudaMalloc(void** devPtr, size_t size);

cudaError_t myCudaFree(void* devPtr);
