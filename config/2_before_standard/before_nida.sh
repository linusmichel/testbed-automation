#!/bin/sh

# Configuration of nida with MoonGen and SDN-Cert

# Rename Network Devices
ip link set dev enp137s0f0 down
ip link set dev enp137s0f1 down
ip link set dev enp135s0f1 down

ip link set dev enp5s0f0 down
ip link set enp5s0f0 name ethtest1
ip link set dev ethtest1 up

ip link set dev enp5s0f1 down
ip link set enp5s0f1 name ethtest2
ip link set dev ethtest2 up

ip link set dev enp131s0f0 down
ip link set enp131s0f0 name ethtest3
ip link set dev ethtest3 up

ip link set dev enp131s0f1 down
ip link set enp131s0f1 name ethtest4
ip link set dev ethtest4 up
