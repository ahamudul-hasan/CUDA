#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>

__global__ void test01(){
    // Print the blocks and threads IDs
    printf("\nThe block ID is %d --- The thread ID is %d\n", blockIdx.x, threadIdx.x);
}

int main(){
    // kernel_name<<<num_blocks, num_threads_per_block>>>();
    test01<<<1, 1024>>>();
    cudaDeviceSynchronize();

    return 0;
}