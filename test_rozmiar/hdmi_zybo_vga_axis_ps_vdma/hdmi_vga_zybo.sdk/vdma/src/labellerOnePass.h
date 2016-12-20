#pragma once

#include "globals.h"

//#include "xbasic_types.h"
//#include "xil_io.h"

#define MAX_LABELS 1024 // ???
//#define DEBUG


struct object {
    unsigned int m00;
	unsigned int m10;
	unsigned int m01;
	unsigned int ymin;
	unsigned int ymax;
	unsigned int xmin;
	unsigned int xmax;
	unsigned int movement;
	int similarityInput;
	int similarityBackground;
	//unsigned int stdInput;
	//unsigned int stdBackground;
};

class labellerOnePass
{
public:
	labellerOnePass(int XX, int YY);
   	~labellerOnePass();

	void step(const u8 *binaryImage, const u8 *moMask, const u8* edgeInput, const u8* edgeBG, const u8* edgeFG);
	void getParameters(unsigned int &noObjects, object *objects) ;
	void getBiggestObject(unsigned int& ymax, unsigned int& ymin, unsigned int& xmax, unsigned int& xmin);

#ifdef DEBUG
	void getImage(u8 *labelImage);		                                                                                            // TEMP function (for debug only)
#endif

private:

	unsigned int  *mpui_mergeTable;		 //!< merge table container
	unsigned int **mpui_mergeChain;      //!< merge chain (conflicts) container
	unsigned int   mui_mergeChainIndex;  //!< merge chain index

	// containers for parameters ..
    object *mp_objects;





#ifdef DEBUG
	// TEMP - image
	u8* m_labelImage;
#endif

	unsigned int mui_currentLabel;
	unsigned int *mpui_labelLineBuffer;


	unsigned int mui_XX;
	unsigned int mui_YY;

};

