//
// Created by nami on 11/13/20.
//

#ifndef CUDATEST_WATER_H
#define CUDATEST_WATER_H


class Water {
    void setupCuda();
    void setupFbo();

public:

    void stepSimulation();
    void updateNormals();
};


#endif //CUDATEST_WATER_H
