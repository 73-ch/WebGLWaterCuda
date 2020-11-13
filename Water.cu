//
// Created by nami on 11/13/20.
//


#include "Water.cuh"
#include "cuda_runtime.h"
#include "math_functions.h"
#include "helper_math.h"

extern "C" {

void setupCuda() {

}
void setupFbo() {

}


void stepSimulation() {

    dim3 block(16,16,1);
    dim3 grid(width / block.x, height / block.y, 1);

    updateWater();
}

void updateNormals() {

}

}


__global__ void updateWater(float4 *g_data, float4 *g_odata, uint2 size, int2 delta, float attenuation) {
    uint gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    uint gtidy = blockIdx.y * blockDim.y + threadIdx.y;

    float4 data = g_data[gtidx + gtidy * size.x];

    float average = g_data[gtidx + delta.x + gtidy * size.x].x;
    average += g_data[gtidx - delta.x + gtidy * size.x].x;
    average += g_data[gtidx + (gtidy + delta.y) * size.x].x;
    average += g_data[gtidx + (gtidy - delta.y) * size.x].x;
    average *= 0.25;

    data.y += (average - data.x) * 2.0;
    data.y *= attenuation;

    data.x += data.y;

    g_odata[gtidx + gtidy * size.x] = data;
}