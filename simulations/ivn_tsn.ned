//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//

package acc_tsn_network.simulations;
package inet.networks.tsn;
import inet.node.ethernet.EthernetLink;
import inet.node.tsn.TsnDevice;
import inet.node.tsn.TsnSwitch;
import ned.IdealChannel;
import inet.networks.base.TsnNetworkBase;
import inet.node.contract.IEthernetNetworkNode;
import inet.node.ethernet.EthernetLink;
import inet.node.tsn.TsnClock;

//
// TODO documentation
//
network IVN_TSN_Network extends TsnNetworkBase
{
    parameters:
        *.eth[*].bitrate = default(100Mbps);
        @display("bgb=945,460");
    submodules:
        powerTrainECU: TsnDevice {
            parameters:
                numEthInterfaces = 1;
                @display("p=223,200");
        }
        usbMediaECU: TsnDevice {
            parameters:
                numEthInterfaces = 1;
                @display("p=371,91");
        }
        tirePressureMonitoringECU: TsnDevice {
            parameters:
                numEthInterfaces = 1;
                @display("p=371,319");
        }
        laneDetectionECU: TsnDevice {
            parameters:
                numEthInterfaces = 1;
                @display("p=554,91");
        }
        brakeECU: TsnDevice {
            parameters:
                numEthInterfaces = 1;
                @display("p=735,91");
        }
        infotainmentECU: TsnDevice {
            parameters:
                numEthInterfaces = 1;
                @display("p=872,200");
        }
        adaptiveCruiseControlECU: TsnDevice {
            parameters:
                numEthInterfaces = 1;
                @display("p=554,319");
        }
        radarDistanceECU: TsnDevice {
            parameters:
                numEthInterfaces = 1;
                @display("p=735,319");
        }
        tsnSwitch: TsnSwitch {
            parameters:
                numEthInterfaces = 4; // set to number of connected peers
                @display("p=371,199");
        }
        tsnSwitch1: TsnSwitch {
            parameters:
                numEthInterfaces = 4;
                @display("p=554,199");
        }
        tsnSwitch2: TsnSwitch {
            parameters:
                numEthInterfaces = 4;
                @display("p=735,199");
        }
        tsnClock: TsnClock {
            parameters:
                numEthInterfaces = 1;
                @display("p=673,381");
        }

    connections:
        tsnClock.ethg++ <--> EthernetLink <--> tsnSwitch1.ethg++;

        powerTrainECU.ethg++ <--> EthernetLink <--> tsnSwitch.ethg++;
        usbMediaECU.ethg++ <--> EthernetLink <--> tsnSwitch.ethg++;
        tsnSwitch.ethg++ <--> EthernetLink <--> tsnSwitch1.ethg++;
        tirePressureMonitoringECU.ethg++ <--> EthernetLink <--> tsnSwitch.ethg++;

        tsnSwitch1.ethg++ <--> EthernetLink <--> adaptiveCruiseControlECU.ethg++;
        tsnSwitch1.ethg++ <--> EthernetLink <--> laneDetectionECU.ethg++;
        tsnSwitch2.ethg++ <--> EthernetLink <--> brakeECU.ethg++;
        tsnSwitch1.ethg++ <--> EthernetLink <--> tsnSwitch2.ethg++;

        tsnSwitch2.ethg++ <--> EthernetLink <--> radarDistanceECU.ethg++;
        infotainmentECU.ethg++ <--> EthernetLink <--> tsnSwitch2.ethg++;

}

