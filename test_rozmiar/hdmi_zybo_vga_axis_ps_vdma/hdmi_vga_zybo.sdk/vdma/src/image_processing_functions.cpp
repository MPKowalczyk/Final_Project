#include "image_processing_functions.h"
#include <cmath>
//TODO Sobel 3D



// -------------------------------------------------------------------------------------------------------------------
// rgb2ycbcr
// Conversion from rgb 2 ycbcr
// assumption - image sizes are correct
// -------------------------------------------------------------------------------------------------------------------
void rgb2ycbcr(const u8* imageRGB, const unsigned int XX, const unsigned int YY, u8* imageYCbCr){

    for (unsigned int jj= 0; jj < YY; jj++) {
        for (unsigned int ii = 0; ii < 3*(XX); ii+=3) {
            // Y
            imageYCbCr[jj*3*XX+ii]   = u8(0.299* float(imageRGB[jj*3*XX+ii+2])     + 0.587*float(imageRGB[jj*3*XX+ii+1])     + 0.114*float(imageRGB[jj*3*XX+ii+0]));
            // Cb
            imageYCbCr[jj*3*XX+ii+1] = u8(-0.168736* float(imageRGB[jj*3*XX+ii+2]) + -0.331264*float(imageRGB[jj*3*XX+ii+1]) + 0.5*float(imageRGB[jj*3*XX+ii+0])+128);
            // Cr
            imageYCbCr[jj*3*XX+ii+2] = u8(0.5* float(imageRGB[jj*3*XX+ii+2])       + -0.418688*float(imageRGB[jj*3*XX+ii+1]) + -0.081312*float(imageRGB[jj*3*XX+ii+0])+128);
        }
    }
}

// -------------------------------------------------------------------------------------------------------------------
// rgb2ycbcr
// Conversion from rgb 2 ycbcr using fixed point numbers
// assumption - image sizes are correct
// -------------------------------------------------------------------------------------------------------------------
void rgb2ycbcr_fixed(const u8* imageRGB, const unsigned int XX, const unsigned int YY, u8* imageYCbCr) {

    for (unsigned int jj= 0; jj < YY; jj++) {
        for (unsigned int ii = 0; ii < 3*(XX); ii+=3) {
            // Y
            imageYCbCr[jj*3*XX+ii]   = u8((19595*imageRGB[jj*3*XX+ii+2]     + 38470 *imageRGB[jj*3*XX+ii+1]     + 7471*imageRGB[jj*3*XX+ii+0]) >> 16);
            // Cb
            imageYCbCr[jj*3*XX+ii+1] = u8((-11058*imageRGB[jj*3*XX+ii+2] -21710*imageRGB[jj*3*XX+ii+1] + 32768*imageRGB[jj*3*XX+ii+0] +65536*128)  >> 16);
            // Cr
            imageYCbCr[jj*3*XX+ii+2] = u8(( 32768*imageRGB[jj*3*XX+ii+2]  -27439*imageRGB[jj*3*XX+ii+1] -5329*imageRGB[jj*3*XX+ii+0]   +65536*128)  >> 16);
        }
    }
}

// -------------------------------------------------------------------------------------------------------------------
// sobel1D
// Sobel edge detection for 1D images
// ETH - edge thershold
// -------------------------------------------------------------------------------------------------------------------
void sobel1D(const u8* imageIn, const unsigned int XX, const unsigned int YY, const unsigned int ETH, u8* imageOut) {

    // Asumption - no boarder
    int sx, sy, sxy;
    for (int jj= 1; jj < YY-1; jj++) {
        for (int ii = 1; ii < XX-1; ii++) {
            sx = (imageIn[(jj-1)*XX+ii-1] + 2*imageIn[(jj)*XX+ii-1] + imageIn[(jj+1)*XX+ii-1]) -
                 (imageIn[(jj-1)*XX+ii+1] + 2*imageIn[(jj)*XX+ii+1] + imageIn[(jj+1)*XX+ii+1]);

            sy = (imageIn[(jj-1)*XX+ii-1] + 2*imageIn[(jj-1)*XX+ii] + imageIn[(jj-1)*XX+ii+1]) -
                 (imageIn[(jj+1)*XX+ii-1] + 2*imageIn[(jj+1)*XX+ii] + imageIn[(jj+1)*XX+ii+1]);





            sxy = std::abs(sx) + std::abs(sy);

            // Binarization
            if ( sxy > ETH) {
                imageOut[jj*XX+ii] = 255;

                // TODO Dla potrzeby testu, inaczej optymalizacja
                //angle = abs(atan2(float(sx),float(sy))*180/3.14);
                //if ( angle > 157.5 || angle < 22.5)
                //    directionOut[jj*XX+ii] = 1*DISP_M0D;
                //if ( angle >= 22.5 && angle < 67.5)
                //    directionOut[jj*XX+ii] = 2*DISP_M0D;
                //if ( angle >= 67.5 && angle < 112.5)
                //    directionOut[jj*XX+ii] = 3*DISP_M0D;
                //if ( angle > 112.5 && angle < 157.5)
                //    directionOut[jj*XX+ii] = 4*DISP_M0D;
            }
            else {
                imageOut[jj*XX+ii] = 0;
                //directionOut[jj*XX+ii] = 0;
            }
        }
    }
}

// -------------------------------------------------------------------------------------------------------------------
void sobelY_float(const float* imageIn, const unsigned int XX, const unsigned int YY, const unsigned int ETH, u8* imageOut) {
    // Asumption - no boarder
    int sxY, syY, sxyY;


    int k =0;
    for (int jj= 1; jj < YY-1; jj++) {
        for (int ii = 3; ii < 3*(XX-1); ii+=3) {
            sxY = (imageIn[(jj-1)*3*XX+ii-3] + 2*imageIn[(jj)*3*XX+ii-3] + imageIn[(jj+1)*3*XX+ii-3]) -
                  (imageIn[(jj-1)*3*XX+ii+3] + 2*imageIn[(jj)*3*XX+ii+3] + imageIn[(jj+1)*3*XX+ii+3]);

            syY = (imageIn[(jj-1)*3*XX+ii-3] + 2*imageIn[(jj-1)*3*XX+ii] + imageIn[(jj-1)*3*XX+ii+3]) -
                 (imageIn[(jj+1)*3*XX+ii-3] + 2*imageIn[(jj+1)*3*XX+ii] + imageIn[(jj+1)*3*XX+ii+3]);

            sxyY = std::abs(sxY) + std::abs(syY);


            // Binarization
            if ( sxyY > ETH) {
                imageOut[jj*XX+ii/3] = 255;
            }
            else {
                imageOut[jj*XX+ii/3] = 0;
            }

        }
    }
}


void sobelY_fixed(const u32* imageIn, const unsigned int XX, const unsigned int YY, const unsigned int ETH, u8* imageOut){
    int sxY, syY, sxyY;


    int k =0;
    for (int jj= 1; jj < YY-1; jj++) {
        for (int ii = 3; ii < 3*(XX-1); ii+=3) {
            sxY = (imageIn[(jj-1)*3*XX+ii-3] + 2*imageIn[(jj)*3*XX+ii-3] + imageIn[(jj+1)*3*XX+ii-3]) -
                  (imageIn[(jj-1)*3*XX+ii+3] + 2*imageIn[(jj)*3*XX+ii+3] + imageIn[(jj+1)*3*XX+ii+3]);

            syY = (imageIn[(jj-1)*3*XX+ii-3] + 2*imageIn[(jj-1)*3*XX+ii] + imageIn[(jj-1)*3*XX+ii+3]) -
                 (imageIn[(jj+1)*3*XX+ii-3] + 2*imageIn[(jj+1)*3*XX+ii] + imageIn[(jj+1)*3*XX+ii+3]);

            sxyY = std::abs(sxY>>8) + std::abs(syY>>8);


            // Binarization
            if ( sxyY > ETH) {
                imageOut[jj*XX+ii/3] = 255;
            }
            else {
                imageOut[jj*XX+ii/3] = 0;
            }

        }
    }
}


// -------------------------------------------------------------------------------------------------------------------
// sobelRGB
// Sobel edge detection for RGB
// ETH - edge thershold
// -------------------------------------------------------------------------------------------------------------------
void sobelYCbCr(const u8* imageIn, const unsigned int XX, const unsigned int YY, const unsigned int ETH, u8* imageOut){
    // Asumption - no boarder
    float angle;
    int sxY, syY, sxyY;
    int sxG, syG, sxyG;
    int sxB, syB, sxyB;

    int k =0;
    for (int jj= 1; jj < YY-1; jj++) {
        for (int ii = 3; ii < 3*(XX-1); ii+=3) {
            sxY = (imageIn[(jj-1)*3*XX+ii-3] + 2*imageIn[(jj)*3*XX+ii-3] + imageIn[(jj+1)*3*XX+ii-3]) -
                  (imageIn[(jj-1)*3*XX+ii+3] + 2*imageIn[(jj)*3*XX+ii+3] + imageIn[(jj+1)*3*XX+ii+3]);

            syY = (imageIn[(jj-1)*3*XX+ii-3] + 2*imageIn[(jj-1)*3*XX+ii] + imageIn[(jj-1)*3*XX+ii+3]) -
                 (imageIn[(jj+1)*3*XX+ii-3] + 2*imageIn[(jj+1)*3*XX+ii] + imageIn[(jj+1)*3*XX+ii+3]);

            sxyY = std::abs(sxY) + std::abs(syY);

            /*
            sxG = (imageIn[(jj-1)*3*XX+ii-1+1] + 2*imageIn[(jj)*3*XX+ii-1+1] + imageIn[(jj+1)*3*XX+ii-1+1]) -
                 (imageIn[(jj-1)*3*XX+ii+1+1] + 2*imageIn[(jj)*3*XX+ii+1+1] + imageIn[(jj+1)*3*XX+ii+1+1]);

            syG = (imageIn[(jj-1)*3*XX+ii-1+1] + 2*imageIn[(jj-1)*3*XX+ii+1] + imageIn[(jj-1)*3*XX+ii+1+1]) -
                 (imageIn[(jj+1)*3*XX+ii-1+1] + 2*imageIn[(jj+1)*3*XX+ii+1] + imageIn[(jj+1)*3*XX+ii+1+1]);

            sxyG = abs(sxG) + abs(syG);



            sxB = (imageIn[(jj-1)*3*XX+ii-1+2] + 2*imageIn[(jj)*3*XX+ii-1+2] + imageIn[(jj+1)*3*XX+ii-1+2]) -
                 (imageIn[(jj-1)*3*XX+ii+1+2] + 2*imageIn[(jj)*3*XX+ii+1+2] + imageIn[(jj+1)*3*XX+ii+1+2]);

            syB = (imageIn[(jj-1)*3*XX+ii-1+2] + 2*imageIn[(jj-1)*3*XX+ii+2] + imageIn[(jj-1)*3*XX+ii+1+2]) -
                 (imageIn[(jj+1)*3*XX+ii-1+2] + 2*imageIn[(jj+1)*3*XX+ii+2] + imageIn[(jj+1)*3*XX+ii+1+2]);

            sxyB = abs(sxB) + abs(syB);
            */


            // Binarization
            if ( sxyY > ETH) {
                imageOut[jj*XX+ii/3] = 255;

                // TODO Dla potrzeby testu, inaczej optymalizacja
                //angle = abs(atan2(float(sxY),float(syY))*180/3.14);

                //if ( angle > 157.5 || angle < 22.5)
                //    directionOut[jj*XX+ii/3] = 1*DISP_M0D;
                //if ( angle >= 22.5 && angle < 67.5)
                //    directionOut[jj*XX+ii/3] = 2*DISP_M0D;
                //if ( angle >= 67.5 && angle < 112.5)
                //    directionOut[jj*XX+ii/3] = 3*DISP_M0D;
                //if ( angle > 112.5 && angle < 157.5)
                    //directionOut[jj*XX+ii/3] = 4*DISP_M0D;
            }
            else {
                imageOut[jj*XX+ii/3] = 0;
                //directionOut[jj*XX+ii/3] = 0;
            }

        }
    }
}

// -------------------------------------------------------------------------------------------------------------------
// medianbinary5x5
// TODO - optimize
// -------------------------------------------------------------------------------------------------------------------
void medianbinary5x5(const u8* imageIn, const unsigned int XX, const unsigned int YY, u8* imageOut) {
    // Asumption - no boarder
    int sum =0;

    for (int jj= 2; jj < YY-2; jj++) {
        for (int ii = 2; ii < XX-2; ii++) {

            // Sum context
            sum = 0;
            for (int j=-2 ; j <=2; j++) {
                for (int i=-2 ; i <=2; i++) {
                    sum += imageIn[(jj+j)*XX+ii+i];
                }
            }


            // Binarization
            if ( sum >= 13*255)
                imageOut[jj*XX+ii] = 255;
            else
                imageOut[jj*XX+ii] = 0;
        }
    }
}

// -------------------------------------------------------------------------------------------------------------------
// medianbinary5x5
// TODO - optimize
// -------------------------------------------------------------------------------------------------------------------
void dilate5x5(const u8* imageIn, const unsigned int XX, const unsigned int YY, u8* imageOut) {
    // Asumption - no boarder
    int sum =0;

    for (int jj= 2; jj < YY-2; jj++) {
        for (int ii = 2; ii < XX-2; ii++) {

            // Sum context
            sum = 0;
            for (int j=-2 ; j <=2; j++) {
                for (int i=-2 ; i <=2; i++) {
                    sum += imageIn[(jj+j)*XX+ii+i];
                }
            }


            // Binarization
            if ( sum > 0)
                imageOut[jj*XX+ii] = 255;
            else
                imageOut[jj*XX+ii] = 0;
        }
    }
}

// -------------------------------------------------------------------------------------------------------------------
// contEdgeAnalysis5x5
// TODO - optimize
// Asumption - colour image
// -------------------------------------------------------------------------------------------------------------------
void contEdgeAnalysis5x5(const u8* imageIn, const u8* directionIn, const unsigned int XX, const unsigned int YY, u8* stdOut) {

    u8 cc1[5];
    u8 cc2[5];
    u8 cc3[5];

    for (int jj= 2; jj < YY-2; jj++) {
        for (int ii = 3; ii < 3*(XX-1); ii+=3) {

            if ( directionIn[jj*XX+ii/3] > 0 ) {

                if ( directionIn[jj*XX+ii/3] == 1){
                    cc1[0] = imageIn[(jj-2)*3*XX + ii];
                    cc1[1] = imageIn[(jj-1)*3*XX + ii];
                    cc1[2] = imageIn[(jj-0)*3*XX + ii];
                    cc1[3] = imageIn[(jj+1)*3*XX + ii];
                    cc1[4] = imageIn[(jj+2)*3*XX + ii];

                    cc2[0] = imageIn[(jj-2)*3*XX + ii+1];
                    cc2[1] = imageIn[(jj-1)*3*XX + ii+1];
                    cc2[2] = imageIn[(jj-0)*3*XX + ii+1];
                    cc2[3] = imageIn[(jj+1)*3*XX + ii+1];
                    cc2[4] = imageIn[(jj+2)*3*XX + ii+1];

                    cc3[0] = imageIn[(jj-2)*3*XX + ii+2];
                    cc3[1] = imageIn[(jj-1)*3*XX + ii+2];
                    cc3[2] = imageIn[(jj-0)*3*XX + ii+2];
                    cc3[3] = imageIn[(jj+1)*3*XX + ii+2];
                    cc3[4] = imageIn[(jj+2)*3*XX + ii+2];
                }

                if ( directionIn[jj*XX+ii/3] == 2){
                    cc1[0] = imageIn[(jj-2)*3*XX + ii+2*3];
                    cc1[1] = imageIn[(jj-1)*3*XX + ii+1*3];
                    cc1[2] = imageIn[(jj-0)*3*XX + ii];
                    cc1[3] = imageIn[(jj+1)*3*XX + ii-1*3];
                    cc1[4] = imageIn[(jj+2)*3*XX + ii-2*3];

                    cc2[0] = imageIn[(jj-2)*3*XX + ii+2*3+1];
                    cc2[1] = imageIn[(jj-1)*3*XX + ii+1*3+1];
                    cc2[2] = imageIn[(jj-0)*3*XX + ii+1];
                    cc2[3] = imageIn[(jj+1)*3*XX + ii-1*3+1];
                    cc2[4] = imageIn[(jj+2)*3*XX + ii-2*3+1];

                    cc3[0] = imageIn[(jj-2)*3*XX + ii+2*3+2];
                    cc3[1] = imageIn[(jj-1)*3*XX + ii+1*3+2];
                    cc3[2] = imageIn[(jj-0)*3*XX + ii+2];
                    cc3[3] = imageIn[(jj+1)*3*XX + ii-1*3+2];
                    cc3[4] = imageIn[(jj+2)*3*XX + ii-2*3+2];
                }

                if ( directionIn[jj*XX+ii/3] == 3){
                    cc1[0] = imageIn[(jj-0)*3*XX + ii-2*3];
                    cc1[1] = imageIn[(jj-0)*3*XX + ii-1*3];
                    cc1[2] = imageIn[(jj-0)*3*XX + ii-0*3];
                    cc1[3] = imageIn[(jj+0)*3*XX + ii+1*3];
                    cc1[4] = imageIn[(jj+0)*3*XX + ii+2*3];

                    cc2[0] = imageIn[(jj-0)*3*XX + ii-2*3+1];
                    cc2[1] = imageIn[(jj-0)*3*XX + ii-1*3+1];
                    cc2[2] = imageIn[(jj-0)*3*XX + ii+1];
                    cc2[3] = imageIn[(jj+0)*3*XX + ii+1*3+1];
                    cc2[4] = imageIn[(jj+0)*3*XX + ii+2*3+1];

                    cc3[0] = imageIn[(jj-0)*3*XX + ii-2*3+2];
                    cc3[1] = imageIn[(jj-0)*3*XX + ii-1*3+2];
                    cc3[2] = imageIn[(jj-0)*3*XX + ii+2];
                    cc3[3] = imageIn[(jj+0)*3*XX + ii+1*3+2];
                    cc3[4] = imageIn[(jj+0)*3*XX + ii+2*3+2];
                }

                if ( directionIn[jj*XX+ii/3] == 3){
                    cc1[0] = imageIn[(jj-2)*3*XX + ii-2*3];
                    cc1[1] = imageIn[(jj-1)*3*XX + ii-1*3];
                    cc1[2] = imageIn[(jj-0)*3*XX + ii];
                    cc1[3] = imageIn[(jj+1)*3*XX + ii+1*3];
                    cc1[4] = imageIn[(jj+2)*3*XX + ii+2*3];

                    cc2[0] = imageIn[(jj-2)*3*XX + ii-2*3+1];
                    cc2[1] = imageIn[(jj-1)*3*XX + ii-1*3+1];
                    cc2[2] = imageIn[(jj-0)*3*XX + ii+1];
                    cc2[3] = imageIn[(jj+1)*3*XX + ii+1*3+1];
                    cc2[4] = imageIn[(jj+2)*3*XX + ii+2*3+1];

                    cc3[0] = imageIn[(jj-2)*3*XX + ii-2*3+2];
                    cc3[1] = imageIn[(jj-1)*3*XX + ii-1*3+2];
                    cc3[2] = imageIn[(jj-0)*3*XX + ii+2];
                    cc3[3] = imageIn[(jj+1)*3*XX + ii+1*3+2];
                    cc3[4] = imageIn[(jj+2)*3*XX + ii+2*3+2];
                }

                  // Count mean and std
                int mean1 = 0;
                int mean2 = 0;
                int mean3 = 0;

                int std1 = 0;
                int std2 = 0;
                int std3 = 0;


                for (int z = 0; z < 5; z++) {
                    mean1 += cc1[z];
                    mean2 += cc2[z];
                    mean3 += cc3[z];
                }
                mean1 /= 5;
                mean2 /= 5;
                mean3 /= 5;


                for (int z = 0; z < 5; z++) {
                    std1 += std::abs(cc1[z] - mean1);
                    std2 += std::abs(cc2[z] - mean2);
                    std3 += std::abs(cc3[z] - mean3);
                }

                if (std1 + std2 + std3 <  255)
                    stdOut[jj*XX+ii/3] = std1 + std2 + std3;
                else
                    stdOut[jj*XX+ii/3] = 255;

            } else
                stdOut[jj*XX+ii/3] = 0;


        }

    }
}

// mean in 7x7 patch
// std in 7x7 patch
void contEdgeAnalysis7x7_v2(const u8* imageIn, const u8* edgeImageIn, const unsigned int XX, const unsigned int YY, u8* stdOut) {

    int mean[3] ={0};
    int adev[3] = {0};

    for (int jj= 2; jj < YY-2; jj++) {
        for (int ii = 2*3; ii < 3*(XX-2); ii+=3) {

            if ( edgeImageIn[jj*XX+ii/3] > 0 ) {


                for (int j=-2;j <=2; j++) {
                    for (int i=-2; i <=2; i++) {
                        mean[0] += imageIn[(jj+j)*3*XX + ii+i*3];
                        mean[1] += imageIn[(jj+j)*3*XX + ii+i*3+1];
                        mean[2] += imageIn[(jj+j)*3*XX + ii+i*3+2];
                    }
                }
                mean[0] /= 25;
                mean[1] /= 25;
                mean[2] /= 25;

                for (int j=-2;j <=2; j++) {
                    for (int i=-2; i <=2; i++) {
                        adev[0] += std::abs(int(imageIn[(jj+j)*3*XX + ii+i*3])-mean[0]);
                        adev[1] += std::abs(int(imageIn[(jj+j)*3*XX + ii+i*3+1])-mean[1]);
                        adev[2] += std::abs(int(imageIn[(jj+j)*3*XX + ii+i*3+2])-mean[2]);
                    }
                }

                adev[0] /= 25;
                adev[1] /= 25;
                adev[2] /= 25;

                if (adev[0] + adev[1] + adev[2] <  255)
                    stdOut[jj*XX+ii/3] = adev[0] + adev[1] + adev[2];
                else
                    stdOut[jj*XX+ii/3] = 255;

            }else
                 stdOut[jj*XX+ii/3] = 0;

        }
    }
}

// -------------------------------------------------------------------------------------------------------------------
// contEdgeAnalysis5x5
// TODO - optimize
// Asumption - colour image
// -------------------------------------------------------------------------------------------------------------------
/*
void contEdgeAnalysis5x5_v3(const u8* imageIn, const u8* directionIn, const u8* directionFGMask, const unsigned int XX, const unsigned int YY, u8* stdOut) {


    int cc1 = 0;
    int cc2 = 0;
    int cc3 = 0;

    for (int jj= 2; jj < YY-2; jj++) {
        for (int ii = 3; ii < 3*(XX-1); ii+=3) {

            if ( directionIn[jj*XX+ii/3] > 0 && directionFGMask[jj*XX+ii/3] == 0 ) {

                if ( directionIn[jj*XX+ii/3] == 1*DISP_M0D){

                    cc1 = std::abs((int)(imageIn[(jj-2)*3*XX + ii])-int(imageIn[(jj+2)*3*XX + ii])) + abs((int)(imageIn[(jj-1)*3*XX + ii])-int(imageIn[(jj+1)*3*XX + ii]));
                    cc2 = std::abs((int)(imageIn[(jj-2)*3*XX + ii+1])-int(imageIn[(jj+2)*3*XX + ii+1])) + abs((int)(imageIn[(jj-1)*3*XX + ii+1])-int(imageIn[(jj+1)*3*XX + ii+1]));
                    cc3 = std::abs((int)(imageIn[(jj-2)*3*XX + ii+2])-int(imageIn[(jj+2)*3*XX + ii+2])) + abs((int)(imageIn[(jj-1)*3*XX + ii+2])-int(imageIn[(jj+1)*3*XX + ii+2]));

                }

                if ( directionIn[jj*XX+ii/3] == 2*DISP_M0D){

                    cc1 = abs((int)(imageIn[(jj+2)*3*XX + ii-2*3])-int(imageIn[(jj-2)*3*XX + ii+2*3])) + abs((int)(imageIn[(jj+1)*3*XX + ii-1*3])-int(imageIn[(jj-1)*3*XX + ii+1*3]));
                    cc2 = abs((int)(imageIn[(jj+2)*3*XX + ii-2*3+1])-int(imageIn[(jj-2)*3*XX + ii+2*3+1])) + abs((int)(imageIn[(jj+1)*3*XX + ii-1*3+1])-int(imageIn[(jj-1)*3*XX + ii+1*3+1]));
                    cc3 = abs((int)(imageIn[(jj+2)*3*XX + ii-2*3+2])-int(imageIn[(jj-2)*3*XX + ii+2*3+2])) + abs((int)(imageIn[(jj+1)*3*XX + ii-1*3+2])-int(imageIn[(jj-1)*3*XX + ii+1*3+2]));


                }

                if ( directionIn[jj*XX+ii/3] == 3*DISP_M0D ){
                    cc1 = abs((int)(imageIn[(jj)*3*XX + ii-2*3])-int(imageIn[(jj)*3*XX + ii+2*3])) + abs((int)(imageIn[(jj)*3*XX + ii-1*3])-int(imageIn[(jj)*3*XX + ii+1*3]));
                    cc2 = abs((int)(imageIn[(jj)*3*XX + ii-2*3+1])-int(imageIn[(jj)*3*XX + ii+2*3+1])) + abs((int)(imageIn[(jj)*3*XX + ii-1*3+1])-int(imageIn[(jj)*3*XX + ii+1*3+1]));
                    cc3 = abs((int)(imageIn[(jj)*3*XX + ii-2*3+2])-int(imageIn[(jj)*3*XX + ii+2*3+2])) + abs((int)(imageIn[(jj)*3*XX + ii-1*3+2])-int(imageIn[(jj)*3*XX + ii+1*3+2]));

                }
                if ( directionIn[jj*XX+ii/3] == 4*DISP_M0D){

                    cc1 = abs((int)(imageIn[(jj-2)*3*XX + ii-2*3])-int(imageIn[(jj+2)*3*XX + ii+2*3])) + abs((int)(imageIn[(jj-1)*3*XX + ii-1*3])-int(imageIn[(jj+1)*3*XX + ii+1*3]));
                    cc2 = abs((int)(imageIn[(jj-2)*3*XX + ii-2*3+1])-int(imageIn[(jj+2)*3*XX + ii+2*3+1])) + abs((int)(imageIn[(jj-1)*3*XX + ii-1*3+1])-int(imageIn[(jj+1)*3*XX + ii+1*3+1]));
                    cc3 = abs((int)(imageIn[(jj-2)*3*XX + ii-2*3+2])-int(imageIn[(jj+2)*3*XX + ii+2*3+2])) + abs((int)(imageIn[(jj-1)*3*XX + ii-1*3+2])-int(imageIn[(jj+1)*3*XX + ii+1*3+2]));

                }


                if (cc1 + cc2 + cc3 <  255)
                    stdOut[jj*XX+ii/3] = cc1 + cc2 + cc3;
                else
                    stdOut[jj*XX+ii/3] = 255;

            } else
                stdOut[jj*XX+ii/3] = 0;


        }

    }
}
*/
