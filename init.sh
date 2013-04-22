#!/bin/bash

apt-get update
apt-get -y install curl wget iperf tmux iptables psmisc traceroute

# make sure /dev/net/tun is available
mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun

# random settings
echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo 1 > /proc/sys/net/ipv4/ip_forward

# install squirrel
cd /usr/local/bin
wget http://10.0.3.1:8099/squirrel
chmod a+rx squirrel

# install olsrd
apt-get -y install bison flex make gcc
mkdir -p /tmp/olsrd_tmp
cd /tmp/olsrd_tmp
wget http://www.olsr.org/releases/0.6/olsrd-0.6.5.2.tar.gz && tar zxvf olsrd-0.6.5.2.tar.gz
cd olsrd-0.6.5.2 && make && make libs && make install_all
curl http://10.0.3.1:8099/olsrd.conf > /etc/olsrd.conf
