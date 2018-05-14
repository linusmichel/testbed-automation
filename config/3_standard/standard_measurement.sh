#!/bin/sh

# Standard configuration of MoonGen and SDN-Cert

# maybe run apt with --allow-unauthenticated for solving checksum mismatch problems

apt update
apt install -y man nano

# Disable IPv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6

# Setup MoonGen
apt install -y pciutils cmake libnuma-dev

# MoonGen.tar.gz already pushed by preparation script
tar xvf MoonGen.tar.gz
cd MoonGen
./build.sh
./setup-hugetlbfs.sh
# link for sdn-cert (see sdn-cert/tools/setup_MoonGen.sh)
ln -sf build/MoonGen moongen
cd ..

# Setup SDN-Cert
apt install -y lua5.1 texlive-base
apt update
apt install -y texlive-latex-extra

# sdn-cert.tar.gz already pushed by preparation script
tar xvf sdn-cert.tar.gz
# settings.cfg already pushed by preparation script
mv /root/settings.cfg /root/sdn-cert/settings.cfg

# Setup Open vSwitch

OVSVERSION=2.7.3

apt install -y libssl-dev libcap-ng-dev

tar xvf openvswitch-$OVSVERSION.tar.gz
cd openvswitch-$OVSVERSION
./configure
make
make install
export PATH=$PATH:/usr/local/share/openvswitch/scripts
