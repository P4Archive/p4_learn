#!/usr/bin/python

# Copyright 2013-present Barefoot Networks, Inc. 
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from mininet.net import Mininet
from mininet.topo import Topo
from mininet.log import setLogLevel, info
from mininet.cli import CLI

from p4_mininet import P4Switch, P4Host

import argparse
from time import sleep

parser = argparse.ArgumentParser(description='Mininet demo')
parser.add_argument('--behavioral-exe', help='Path to behavioral executable',
                    type=str, action="store", required=True)
parser.add_argument('--thrift-port1', help='Thrift server port for table updates',
                    type=int, action="store", default=22222)
parser.add_argument('--thrift-port2', help='Thrift server port for table updates',
                    type=int, action="store", default=22223)
parser.add_argument('--num-hosts', help='Number of hosts to connect to switch',
                    type=int, action="store", default=8)

args = parser.parse_args()


class SingleSwitchTopo(Topo):
    "Single switch connected to n (< 256) hosts."
    def __init__(self, sw_path, thrift_port1, thrift_port2, n, **opts):
        # Initialize topology and default options
        Topo.__init__(self, **opts)

        switch1 = self.addSwitch('s1',
                                sw_path = sw_path,
                                thrift_port = thrift_port1,
                                pcap_dump = True)
        switch2 = self.addSwitch('s2',
                                sw_path = sw_path,
                                thrift_port = thrift_port2,
                                pcap_dump = True)
        
        for h in range(0,4):
            host = self.addHost('h%d' % (h + 1),
				ip = '10.0.%d.1' % h,
                                mac = '00:04:00:00:00:%02x' %h)
            self.addLink(host, switch1, port1 = 1, port2 = h+1)
	for h in range(4,8):
            host = self.addHost('h%d' % (h + 1),
				ip = '10.0.%d.1' % h,
                                mac = '00:04:00:00:00:%02x' %h)
            self.addLink(host, switch2, port1 = 1, port2 = h - 3)
	self.addLink(switch1, switch2, port1 = 5, port2 = 5)

def main():
    num_hosts = args.num_hosts

    topo = SingleSwitchTopo(args.behavioral_exe,
                            args.thrift_port1,
			    args.thrift_port2,
                            num_hosts
    )
    net = Mininet(topo = topo,
                  host = P4Host,
                  switch = P4Switch,
                  controller = None )
    net.start()


    sw_mac = ["00:aa:bb:00:00:%02x" % n for n in xrange(num_hosts)]

    for n in xrange(num_hosts):
        h = net.get('h%d' % (n + 1))

    for n in xrange(num_hosts):
        h = net.get('h%d' % (n + 1))
        h.describe()

    sleep(1)

    print "Ready !"

    CLI( net )
    net.stop()

if __name__ == '__main__':
    setLogLevel( 'info' )
    main()
