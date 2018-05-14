#!/bin/sh

# preparation script for switch hosts

OVSVERSION=2.9.0

pos nodes push --dst "/root" ${1} data/openvswitch-${OVSVERSION}.tar.gz
