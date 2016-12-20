#pragma once
#include "globals.h"

// !!! TODO !!! OPIS


// Parametry algorytmu:
#define ALPHA_1 0.984375
#define ALPHA_2 0.75
#define BG_TH 30;
#define FD_TH 30;

#define Y_WEIGHT    1.5
#define CBCR_WEIGHT 2

#define DECAY_FACTOR 15
#define STOP_UPDATE_THERSHOLD 200




class bgModelFixed
{
public:
	bgModelFixed(unsigned int XX, unsigned int YY);
	~bgModelFixed();

	void init(u8 *image);								                    //!< Initalize the model

    void segmentation(u8 *image, u8* fgMask, u8* moMask, bbox bb);		    //!< Perform segmentation i.e. bg subtracion and consecutive frame differencing
	//void update(u8 *image, u8* updateMask, u8* moMask, bbox bb);		    //!< Upadte the model with a given mask & also a selected update area (update queue)
    void updateAll(u8 *image);		                                        //!< Upadte the whole model


    //void segmentationLT(u8 *image, u8* fgMaskST, u8* fgMaskLT,u8* bgMask, u8* moMask);	//!< Perform segmentation i.e. bg subtracion and consecutive frame differencing (for short term, long term bg model)
    //void updateLT(u8 *image, u8* updateMask, u8* moMask, bbox bb);		    //!< Upadte the model with a given mask & also a selected update area (update queue) (for short term, long term bg model)


	void getBG(u8 *backgroundModel);					                     //!< Return the background model (TEMP - not for ARM)

    // Temporary solution !!!!!!! very not safe
    u32 *bgModel;				    //!< Background model

private:


	//float *bgModel;				    //!< Background model
	//float *bgModelLT;               //!< Long term BG model (just for simple test)
	u8    *prevFrame;		        //!< Previous frame
	u8    *mpu8_fgCounter;          //!< How many times was the pixel classified as foregournd

	// Image resolution
	unsigned int mui_XX;
	unsigned int mui_YY;


	// Update rates
	u32 mf_alpha_1;
	u32 mf_alpha_11;

	// This two are currently not used..
	//float mf_alpha_2;
	//float mf_alpha_21;

	u32 mf_weightY;           // weight for Y component
	u32 mf_weightCbCr;        // weight for CbCr component



	// Thresholds
	unsigned int mi_bgThreshold;    // background subtracion
	unsigned int mi_fdThreshold;    // frame differencing



};

