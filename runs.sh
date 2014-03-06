#!/bin/sh
apt-get update -q
apt-get install -qy build-essential git unzip python-pip python-dev
unzip serf.zip
mv serf /usr/bin

# Add Serf to initialization proc
mkdir /etc/service/serf
touch /var/log/serf.log
pip install serfclient
