#!/bin/sh

# Setting ovs-bridge to userspace mode (extremely slow)

ovs-vsctl set bridge testbridge datapath_type=netdev