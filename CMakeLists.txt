cmake_minimum_required(VERSION 3.17)
set(CMAKE_CUDA_COMPILER "/usr/local/cuda/bin/nvcc")
project(CudaTest CUDA)

set(CMAKE_CUDA_STANDARD 14)

add_executable(CudaTest main.cu Water.cpp Water.h Water.cu Water.cuh helper_math.h)

set_target_properties(
        CudaTest
        PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)