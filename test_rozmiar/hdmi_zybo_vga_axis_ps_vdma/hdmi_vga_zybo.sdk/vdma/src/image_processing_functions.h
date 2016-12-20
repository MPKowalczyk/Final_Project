#pragma once
#include "globals.h"

#define DISP_M0D 50

// RGB2YCbCr conversion
void rgb2ycbcr(const u8* imageRGB, const unsigned int XX, const unsigned int YY, u8* imageYCbCr);
void rgb2ycbcr_fixed(const u8* imageRGB, const unsigned int XX, const unsigned int YY, u8* imageYCbCr);




void sobel1D(const u8* imageIn, const unsigned int XX, const unsigned int YY, const unsigned int ETH, u8* imageOut);

void sobelY(const u8* imageIn, const unsigned int XX, const unsigned int YY, const unsigned int ETH, u8* imageOut);
void sobelY_float(const float* imageIn, const unsigned int XX, const unsigned int YY, const unsigned int ETH, u8* imageOut);
void sobelY_fixed(const u32* imageIn, const unsigned int XX, const unsigned int YY, const unsigned int ETH, u8* imageOut);


void sobelYCbCr(const u8* imageIn, const unsigned int XX, const unsigned int YY, const unsigned int ETH, u8* imageOut);


void medianbinary5x5(const u8* imageIn, const unsigned int XX, const unsigned int YY, u8* imageOut);
void dilate5x5(const u8* imageIn, const unsigned int XX, const unsigned int YY, u8* imageOut);



void contEdgeAnalysis5x5(const u8* imageIn, const u8* directionIn, const unsigned int XX, const unsigned int YY, u8* stdOut);

void contEdgeAnalysis7x7_v2(const u8* imageIn, const u8* edgeImageIn, const unsigned int XX, const unsigned int YY, u8* stdOut);

void contEdgeAnalysis5x5_v3(const u8* imageIn, const u8* directionIn, const u8* directionFGMask, const unsigned int XX, const unsigned int YY, u8* stdOut);
