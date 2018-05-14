#!/bin/sh

# Configuration of narva with Open vSwitch

# Rename Network Devices
ip link set dev enp0s25 down
ip link set dev enp7s0f0 down
ip link set dev enp7s0f1 down
ip link set dev enp9s0f0 down
ip link set dev enp9s0f1 down

ip link set dev enp3s0 down
ip link set enp3s0 name ethtest1
ip link set dev ethtest1 up

ip link set dev enp1s0 down
ip link set enp1s0 name ethtest2
ip link set dev ethtest2 up
