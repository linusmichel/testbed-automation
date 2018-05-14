#!/bin/sh

# Standard Configuration of Open vSwitch

# maybe run apt with --allow-unauthenticated for solving checksum mismatch problems

apt update
apt install -y man nano

# Disable IPv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6

# Open vSwitch dependencies

apt install -y libssl-dev libcap-ng-dev

OVSVERSION=2.9.0

# kernel-module dependencies
apt-get -y install build-essential fakeroot libssl-dev debhelper autoconf \
        automake python-all python-qt4 python-zopeinterface \
        python-twisted-conch module-assistant linux-headers-`uname -r` dkms libcurl3-dev

# openvswitch-<Version>.tar.gz already pushed by preparation script
tar xvf openvswitch-$OVSVERSION.tar.gz

# Install Open vSwitch with kernel-module
cd openvswitch-$OVSVERSION
./configure --with-linux=/lib/modules/$(uname -r)/build
make
make install
make modules_install
modprobe openvswitch

# Start and configure Open vSwitch
export PATH=$PATH:/usr/local/share/openvswitch/scripts
ovs-ctl --system-id=uuid start
# /usr/local/share/openvswitch/scripts/ovs-ctl --system-id=uuid start

# Setup Testbridge between testinterfaces
ovs-vsctl add-br testbridge
ovs-vsctl set bridge testbridge protocols=OpenFlow10,OpenFlow11,OpenFlow12,OpenFlow13,OpenFlow14,OpenFlow15
ovs-vsctl set-controller testbridge ptcp:6653
ovs-vsctl add-port testbridge ethtest1
ovs-vsctl add-port testbridge ethtest2
ovs-vsctl add-port testbridge ethtest3	#will fail for devices with only 2 ports

# Set default flows for MoonGen testing (optional)
ovs-ofctl del-flows testbridge
ovs-ofctl add-flow testbridge in_port=1,actions=output:2
ovs-ofctl add-flow testbridge in_port=2,actions=output:1

