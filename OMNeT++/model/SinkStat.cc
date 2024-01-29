#include "SinkStat.h"
#include <iostream>

Define_Module(SinkStat);

void SinkStat::initialize()
{
    Sink::initialize();
    profit = 0;
}

void SinkStat::handleMessage(cMessage *msg)
{
    Sink::handleMessage(msg);

    // 0.1 probability of return
    if (rand() % 10 < 9) {
        profit += intuniform(20, 180);
    }
}

void SinkStat::finish()
{
    cModule* ordering = this->getParentModule()->getSubmodule("resource_ordering");
    cModule* delivery = this->getParentModule()->getSubmodule("resource_delivery");

    int numOrdering = ordering->par("amount");
    int numDelivery = delivery->par("amount");

    std::cout << "Ordering=" << numOrdering << ", Delivery=" << numDelivery;
    std::cout << ", Profit=" << profit << endl;

    Sink::finish();
}
