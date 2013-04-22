#!/bin/bash

apt-get update
apt-get -y install curl wget iperf

# make sure /dev/net/tun is available
mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun

# install squirrel
cd /usr/local/bin
wget http://10.0.3.1:8099/squirrel
chmod a+rx squirrel
echo '{
    "ServerAddress":    "10.0.3.1:1234",
    "TapInterfaceName": "i.am.not.real",
    "Identity":         '$(number)'
}' > /etc/squirrel.client.conf

# install olsrd
apt-get -y install bison flex make gcc
mkdir -p /tmp/olsrd_tmp
cd /tmp/olsrd_tmp
wget http://www.olsr.org/releases/0.6/olsrd-0.6.5.2.tar.gz && tar zxvf olsrd-0.6.5.2.tar.gz
cd olsrd-0.6.5.2 && make && make install
curl http://10.0.3.1:8099/olsrd.conf > /etc/olsrd.conf
