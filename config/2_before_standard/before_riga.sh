#!/bin/sh

# Configuration of riga with Open vSwitch

# Rename Network Devices
ip link set dev enp0s25 down
ip link set dev enp6s0f0 down
ip link set dev enp6s0f1 down

ip link set dev enp4s0f1 down
ip link set enp4s0f1 name ethtest1
ip link set dev ethtest1 up

ip link set dev enp4s0f0 down
ip link set enp4s0f0 name ethtest2
ip link set dev ethtest2 up
