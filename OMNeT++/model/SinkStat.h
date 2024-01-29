#ifndef __MODEL_SINKSTAT_H_

#define __MODEL_SINKSTAT_H_

#include <omnetpp.h>
#include "Sink.h"

using namespace omnetpp;

class SinkStat : public queueing::Sink
{
    protected:
        int profit;
        virtual void initialize();
        virtual void handleMessage(cMessage *msg);
        virtual void finish();
};
#endif
