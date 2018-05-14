#!/bin/sh

# preparation script for measurement hosts

pos nodes push --dst "/root/settings.cfg" ${1} data/settings_${1}.cfg
pos nodes push --dst "/root" ${1} data/MoonGen.tar.gz
pos nodes push --dst "/root" ${1} data/sdn-cert.tar.gz
pos nodes push --dst "/root" ${1} data/openvswitch-2.7.3.tar.gz
