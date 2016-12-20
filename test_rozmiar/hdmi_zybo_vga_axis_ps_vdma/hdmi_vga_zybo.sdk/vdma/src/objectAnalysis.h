#ifndef OBJECTANALYSIS_H
#define OBJECTANALYSIS_H
#include "labellerOnePass.h"
#include "globals.h"
#include <stack>
#include <queue>


#define MIN_OBJECT_SIZE 200
#define MOVEMENT_TH 0.01 // as percent of area ?

#define OCCLUSION_COUNTER_NUMBER 50
#define OCCLUSION_DECAY 2


#define OBJECT_ALARM_THERSHOLD 500


// TODO ID reuse mechanizm

struct objectParameters{

    unsigned int ID;                // uniqe object ID


    bool visible;                   // is this object visble ?
    bool occluded;                  // is the object occluded ?
    bool alarm;                     // the object trigers an alarm

    unsigned int area;              // size in pixels

    // do we need centroid ?
    bbox bb;                        // bbox

    //bool movement;                //  is the object moving (currently not used, as we track only staic ones)

    int similarityInput;
    int similarityBackground;
    unsigned int stdInput;
    unsigned int stdBackground;


    unsigned int staticCounter;         // indicates for how long the object stayed static
    unsigned int toRemoveCounter;       // the object should be removed ?


    unsigned int coveredCounter;    // indicates for how long the object stayed covered


    unsigned int threatLevel;      // do we need it ?



};



class objectAnalysis
{
    public:
        objectAnalysis();
        ~objectAnalysis();
        void step(const unsigned int noObjects, object *objects);
        void simpleObjectAnalysis(const unsigned int noObjects, object *objects);
        void getObjectParameters(unsigned int &noObjects, objectParameters *obParameters);
        void objectToRemove(bbox &b);                                                                  //!< get object to remove (and clear background - if there is any).
        void displayObjectParameters();


    protected:

    private:

    bool mb_firstFrame;                        //!< is this the first frame ?
    unsigned int mui_frameCounter;             //!< algorithm frame counter

    std::vector<objectParameters> m_objects;   //!< vector container for objects
    std::stack<unsigned int> m_IDStack;        //!< stack for ID
    std::queue<bbox> m_obRemoveQueue;          //!< queue for objects which should be removed



    // TOOL Function
    unsigned int rectangleIntersection(unsigned int xmin_a, unsigned int xmax_a,unsigned int ymin_a, unsigned int ymax_a,
                                unsigned int xmin_b, unsigned int xmax_b,unsigned int ymin_b, unsigned int ymax_b);
    unsigned int min(unsigned int a,unsigned int b);
    unsigned int max(unsigned int a,unsigned int b);

};

#endif // OBJECTANALYSIS_H
