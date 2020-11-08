CXX = gcc

CUDAPATH ?= /usr/local/cuda-9.0

COMMONFLAGS = -Wall -fPIC -shared -ldl

#libgpushare.so: libgpushare.cpp
#	$(CXX) -I$(CUDAPATH)/include $(COMMONFLAGS) -o libgpushare.so libgpushare.cpp

#libgpushare.so: libgpushare.c
#	$(CXX)  $(COMMONFLAGS) -o libgpushare.so libgpushare.c

libgpushare.so: libgpushare.cu
	nvcc --compiler-options "-fPIC -shared" -cudart=shared libgpushare.cu -o libgpushare.so

vector_add.o: vector_add.cu
	nvcc -L. -lgpushare -g -cudart=shared vector_add.cu -o vector_add.o

clean:
	-rm -f libgpushare.so
	-rm -f vector_add.o

