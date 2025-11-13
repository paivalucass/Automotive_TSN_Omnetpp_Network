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
        powerTrainECU: <default("TsnDevice")> like IEthernetNetworkNode {
            @display("p=370,100");
        }
        infotainmentECU: <default("TsnDevice")> like IEthernetNetworkNode {
            @display("p=571,318");
        }
        tirePressureMonitoringECU: <default("TsnDevice")> like IEthernetNetworkNode {
            @display("p=371,319");
        }
        adaptiveCruiseControlECU: <default("TsnDevice")> like IEthernetNetworkNode {
            @display("p=571,100");
        }
        tsnSwitch: <default("TsnSwitch")> like IEthernetNetworkNode {
            @display("p=371,199");
        }
        tsnSwitch2: <default("TsnSwitch")> like IEthernetNetworkNode {
            @display("p=571,199");
        }
        tsnClock: TsnClock {
            parameters:
                numEthInterfaces = 1;
                @display("p=222,198");
        }
    connections:
        powerTrainECU.ethg++ <--> EthernetLink <--> tsnSwitch.ethg++;
        adaptiveCruiseControlECU.ethg++ <--> EthernetLink <--> tsnSwitch2.ethg++;
        infotainmentECU.ethg++ <--> EthernetLink <--> tsnSwitch2.ethg++;
        tirePressureMonitoringECU.ethg++ <--> EthernetLink <--> tsnSwitch.ethg++;

        tsnSwitch.ethg++ <--> EthernetLink <--> tsnSwitch2.ethg++;

        tsnClock.ethg++ <--> EthernetLink <--> tsnSwitch.ethg++;
}

