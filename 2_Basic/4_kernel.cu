#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>

__global__ void test01(){
    // Print the blocks and threads IDs
    // warp=32 threads. (128 threads/block) --> (128/32 = 4 warp/block)
    int warp_ID_value = 0;
    warp_ID_value = threadIdx.x / 32;
    printf("\nThe block ID is %d --- The thread ID is %d\n --- the warp ID %d", blockIdx.x, threadIdx.x, warp_ID_value);
}

int main(){
    // kernel_name<<<num_blocks, num_threads_per_block>>>();
    test01<<<1, 1024>>>();
    cudaDeviceSynchronize();

    return 0;
}