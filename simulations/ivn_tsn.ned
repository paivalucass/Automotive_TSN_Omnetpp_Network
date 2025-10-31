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
import inet.node.ethernet.EthernetLink;
import inet.node.tsn.TsnDevice;
import inet.node.tsn.TsnSwitch;
import ned.IdealChannel;


//
// TODO documentation
//
network Network
{
    @display("bgb=815,390");
    submodules:
        powerTrainECU: TsnDevice {
            @display("p=88,183");
        }
        usbMediaECU: TsnDevice {
            @display("p=236,73");
        }
        tirePressureMonitoringECU: TsnDevice {
            @display("p=236,303");
        }
        laneDetectionECU: TsnDevice {
            @display("p=419,73");
        }
        brakeECU: TsnDevice {
            @display("p=599,73");
        }
        infotainmentECU: TsnDevice {
            @display("p=737,183");
        }
        adaptiveCruiseControlECU: TsnDevice {
            @display("p=419,303");
        }
        radarDistanceECU: TsnDevice {
            @display("p=599,303");
        }
        tsnSwitch: TsnSwitch {
            @display("p=236,182");
        }
        tsnSwitch1: TsnSwitch {
            @display("p=419,182");
        }
        tsnSwitch2: TsnSwitch {
            @display("p=599,182");
        }
    connections:
        powerTrainECU.ethg[0] <--> EthernetLink <--> tsnSwitch.ethg[0];
        tsnSwitch.ethg[0] <--> EthernetLink <--> usbMediaECU.ethg[0];
        tsnSwitch.ethg[0] <--> EthernetLink <--> tsnSwitch1.ethg[0];
        tsnSwitch.ethg[0] <--> EthernetLink <--> tirePressureMonitoringECU.ethg[0];
        tsnSwitch1.ethg[0] <--> EthernetLink <--> adaptiveCruiseControlECU.ethg[0];
        tsnSwitch1.ethg[0] <--> EthernetLink <--> laneDetectionECU.ethg[0];
        tsnSwitch2.ethg[0] <--> EthernetLink <--> brakeECU.ethg[0];
        tsnSwitch2.ethg[0] <--> EthernetLink <--> tsnSwitch1.ethg[0];
        tsnSwitch2.ethg[0] <--> EthernetLink <--> radarDistanceECU.ethg[0];
        infotainmentECU.ethg[0] <--> EthernetLink <--> tsnSwitch2.ethg[0];
        tsnSwitch2.ethg[0] <--> EthernetLink <--> radarDistanceECU.ethg[0];
}

