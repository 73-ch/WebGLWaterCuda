//
// Created by nami on 11/13/20.
//

#ifndef CUDATEST_WATER_CUH
#define CUDATEST_WATER_CUH

extern "C"{
void setupCuda();
void setupFbo();
void stepSimulation();
void updateNormals();
};
__global__ void updateWater();

#endif //CUDATEST_WATER_CUH
