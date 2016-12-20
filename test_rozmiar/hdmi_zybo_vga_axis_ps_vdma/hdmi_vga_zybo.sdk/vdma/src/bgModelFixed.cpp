#include "bgModelFixed.h"
#include <cmath>
#include <iostream>
#include <algorithm>

#define BG_TH 30;
#define FD_TH 30;

bgModelFixed::bgModelFixed(unsigned int XX, unsigned int YY)
{
	mf_alpha_11 = 3000;
	mf_alpha_1  = 62536;



	mf_weightY = 256 + 128; // chyba
	mf_weightCbCr = CBCR_WEIGHT << 8;

	mi_bgThreshold = 30 << 16;
	mi_fdThreshold = FD_TH;

	mui_XX = XX;
	mui_YY = YY;

	bgModel   = new u32[mui_XX*mui_YY * 3];
	//bgModelLT = new float[mui_XX*mui_YY * 3];
	prevFrame = new u8[mui_XX*mui_YY];      // Only the Y component

	// Experiment by AS
	//mpu8_fgCounter = new u8[mui_XX*mui_YY];
	//memset(mpu8_fgCounter,0,mui_XX*mui_YY*sizeof(u8));
}


bgModelFixed::~bgModelFixed()
{
	delete[] bgModel;
	//delete [] bgModelLT;
	delete[] prevFrame;

    // Experiment by AS
	//delete [] mpu8_fgCounter;
}

// -------------------------------------------------------------------------------------------------------------------
// init
// - initalize the background model (simple copy the first frame)
// -------------------------------------------------------------------------------------------------------------------
void bgModelFixed::init(u8 *image) {

	for (int k = 0; k < mui_YY*mui_XX * 3; k += 1) {

		bgModel[k] = (u32)(image[k] << 8);
		// also the long term one
		//bgModelLT[k] = (float)(image[k]);
		prevFrame[k/3] = image[k/3];
	}
}


// -------------------------------------------------------------------------------------------------------------------
// segmentation
//
//	- compute the consevutive frame difference
//	- compute the foreground mask
//
// -------------------------------------------------------------------------------------------------------------------
void bgModelFixed::segmentation(u8 *image, u8* fgMask, u8* moMask, bbox bb) {

	int binaryImageCnt = 0;
	for (int k = 0; k < mui_YY*mui_XX * 3; k += 3) {

		// foreground mask computation
		//int dy = mf_weightY*std::abs(int(image[k]<<8) - int(bgModel[k]));
		//int dcbcr =  mf_weightCbCr*(std::abs(int(image[k + 1]<<8) - int(bgModel[k + 1])) + std::abs(int(image[k + 2]<<8) - int(bgModel[k + 2])));
		if (mf_weightY*std::abs(int(image[k]<<8) - int(bgModel[k])) + mf_weightCbCr*(std::abs(int(image[k + 1]<<8) - int(bgModel[k + 1])) + std::abs(int(image[k + 2]<<8) - int(bgModel[k + 2])))> mi_bgThreshold) {
			fgMask[binaryImageCnt] = 255;
			//mpu8_fgCounter[binaryImageCnt]++;
		}
		else {
			fgMask[binaryImageCnt] = 0;
			// TODO If works -decay factor
            //if (mpu8_fgCounter[binaryImageCnt] > 5)ziko balicka kraków
            //    mpu8_fgCounter[binaryImageCnt]-=5;
		}
		// consecutive frame differencing computation
		// here we do not need weighting
		//if (std::abs(image[k] - prevFrame[k]) + std::abs(image[k + 1] - prevFrame[k + 1]) + std::abs(image[k + 2] - prevFrame[k + 2]) > mi_fdThreshold)
		if (std::abs(int(image[binaryImageCnt]) - prevFrame[binaryImageCnt]) > mi_fdThreshold)
			moMask[binaryImageCnt] = 255;
		else
			moMask[binaryImageCnt] = 0;

        // Save previous frame
		prevFrame[binaryImageCnt] = image[binaryImageCnt];

        if ( fgMask[binaryImageCnt] == 0 && moMask[binaryImageCnt] == 0 ) {
            bgModel[k]   = (bgModel[k] * mf_alpha_1   + (image[k]<<8)*mf_alpha_11)   >> 16;
            bgModel[k+1] = (bgModel[k+1] * mf_alpha_1 + (image[k+1]<<8)*mf_alpha_11) >> 16;
            bgModel[k+2] = (bgModel[k+2] * mf_alpha_1 + (image[k+2]<<8)*mf_alpha_11) >> 16;
		}

		// Increase the binary counter

		binaryImageCnt++;
	}

	if ( bb.xmax > 0 ) {  // i.e. there is something to update
        // debug
        //std::cout << "Removing object "<< bb.xmin << " | " << bb.xmax << " | " << bb.ymin << " | " << bb.xmax << std::endl;
        for (unsigned int jj= bb.ymin; jj <= bb.ymax; jj++) {
            for (unsigned int ii= 3*bb.xmin; ii <= 3*bb.xmax; ii+=3) {
                bgModel[jj*3*mui_XX+ii]   =  (image[jj*3*mui_XX+ii] << 8);
                bgModel[jj*3*mui_XX+ii+1]  = (image[jj*3*mui_XX+ii+1] << 8);
                bgModel[jj*3*mui_XX+ii+2]  = (image[jj*3*mui_XX+ii+2] << 8);
            }
        }
    }



}

// -------------------------------------------------------------------------------------------------------------------
// segmentationLT
//  - segmentation with short and long term model
//	- compute the consevutive frame difference
//	- compute the foreground mask
// -------------------------------------------------------------------------------------------------------------------
/*
void bgModelFloat::segmentationLT(u8 *image, u8* fgMaskST, u8* fgMaskLT,u8* bgMask, u8* moMask) {

    int binaryImageCnt = 0;
	for (int k = 0; k < mui_YY*mui_XX * 3; k += 3) {

		// ST foreground mask computation
		if ( mf_weightY*std::abs(float(image[k]) - bgModel[k]) + mf_weightCbCr*(std::abs(float(image[k + 1]) - bgModel[k + 1]) + std::abs(float(image[k + 2]) - bgModel[k + 2])) > mi_bgThreshold) {
			fgMaskST[binaryImageCnt] = 255;
		}
		else {
			fgMaskST[binaryImageCnt] = 0;
		}
		// LT foreground mask computation
		if ( mf_weightY*std::abs(float(image[k]) - bgModelLT[k]) + mf_weightCbCr*(std::abs(float(image[k + 1]) - bgModelLT[k + 1]) + std::abs(float(image[k + 2]) - bgModelLT[k + 2])) > mi_bgThreshold) {
			fgMaskLT[binaryImageCnt] = 255;
		}
		else {
			fgMaskLT[binaryImageCnt] = 0;
		}

		// LT foreground mask computation
		if ( mf_weightY*std::abs(bgModel[k] - bgModelLT[k]) + mf_weightCbCr*(std::abs(bgModel[k + 1] - bgModelLT[k + 1]) + std::abs(bgModel[k + 2] - bgModelLT[k + 2])) > mi_bgThreshold) {
			bgMask[binaryImageCnt] = 255;
		}
		else {
			bgMask[binaryImageCnt] = 0;
		}




		// consecutive frame differencing computation
		// here we do not need weighting
		if (std::abs(image[k] - prevFrame[k]) + std::abs(image[k + 1] - prevFrame[k + 1]) + std::abs(image[k + 2] - prevFrame[k + 2]) > mi_fdThreshold)
			moMask[binaryImageCnt] = 255;
		else
			moMask[binaryImageCnt] = 0;

		// Increase the binary counter
		binaryImageCnt++;

	}
	// TODO Does memcpy work on ARM ?
	std::copy(image, image +3 * mui_XX*mui_YY , prevFrame);
}
*/


// -------------------------------------------------------------------------------------------------------------------
// updateAll
//
// ------------------------------------------------------------------------------------------------------------------
 void bgModelFixed::updateAll(u8 *image) {
    for (int k = 0; k < mui_YY*mui_XX * 3; k += 3) {

//        bgModel[k]   = bgModel[k] * mf_alpha_2   + (float)(image[k])*mf_alpha_21;
//        bgModel[k+1] = bgModel[k+1] * mf_alpha_2 + (float)(image[k+1])*mf_alpha_21;
//        bgModel[k+2] = bgModel[k+2] * mf_alpha_2 + (float)(image[k+2])*mf_alpha_21;

    }
 }

// -------------------------------------------------------------------------------------------------------------------
// update
//
// -------------------------------------------------------------------------------------------------------------------
/*
void bgModelFloat::update(u8 *image, u8* updateMask, u8* moMask, bbox bb) {

    int binaryImageCnt = 0;
	for (int k = 0; k < mui_YY*mui_XX * 3; k += 3) {

        // Udate BG model
		// Conservative update policy
		// i.e pixel not moving,
        // pixel not foreground
		if ( updateMask[binaryImageCnt] == 0 && moMask[binaryImageCnt] == 0 ) {
            bgModel[k]   = bgModel[k] * mf_alpha_1   + (float)(image[k])*mf_alpha_11;
            bgModel[k+1] = bgModel[k+1] * mf_alpha_1 + (float)(image[k+1])*mf_alpha_11;
            bgModel[k+2] = bgModel[k+2] * mf_alpha_1 + (float)(image[k+2])*mf_alpha_11;
		}

		// We are in the special update bbox

		// TODO - jeszcze ta pośrednia polityka


		// Update prevention by Artur Skirzynski (C)
		// This should prevent the objects to be bleded into background
		// TODO Add upper limit

        if ( fgMask[binaryImageCnt] > 0 && moMask[binaryImageCnt] == 0 ) {
            if (mpu8_fgCounter[binaryImageCnt] < 255 )
                mpu8_fgCounter[binaryImageCnt]++;
        }
        else {
            if (mpu8_fgCounter[binaryImageCnt] >= DECAY_FACTOR) {
                mpu8_fgCounter[binaryImageCnt]-= DECAY_FACTOR;
            }
        }

        if ( mpu8_fgCounter[binaryImageCnt] < STOP_UPDATE_THERSHOLD ) {

            bgModel[k] = bgModel[k] * mf_alpha_1 + (float)(image[k])*mf_alpha_11;
            bgModel[k+1] = bgModel[k+1] * mf_alpha_1 + (float)(image[k+1])*mf_alpha_11;
            bgModel[k+2] = bgModel[k+2] * mf_alpha_1 + (float)(image[k+2])*mf_alpha_11;
        }

        binaryImageCnt++;

	}

	// Extra update of the bbox area (here as this may not happen every iteration
    // This way it should be faster


    if ( bb.xmax > 0 ) {  // i.e. there is something to update
        // debug
        std::cout << "Removing object "<< bb.xmin << " | " << bb.xmax << " | " << bb.ymin << " | " << bb.xmax << std::endl;
        for (unsigned int jj= bb.ymin; jj <= bb.ymax; jj++) {
            for (unsigned int ii= 3*bb.xmin; ii <= 3*bb.xmax; ii+=3) {
                bgModel[jj*3*mui_XX+ii]   = (float)(image[jj*3*mui_XX+ii]);
                bgModel[jj*3*mui_XX+ii+1]  = (float)(image[jj*3*mui_XX+ii+1]);
                bgModel[jj*3*mui_XX+ii+2]  = (float)(image[jj*3*mui_XX+ii+2]);
            }
        }
    }
}
*/

// -------------------------------------------------------------------------------------------------------------------
// updateLT
//
// -------------------------------------------------------------------------------------------------------------------
/*
void bgModelFloat::updateLT(u8 *image, u8* updateMask, u8* moMask, bbox bb) {
    int binaryImageCnt = 0;
	for (int k = 0; k < mui_YY*mui_XX * 3; k += 3) {

        // Udate BG model
		// Conservative update policy
		// i.e pixel not moving,
        // pixel not foreground
		//if ( updateMask[binaryImageCnt] == 0 && moMask[binaryImageCnt] == 0 ) {
            bgModel[k]   = bgModel[k] * mf_alpha_1   + (float)(image[k])*mf_alpha_11;
            bgModel[k+1] = bgModel[k+1] * mf_alpha_1 + (float)(image[k+1])*mf_alpha_11;
            bgModel[k+2] = bgModel[k+2] * mf_alpha_1 + (float)(image[k+2])*mf_alpha_11;
		//}
		if ( updateMask[binaryImageCnt] == 0 && moMask[binaryImageCnt] == 0 ) {
            bgModelLT[k]   = bgModelLT[k]   * mf_alpha_2   + (float)(image[k])*mf_alpha_21;
            bgModelLT[k+1] = bgModelLT[k+1] * mf_alpha_2 + (float)(image[k+1])*mf_alpha_21;
            bgModelLT[k+2] = bgModelLT[k+2] * mf_alpha_2 + (float)(image[k+2])*mf_alpha_21;
		}
        //    bgModelLT[k]   = bgModelLT[k] * mf_alpha_2   + (bgModel[k])*mf_alpha_21;
        //    bgModelLT[k+1] = bgModelLT[k+1] * mf_alpha_2 + (bgModel[k+1])*mf_alpha_21;
        //    bgModelLT[k+2] = bgModelLT[k+2] * mf_alpha_2 + (bgModel[k+2])*mf_alpha_21;


		// We are in the special update bbox

		// TODO - jeszcze ta pośrednia polityka


		// Update prevention by Artur Skirzynski (C)
		// This should prevent the objects to be bleded into background
		// TODO Add upper limit

        if ( fgMask[binaryImageCnt] > 0 && moMask[binaryImageCnt] == 0 ) {
            if (mpu8_fgCounter[binaryImageCnt] < 255 )
                mpu8_fgCounter[binaryImageCnt]++;
        }
        else {
            if (mpu8_fgCounter[binaryImageCnt] >= DECAY_FACTOR) {
                mpu8_fgCounter[binaryImageCnt]-= DECAY_FACTOR;
            }
        }

        if ( mpu8_fgCounter[binaryImageCnt] < STOP_UPDATE_THERSHOLD ) {

            bgModel[k] = bgModel[k] * mf_alpha_1 + (float)(image[k])*mf_alpha_11;
            bgModel[k+1] = bgModel[k+1] * mf_alpha_1 + (float)(image[k+1])*mf_alpha_11;
            bgModel[k+2] = bgModel[k+2] * mf_alpha_1 + (float)(image[k+2])*mf_alpha_11;
        }

        //binaryImageCnt++;

	}

	// Extra update of the bbox area (here as this may not happen every iteration
    // This way it should be faster


    if ( bb.xmax > 0 ) {  // i.e. there is something to update
        // debug
        std::cout << "Removing object "<< bb.xmin << " | " << bb.xmax << " | " << bb.ymin << " | " << bb.xmax << std::endl;
        for (unsigned int jj= bb.ymin; jj <= bb.ymax; jj++) {
            for (unsigned int ii= 3*bb.xmin; ii <= 3*bb.xmax; ii+=3) {
                bgModelLT[jj*3*mui_XX+ii]   = (float)(image[jj*3*mui_XX+ii]);
                bgModelLT[jj*3*mui_XX+ii+1]  = (float)(image[jj*3*mui_XX+ii+1]);
                bgModelLT[jj*3*mui_XX+ii+2]  = (float)(image[jj*3*mui_XX+ii+2]);
            }
        }
    }

}
*/
// -------------------------------------------------------------------------------------------------------------------
// getBG
// TODO - optimize
// -------------------------------------------------------------------------------------------------------------------
void bgModelFixed::getBG(u8 *backgroundModel) {
	for (int k = 0; k < mui_YY*mui_XX * 3; k += 1)
		backgroundModel[k] = (u8)(bgModel[k]>>8);
}
