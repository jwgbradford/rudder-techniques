#!/bin/sh
wget --quiet -O /etc/apt/trusted.gpg.d/rudder_apt_key.gpg "https://repository.rudder.io/apt/rudder_apt_key.gpg"
echo "deb http://repository.rudder.io/apt/8.1/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/rudder.list
#echo "deb http://repository.rudder.io/apt/8.1/ jammy main" > /etc/apt/sources.list.d/rudder.list
apt-get update
apt-get install rudder-agent -y
rudder agent policy-server 104.248.170.79
rudder agent inventory
rudder agent run
