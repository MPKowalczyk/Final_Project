#include "labellerOnePass.h"
#include <iostream>



labellerOnePass::labellerOnePass(int XX, int YY)
{
	mpui_mergeTable = new unsigned int[MAX_LABELS];
	mpui_mergeChain = new unsigned int*[MAX_LABELS];
	for (int i = 0; i < MAX_LABELS; i++) {
		mpui_mergeChain[i] = new unsigned int[2];
	}

	mui_XX = XX;
	mui_YY = YY;

#ifdef DEBUG
	m_labelImage = new u8[mui_XX*mui_YY];
#endif

	mpui_labelLineBuffer = new unsigned int[mui_XX];


	// create containers for object parameters
	mp_objects = new object[MAX_LABELS];



}

labellerOnePass::~labellerOnePass()
{
	delete[] mpui_mergeTable;
	for (int i = 0; i < MAX_LABELS; i++) {
		delete[] mpui_mergeChain[i];
	}
	delete[]mpui_mergeChain;

#ifdef DEBUG
	delete[] m_labelImage;
#endif

	delete[] mpui_labelLineBuffer;


	// delete containers for labels
	delete [] mp_objects;


}

// -------------------------------------------------------------------------------------------------------------------
// step
//
// -------------------------------------------------------------------------------------------------------------------
void labellerOnePass::step(const u8 *binaryImage, const u8 *moMask, const u8* edgeInput, const u8* edgeBG, const u8* edgeFG) {
	// 012
	// 3X
	mui_currentLabel = 1;
	u8 mABCD[4];                // binary pixel context
	u8 mX;                      // binar pixel (current)

	unsigned int lABCD[4];		// current  labels
	unsigned int lDA = 0;       // connected lA and lD label (the lower of them)


	bool mAC;
	bool mDC;


	// TODO ? solve edge problem ?

	// label reset
	lABCD[0] = 0;
	lABCD[1] = 0;
	lABCD[2] = 0;
	lABCD[3] = 0;
	mpui_mergeTable[0] = 0; // set this value, as it is unused



	// clear line buffer
	for (int k = 0; k < mui_XX; k++)
		mpui_labelLineBuffer[k] = 0;

	// clear parameter buffers
	// TODO: Optimize ? try memset on arm ?
	for (int k = 0; k < MAX_LABELS; k++) {
		mp_objects[k].m00 = 0;
		mp_objects[k].m01 = 0;
		mp_objects[k].m10 = 0;
		mp_objects[k].ymax = 0;
		mp_objects[k].ymin = mui_YY;
		mp_objects[k].xmax = 0;
		mp_objects[k].xmin = mui_XX;
		mp_objects[k].movement = 0;
		mp_objects[k].similarityInput = 0;
		mp_objects[k].similarityBackground = 0;
		//mp_objects[k].stdInput = 0;
		//mp_objects[k].stdBackground = 0;

	}


	for (unsigned int j = 1; j < mui_YY - 1; j++) {

		// label reset
		lABCD[0] = 0;
		lABCD[1] = 0;
		lABCD[2] = 0;
		lABCD[3] = 0;

        // clear befor new line
        mui_mergeChainIndex =0;

		for (unsigned int i = 1; i < mui_XX - 1; i++) {

            // binary pixels from the context
			mABCD[0] = binaryImage[(j - 1)*mui_XX + (i - 1)];
			mABCD[1] = binaryImage[(j - 1)*mui_XX + (i)];
			mABCD[2] = binaryImage[(j - 1)*mui_XX + (i + 1)];
			mABCD[3] = binaryImage[(j)*mui_XX + (i - 1)];
            mX = binaryImage[(j)*mui_XX + (i)];

			// labels taken from buffers (simulation)
			lABCD[0] = lABCD[1]; //
			lABCD[1] = lABCD[2]; //
			if (mpui_labelLineBuffer[i + 1] > 0)
				lABCD[2] = mpui_mergeTable[mpui_labelLineBuffer[i + 1]];
			else
				lABCD[2] = 0;

			lABCD[3] = mpui_labelLineBuffer[i - 1];  // here, this will be the current line




			if (mX > 0) {

				if ((mABCD[0] == 0) && (mABCD[1] == 0) && (mABCD[2] == 0) && (mABCD[3] == 0)) { // newLabel
#ifdef DEBUG
					m_labelImage[j*mui_XX + i] = mui_currentLabel;		// assign the label (TEMP)
#endif
					mpui_labelLineBuffer[i] = mui_currentLabel;         // put this value into the line buffer
					mpui_mergeTable[mui_currentLabel] = mui_currentLabel;   // update the merge tabel with the label
					mui_currentLabel += 1;									// move to new label
					if ( mui_currentLabel >= MAX_LABELS) {
						mui_currentLabel = MAX_LABELS-1;					// secure
						//xil_printf("MAX_LABELS\n");
					}

				}
				else {	// there were previous labels


                    // three possible conflicts + both
                    mAC = (lABCD[1] == 0) && (lABCD[0] > 0) && (lABCD[2] >0) && (lABCD[0] != lABCD[2]);
                    mDC = (lABCD[1] == 0) && (lABCD[2] > 0) && (lABCD[3] >0) && (lABCD[2] != lABCD[3]);

                    // select lDA value
                    if (lABCD[0] > lABCD[3])
                        lDA = lABCD[3];
                    else
                        lDA = lABCD[0];

                    // Case 1 - both mAC and mDC are true
                    if (mAC && mDC ) {
                        if (lDA < lABCD[2] ) {
#ifdef DEBUG
                            m_labelImage[j*mui_XX + i] = lDA;
#endif
                            mpui_labelLineBuffer[i]  = lDA;

                            mpui_mergeTable[lABCD[2]] = lDA;
                            // this is not clear ?
                            lABCD[2] = lDA;
                        } else {
#ifdef DEBUG
                            m_labelImage[j*mui_XX + i] = lABCD[2];
#endif
                            mpui_labelLineBuffer[i]  = lABCD[2];

                            mpui_mergeTable[lDA] = lABCD[2];

                            // add to merge chain
                            mpui_mergeChain[mui_mergeChainIndex][0] = lDA;
                            mpui_mergeChain[mui_mergeChainIndex][1] = lABCD[2];
                            mui_mergeChainIndex++;
                        }
                    }
                    else {
                        if (mAC) {
                            if (lABCD[0] < lABCD[2]) {
#ifdef DEBUG
                                m_labelImage[j*mui_XX + i] = lABCD[0];
#endif
                                mpui_labelLineBuffer[i]  = lABCD[0];

                                mpui_mergeTable[lABCD[2]] = lABCD[0];
                                lABCD[2] = lABCD[0];
                            } else {
#ifdef DEBUG
                                m_labelImage[j*mui_XX + i] = lABCD[2];
#endif
                                mpui_labelLineBuffer[i]  = lABCD[2];

                                mpui_mergeTable[lABCD[0]] = lABCD[2];

                                 // add to merge chain
                                mpui_mergeChain[mui_mergeChainIndex][0] = lABCD[0];
                                mpui_mergeChain[mui_mergeChainIndex][1] = lABCD[2];
                                mui_mergeChainIndex++;

                            }
                        }
                        else {
                            if (mDC) {
                                if ( lABCD[3] < lABCD[2]) {
#ifdef DEBUG
                                   m_labelImage[j*mui_XX + i] = lABCD[3];
#endif
                                   mpui_labelLineBuffer[i]  = lABCD[3];

                                    mpui_mergeTable[lABCD[2]] = lABCD[3];
                                    lABCD[2] = lABCD[3];
                                } else {
#ifdef DEBUG
                                    m_labelImage[j*mui_XX + i] = lABCD[2];
#endif
                                    mpui_labelLineBuffer[i]  = lABCD[2];

                                    mpui_mergeTable[lABCD[3]] = lABCD[2];

                                    // add to merge chain
                                    mpui_mergeChain[mui_mergeChainIndex][0] = lABCD[3];
                                    mpui_mergeChain[mui_mergeChainIndex][1] = lABCD[2];
                                    mui_mergeChainIndex++;

                                }
                            }
                            else {  // no conflicts just the smaller label
                                // TEMP minimalnon zero
                                int minV = 10000;
                                for (int z = 0; z < 4; z++) {
                                    if (lABCD[z] != 0 && lABCD[z] < minV)
                                        minV = lABCD[z];
                                }
                                // TEMP assign this label
#ifdef DEBUG
                                m_labelImage[j*mui_XX + i] = minV;
#endif
                                // put this value into the line buffer
                                mpui_labelLineBuffer[i] = minV;

                            }
                        }

                    }










				}

				// Update object parametrs

				// centroid
				mp_objects[mpui_labelLineBuffer[i]].m00++;
				mp_objects[mpui_labelLineBuffer[i]].m10+=i;
				mp_objects[mpui_labelLineBuffer[i]].m01+=j;

				// bbox
				if (mp_objects[mpui_labelLineBuffer[i]].ymin > j)
					mp_objects[mpui_labelLineBuffer[i]].ymin = j;
				if (mp_objects[mpui_labelLineBuffer[i]].ymax < j)
					mp_objects[mpui_labelLineBuffer[i]].ymax = j;
				if (mp_objects[mpui_labelLineBuffer[i]].xmin > i)
					mp_objects[mpui_labelLineBuffer[i]].xmin = i;
				if (mp_objects[mpui_labelLineBuffer[i]].xmax < i)
					mp_objects[mpui_labelLineBuffer[i]].xmax = i;

                // analysis parameters
                // there is movment
                if (moMask[j*mui_XX + i] > 0)
                    mp_objects[mpui_labelLineBuffer[i]].movement++;

                if (edgeFG[j*mui_XX + i] > 0) {
                    // edge based fg objects similarity to input image

                    if ( edgeInput[j*mui_XX + i] ==  edgeFG[j*mui_XX + i] )
                        mp_objects[mpui_labelLineBuffer[i]].similarityInput++;
                    //else
                        //mp_objects[mpui_labelLineBuffer[i]].similarityInput--;


                    // edge based fg objects similarity to background image
                    if ( edgeBG[j*mui_XX + i] ==  edgeFG[j*mui_XX + i])
                        mp_objects[mpui_labelLineBuffer[i]].similarityBackground++;
                    //else
                        //mp_objects[mpui_labelLineBuffer[i]].similarityBackground--;

                }

                //if ( stdInput[j*mui_XX + i] > stdBackground[j*mui_XX + i] )
                //    mp_objects[mpui_labelLineBuffer[i]].stdBackground += stdBackground[j*mui_XX + i] ;
                //else
                //    mp_objects[mpui_labelLineBuffer[i]].stdInput += stdInput[j*mui_XX + i];




			}
			else {
#ifdef DEBUG
				m_labelImage[j*mui_XX + i] = 0;
#endif
				mpui_labelLineBuffer[i] = 0;
			}



		} // end of single line

		// merge the stack
		for (int k=mui_mergeChainIndex-1; k >=0 ; k--) {
            mpui_mergeTable[mpui_mergeChain[k][0]] = mpui_mergeTable[mpui_mergeChain[k][1]];
		}
	}

    //

	// debug
	//for (int z = 0; z < mui_currentLabel; z++)
	//	xil_printf("ID %d  m00 = %d \n",z,mpui_m00[z]);

    // print the mergeTable
    //for (int z = 0; z < mui_currentLabel; z++)
    //	std::cout << z <<" | " << mpui_mergeTable[z] << std::endl;

    // merge the parameters ...
    for (int i = 0; i < mui_currentLabel; i++) {
          int index = mpui_mergeTable[i];

            if(index>0 && index < MAX_LABELS && index != i) {
                mp_objects[index].m00 = mp_objects[index].m00 + mp_objects[i].m00;
                mp_objects[index].m01 = mp_objects[index].m01 + mp_objects[i].m01;
                mp_objects[index].m10 = mp_objects[index].m10 + mp_objects[i].m10;

                if (mp_objects[index].ymin > mp_objects[i].ymin) {
                    mp_objects[index].ymin = mp_objects[i].ymin;
                }
                if (mp_objects[index].ymax < mp_objects[i].ymax) {
                    mp_objects[index].ymax = mp_objects[i].ymax;
                }
                if (mp_objects[index].xmin > mp_objects[i].xmin) {
                    mp_objects[index].xmin = mp_objects[i].xmin;
                }
                if (mp_objects[index].xmax < mp_objects[i].xmax) {
                    mp_objects[index].xmax = mp_objects[i].xmax;
                }

                mp_objects[index].movement = mp_objects[index].movement + mp_objects[i].movement;
                mp_objects[index].similarityInput  = mp_objects[index].similarityInput  + mp_objects[i].similarityInput;
                mp_objects[index].similarityBackground = mp_objects[index].similarityBackground  + mp_objects[i].similarityBackground;

                //mp_objects[index].stdInput  = mp_objects[index].stdInput  + mp_objects[i].stdInput;
                //mp_objects[index].stdBackground = mp_objects[index].stdBackground  + mp_objects[i].stdBackground;



                mp_objects[i].m00 = 0;
                mp_objects[i].m01 = 0;
                mp_objects[i].m10 = 0;
                mp_objects[i].ymin = 0;
                mp_objects[i].ymax = 0;
                mp_objects[i].xmin = 0;
                mp_objects[i].xmax = 0;
                mp_objects[i].movement =0;
                mp_objects[i].similarityInput =0;
                mp_objects[i].similarityBackground =0;
                //mp_objects[i].stdInput =0;
                //mp_objects[i].stdBackground =0;


            }
    }
    // debug
	//for (int z = 0; z < mui_currentLabel; z++)
    //   if (mpui_m00[z] != 0 )
	//	std::cout << "ID " << z << " m00 = " << mpui_m00[z] << std::endl;
    //xil_printf("mui_currentLabel %d",mui_currentLabel);


}
#ifdef DEBUG
void labellerOnePass::getImage(u8 *labelImage) {
	std::copy(m_labelImage,m_labelImage+mui_XX*mui_YY,labelImage);
}
#endif

void labellerOnePass::getParameters(unsigned int &noObjects, object *objects) {
	std::copy(mp_objects, mp_objects + MAX_LABELS, objects);
	noObjects = mui_currentLabel;
}

/*
void labellerOnePass::getBiggestObject(unsigned int& ymax, unsigned int& ymin, unsigned int& xmax, unsigned int& xmin) {
	unsigned int biggest = 0;
	//xil_printf("mui_currentLabel = %d \n",mui_currentLabel);

	for (unsigned int z = 0; z < mui_currentLabel; z++) {

		if ( mpui_m00[z] > biggest) {
			//xil_printf("m00 =%d \n",mpui_m00[z]);
			biggest = mpui_m00[z];
			ymax = mpui_ymax[z];
			ymin = mpui_ymin[z];
			xmax = mpui_xmax[z];
			xmin = mpui_xmin[z];
		}
	}
}
*/

