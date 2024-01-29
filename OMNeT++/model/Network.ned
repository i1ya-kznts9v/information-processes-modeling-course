import org.omnetpp.queueing.Allocate;
import org.omnetpp.queueing.Deallocate;
import org.omnetpp.queueing.Delay;
import org.omnetpp.queueing.Fork;
import org.omnetpp.queueing.ResourcePool;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;

network Network
{
    @display("bgb=809.10004,421.776");
    submodules:
        source: Source {
            @display("p=45,44");
        }
        resource_ordering: ResourcePool {
            @display("p=529,187");
        }
        resource_delivery: ResourcePool {
            @display("p=269,187");
        }
        allocate_ordering: Allocate {
            @display("p=143,107");
        }
        allocate_delivery: Allocate {
            @display("p=399,269");
        }
        deallocate_ordering: Deallocate {
            @display("p=399,107");
        }
        deallocate_delivery: Deallocate {
            @display("p=650,269");
        }
        delay_ordering: Delay {
            @display("p=269,107");
        }
        delay_delivery: Delay {
            @display("p=529,269");
        }
        sinkStat: SinkStat {
            @display("p=752.724,351.828");
        }
    connections:
        source.out --> allocate_ordering.in++;
        allocate_ordering.out --> delay_ordering.in++;
        delay_ordering.out --> deallocate_ordering.in++;
        deallocate_ordering.out --> allocate_delivery.in++;
        allocate_delivery.out --> delay_delivery.in++;
        delay_delivery.out --> deallocate_delivery.in++;
        deallocate_delivery.out --> sinkStat.in++;
}
