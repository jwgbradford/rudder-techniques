#!/bin/sh
wget --quiet -O /etc/apt/trusted.gpg.d/rudder_apt_key.gpg "https://repository.rudder.io/apt/rudder_apt_key.gpg"
echo "deb [arch=$(dpkg --print-architecture)] http://repository.rudder.io/apt/9.1/ $(noble) main" > /etc/apt/sources.list.d/rudder.list
apt-get update
apt-get install rudder-agent -y
rudder agent policy-server 46.101.91.6
rudder agent inventory
rudder agent run -l
