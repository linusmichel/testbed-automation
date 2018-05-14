#!/bin/sh

# Configuration of vilnius with MoonGen and SDN-Cert

# Rename Network Devices
ip link set dev enp0s25 down

ip link set dev enp2s0f0 down
ip link set enp2s0f0 name ethtest1
ip link set dev ethtest1 up

ip link set dev enp2s0f1 down
ip link set enp2s0f1 name ethtest2
ip link set dev ethtest2 up
