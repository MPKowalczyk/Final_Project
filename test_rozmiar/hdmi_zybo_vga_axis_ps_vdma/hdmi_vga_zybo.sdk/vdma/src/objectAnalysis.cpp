#include "objectAnalysis.h"
#include <iostream>

// -------------------------------------------------------------------------------------------------------------------
// objectAnalysis
// -------------------------------------------------------------------------------------------------------------------
objectAnalysis::objectAnalysis()
{
    mb_firstFrame = true;
    mui_frameCounter = 0;

    // Initialize ID stack
    for (int id=MAX_LABELS; id >=0; id--) {
        m_IDStack.push(id);
    }
}

// -------------------------------------------------------------------------------------------------------------------
// ~objectAnalysis
// -------------------------------------------------------------------------------------------------------------------
objectAnalysis::~objectAnalysis()
{
    //delete [] mp_objects;
}


// TODO There is a problem with current objets bbox analysis

void objectAnalysis::step(const unsigned int noObjects, object *objects){
    // simple clean the object list
    int z = 0;
    objectParameters ob;
    mui_frameCounter++;



    // Process the first frame
    if (mb_firstFrame) {
        mb_firstFrame = false;

        for (int i=0; i < noObjects; i++) {
            // sizeFiltering
            // TODO OPTIMIZE !!!

            // Now we consider only static object of certain size
             if ( objects[i].m00 > MIN_OBJECT_SIZE && float(objects[i].movement)/float(objects[i].m00) < MOVEMENT_TH ) {

                z = m_IDStack.top();                       // assign new  ID from the stack
                m_IDStack.pop();                           // remove this ID from the stack
                ob.ID = z;

                ob.visible = true;
                ob.occluded = false;
                ob.alarm = false;

                ob.area = objects[i].m00;
                //mp_objects[z].m01 = objects[i].m10;
                //mp_objects[z].m10 = objects[i].m01;
                ob.bb.xmin = objects[i].xmin;
                ob.bb.xmax = objects[i].xmax;
                ob.bb.ymin = objects[i].ymin;
                ob.bb.ymax = objects[i].ymax;

                ob.similarityBackground = objects[i].similarityBackground;
                ob.similarityInput = objects[i].similarityInput;
                //ob.stdBackground = objects[i].stdBackground;
                //ob.stdInput = objects[i].stdInput;

                ob.staticCounter = 0;
                ob.toRemoveCounter =0;

                m_objects.push_back(ob);

            }
        }
    } else { // This is not the first frame....
        // TODO This should be improved - eg. by using a container to easyly remove objects from the strucure

        // "Turn off all previous objects"
        for (int iPO = 0; iPO < m_objects.size(); iPO++) {
            m_objects[iPO].visible = false;
        }

        for (int iNO =0; iNO < noObjects; iNO ++) { // loop over the new objects ...


            // 1. Check the area && if it is stable  (this is an experimental issue)
            if ( objects[iNO].m00 > MIN_OBJECT_SIZE && float(objects[iNO].movement)/float(objects[iNO].m00) < MOVEMENT_TH) {
                // debug
                //std::cout << "New object ID = " << iNO << std::endl;

                int assignedID = -1;
                float maxIntersection = 0;

                for (int iPO = 0; iPO < m_objects.size(); iPO++) {

                    // 2. Check bbox overlapping
                    unsigned int intersection = rectangleIntersection(objects[iNO].xmin,objects[iNO].xmax,objects[iNO].ymin,objects[iNO].ymax,
                                                                      m_objects[iPO].bb.xmin,m_objects[iPO].bb.xmax,m_objects[iPO].bb.ymin,m_objects[iPO].bb.ymax);

                    // TODO Is this correct ?
                    float intersectionArea = float(intersection)/ ((m_objects[iPO].bb.xmax -m_objects[iPO].bb.xmin)*(m_objects[iPO].bb.ymax -m_objects[iPO].bb.ymin));

                    // Here we should add a limit to prevent big changes in size
                    float areaRatio = float(objects[iNO].m00) / float(m_objects[iPO].area);

                    // TODO ??? Will this work that way ?
                    if ( intersectionArea > maxIntersection && areaRatio > 0.8 && areaRatio < 1.2  ) {
                        maxIntersection = intersectionArea;
                        assignedID = m_objects[iPO].ID;
                        // debug
                        //std::cout << "Old object ID = " << mp_objects[iPO].ID << " INTER = " << intersectionArea << std::endl;
                    }
                }

                // 3. Analyse the results ...
                // A. No matching object => create new static object
                if (assignedID == -1) {
                        z = m_IDStack.top();                       // assign new  ID from the stack
                        m_IDStack.pop();                           // remove this ID from the stack
                        ob.ID = z;

                        ob.visible = true;
                        ob.occluded = false;
                        ob.alarm = false;

                        ob.area = objects[iNO].m00;
                        //mp_objects[z].m01 = objects[i].m10;
                        //mp_objects[z].m10 = objects[i].m01;
                        ob.bb.xmin = objects[iNO].xmin;
                        ob.bb.xmax = objects[iNO].xmax;
                        ob.bb.ymin = objects[iNO].ymin;
                        ob.bb.ymax = objects[iNO].ymax;

                        ob.similarityBackground = objects[iNO].similarityBackground;
                        ob.similarityInput = objects[iNO].similarityInput;
                        //ob.stdBackground = objects[iNO].stdBackground;
                        //ob.stdInput = objects[iNO].stdInput;



                        ob.staticCounter = 0;
                        ob.toRemoveCounter =0;

                        m_objects.push_back(ob);


                } else {
                // B. Threre is a matching object - update paramteres

                    m_objects[assignedID].area = objects[iNO].m00;
                    m_objects[assignedID].visible = true;
                    m_objects[assignedID].occluded = false;
                    m_objects[assignedID].alarm = false;
                    //mp_objects[z].m01 = objects[i].m10;
                    //mp_objects[z].m10 = objects[i].m01;

                    //TODO Shall we increase bbox?

                    m_objects[assignedID].bb.xmin = objects[iNO].xmin;
                    m_objects[assignedID].bb.xmax = objects[iNO].xmax;
                    m_objects[assignedID].bb.ymin = objects[iNO].ymin;
                    m_objects[assignedID].bb.ymax = objects[iNO].ymax;

                    m_objects[assignedID].similarityBackground = objects[iNO].similarityBackground;
                    m_objects[assignedID].similarityInput = objects[iNO].similarityInput;
                    //m_objects[assignedID].stdBackground = objects[iNO].stdBackground;
                    //m_objects[assignedID].stdInput = objects[iNO].stdInput;

                    // Increase the static counter
                    m_objects[assignedID].staticCounter++;
                }
            } else {}
                // For smaller objects
                // JUST A TEST
                /*
                if ( objects[iNO].m00 > 20 && objects[iNO].m00 <= MIN_OBJECT_SIZE && float(objects[iNO].movement)/float(objects[iNO].m00) < MOVEMENT_TH) {
                    bbox bb;
                    bb.xmin = objects[iNO].xmin;
                    bb.xmax = objects[iNO].xmax;
                    bb.ymin = objects[iNO].ymin;
                    bb.ymax = objects[iNO].ymax;
                    m_obRemoveQueue.push(bb);
                }
                */

        }
    }

    // Now we analyse the objects that were not assigned in the current run
    // By the way we also analyse the stopped ones
    // "Turn off all previous objects"
    for (int iPO = 0; iPO < m_objects.size(); iPO++) {

        if ( m_objects[iPO].visible == false) {

            // To prevent occlusion an object with was stable for certain time is not removed, but
            // keept as occluded
            if (m_objects[iPO].staticCounter > OCCLUSION_COUNTER_NUMBER) {
                m_objects[iPO].staticCounter -= OCCLUSION_DECAY;
                m_objects[iPO].occluded = true;
            }
            // The object is removed form the list an the ID is ready for re-use
            else {
                // debug
                //std::cout <<"Free ID = " << m_objects[iPO].ID << std::endl;
                //m_IDStack.push(m_objects[iPO].ID);
                //m_objects[iPO].visible=false;
                //m_objects[iPO].occluded=false;

            }
        }

        // TODO Set thresholds
        if (m_objects[iPO].staticCounter > 100 && m_objects[iPO].staticCounter < OBJECT_ALARM_THERSHOLD) {
            // Here we check the simillarity with background / foreground frame
            // TODO Check - or both have negative silimarity || m_objects[iPO].similarityBackground < 0 && m_objects[iPO].similarityInput < 0
            //|| float(m_objects[iPO].stdInput) / float(m_objects[iPO].stdBackground) < 0.75
            // TODO Good threshold ?
            // Update all during initalization period

            if ( float(m_objects[iPO].similarityBackground)/float(m_objects[iPO].similarityInput) > 1.05|| mui_frameCounter < 200 ) {
                m_objects[iPO].toRemoveCounter++;

                // Add this object to remove list
                if (m_objects[iPO].toRemoveCounter > 25)
                    m_obRemoveQueue.push(m_objects[iPO].bb);
            }
        } else {
            if (m_objects[iPO].toRemoveCounter > 5)
                m_objects[iPO].toRemoveCounter-=5;
        }

        if (m_objects[iPO].staticCounter > OBJECT_ALARM_THERSHOLD) {
           // Trigger an alarm
           // This object shall not be removed from the list
           m_objects[iPO].alarm = true;
        }
    }

}

void objectAnalysis::simpleObjectAnalysis(const unsigned int noObjects, object *objects) {

     int z=0;
      for (int i=0; i < noObjects; i++) {

            // sizeFiltering
            // TODO OPTIMIZE !!!
            if ( objects[i].m00 > MIN_OBJECT_SIZE ) {

                m_objects[z].ID = i;  // assign new ID

                m_objects[z].area = objects[i].m00;
                //mp_objects[z].m01 = objects[i].m10;
                //mp_objects[z].m10 = objects[i].m01;
                m_objects[z].bb.xmin = objects[i].xmin;
                m_objects[z].bb.xmax = objects[i].xmax;
                m_objects[z].bb.ymin = objects[i].ymin;
                m_objects[z].bb.ymax = objects[i].ymax;

                //if ( float(objects[i].movement)/float(mp_objects[z].area) > MOVEMENT_TH)
                //    mp_objects[z].movement = true;
                //else
                //    mp_objects[z].movement = false;

                m_objects[z].similarityBackground = objects[i].similarityBackground;
                m_objects[z].similarityInput = objects[i].similarityInput;
                //m_objects[z].stdBackground = objects[i].stdBackground;
                //m_objects[z].stdInput = objects[i].stdInput;


                z++;
            }
        }
}

// -------------------------------------------------------------------------------------------------------------------
// objectToRemove
// -------------------------------------------------------------------------------------------------------------------
void objectAnalysis::objectToRemove(bbox &b) {
    b.xmax = 0;
    // debug
    //std::cout << "Q size = " << m_obRemoveQueue.size() << std::endl;
    if (m_obRemoveQueue.size() > 0 ) {
        b =  m_obRemoveQueue.front();
        m_obRemoveQueue.pop();
    }
}

// -------------------------------------------------------------------------------------------------------------------
// displayObjectParameters
// -------------------------------------------------------------------------------------------------------------------
void objectAnalysis::displayObjectParameters() {


    for (int  i=0; i < m_objects.size(); i++ ) {

        //std::cout << "ID " << m_objects[i].ID << " area = " << m_objects[i].area << " bbox = [" <<  m_objects[i].bb.xmin <<", "<<m_objects[i].bb.xmax <<", "<<  m_objects[i].bb.ymin <<", "<<m_objects[i].bb.ymax <<"]  IS = " << m_objects[i].similarityInput << " BS = "
         //         << m_objects[i].similarityBackground
         //         << " SI = " << m_objects[i].stdInput << " SB = " << m_objects[i].stdBackground  << std::endl;

        xil_printf("ID = %d, area = %d \n",m_objects[i].ID ,m_objects[i].area);

    }

    //std::cout<<std::endl;

}

void objectAnalysis::getObjectParameters(unsigned int &noObjects, objectParameters *obParameters) {
    noObjects = m_objects.size();

    for (int  i=0; i < m_objects.size(); i++ ) {
        obParameters[i] = m_objects[i];

    }

    //std::copy(mp_objects,mp_objects+mui_noObjetcs,obParameters);
}




// TOOL

unsigned int objectAnalysis::rectangleIntersection(unsigned int xmin_a, unsigned int xmax_a,unsigned int ymin_a, unsigned int ymax_a,
                                                   unsigned int xmin_b, unsigned int xmax_b,unsigned int ymin_b, unsigned int ymax_b) {

    int x_intersection = min(xmax_a, xmax_b) - max(xmin_a, xmin_b) + 1;
    int y_intersection = min(ymax_a, ymax_b) - max(ymin_a, ymin_b) + 1;

    if (x_intersection <= 0 || y_intersection <= 0)
        return 0;
    else
        return x_intersection * y_intersection;
}


unsigned int objectAnalysis::min(unsigned int a,unsigned int b){
    if (a < b)
        return a;
    else
        return b;
}
unsigned int objectAnalysis::max(unsigned int a,unsigned int b){
    if (a > b)
        return a;
    else
        return b;
}
