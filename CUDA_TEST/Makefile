CXX = gcc

CUDAPATH ?= /usr/local/cuda-9.0

COMMONFLAGS = -Wall -fPIC -shared -ldl

#libgpushare.so: libgpushare.cpp
#	$(CXX) -I$(CUDAPATH)/include $(COMMONFLAGS) -o libgpushare.so libgpushare.cpp

#libgpushare.so: libgpushare.c
#	$(CXX)  $(COMMONFLAGS) -o libgpushare.so libgpushare.c

libgpushare.so: libgpushare.cu
	nvcc -L. -lMyCudaMalloc --compiler-options "-fPIC -shared" -cudart=shared libgpushare.cu -o libgpushare.so

vector_add.o: vector_add.cu
	nvcc -L. -lgpushare -g -cudart=shared vector_add.cu -o vector_add.o

libMyCudaMalloc.so: libMyCudaMalloc.cu
	nvcc --compiler-options "-fPIC -shared" libMyCudaMalloc.cu -o libMyCudaMalloc.so

clean:
	-rm -f libgpushare.so
	-rm -f vector_add.o
	-rm -f libMyCudaMalloc.so

