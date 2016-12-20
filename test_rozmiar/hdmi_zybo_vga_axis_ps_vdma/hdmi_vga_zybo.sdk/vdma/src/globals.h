#pragma once
#include "xil_io.h"
//#include <opencv2/core/core.hpp>

// definicja tupu u8 - dla zgodnosci z ARM
//typedef unsigned char u8;
//typedef unsigned int u32;


//typedef cv::Vec<uchar,3> vec_uchar_3;

struct bbox {
    unsigned int xmin;
    unsigned int xmax;
    unsigned int ymin;
    unsigned int ymax;
};
