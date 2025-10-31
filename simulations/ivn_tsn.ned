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

//
// TODO documentation
//
network IVN_TSN_Network extends TsnNetworkBase
{
    @display("bgb=815,390");
//    parameters:
//        *.eth[*].bitrate = default(100Mbps);
    submodules:
        powerTrainECU: TsnDevice {
            parameters: numEthInterfaces = 1;
            @display("p=88,183");
        }
        usbMediaECU: TsnDevice {
            parameters: numEthInterfaces = 1;
            @display("p=236,73");
        }
        tirePressureMonitoringECU: TsnDevice {
            parameters: numEthInterfaces = 1;
            @display("p=236,303");
        }
        laneDetectionECU: TsnDevice {
            parameters: numEthInterfaces = 1;
            @display("p=419,73");
        }
        brakeECU: TsnDevice {
            parameters: numEthInterfaces = 1;
            @display("p=599,73");
        }
        infotainmentECU: TsnDevice {
            parameters: numEthInterfaces = 1;
            @display("p=737,183");
        }
        adaptiveCruiseControlECU: TsnDevice {
            parameters: numEthInterfaces = 1;
            @display("p=419,303");
        }
        radarDistanceECU: TsnDevice {
            parameters: numEthInterfaces = 1;
            @display("p=599,303");
        }
        tsnSwitch: TsnSwitch {
            parameters: numEthInterfaces = 4; // set to number of connected peers
            @display("p=236,182");
        }
        tsnSwitch1: TsnSwitch {
            parameters: numEthInterfaces = 4;
            @display("p=419,182");
        }
        tsnSwitch2: TsnSwitch {
            parameters: numEthInterfaces = 4;
            @display("p=599,182");
        }

    connections:
        powerTrainECU.ethg[0] <--> EthernetLink <--> tsnSwitch.ethg[0];
        usbMediaECU.ethg[0] <--> EthernetLink <--> tsnSwitch.ethg[1];
        tsnSwitch.ethg[2]     <--> EthernetLink <--> tsnSwitch1.ethg[0];
        tirePressureMonitoringECU.ethg[0] <--> EthernetLink <--> tsnSwitch.ethg[3];

        tsnSwitch1.ethg[1] <--> EthernetLink <--> adaptiveCruiseControlECU.ethg[0];
        tsnSwitch1.ethg[2] <--> EthernetLink <--> laneDetectionECU.ethg[0];
        tsnSwitch2.ethg[0] <--> EthernetLink <--> brakeECU.ethg[0];
        tsnSwitch1.ethg[3] <--> EthernetLink <--> tsnSwitch2.ethg[1];

        tsnSwitch2.ethg[2] <--> EthernetLink <--> radarDistanceECU.ethg[0];
        infotainmentECU.ethg[0] <--> EthernetLink <--> tsnSwitch2.ethg[3];
}

