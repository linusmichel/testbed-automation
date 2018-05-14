#!/bin/sh

# Configuration of cesis with Open vSwitch

# Rename Network Devices
ip link set dev enp8s0f1 down
ip link set dev enp8s0f2 down
ip link set dev enp8s0f3 down

ip link set dev eno1 down
ip link set eno1 name ethtest1
ip link set dev ethtest1 up

ip link set dev eno2 down
ip link set eno2 name ethtest2
ip link set dev ethtest2 up

ip link set dev enp5s0f0 down
ip link set enp5s0f0 name ethtest3
ip link set dev ethtest3 up

ip link set dev enp5s0f1 down
ip link set enp5s0f1 name ethtest4
ip link set dev ethtest4 up
