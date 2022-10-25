#!/bin/sh
wget --quiet -O /etc/apt/trusted.gpg.d/rudder_apt_key.gpg "https://repository.rudder.io/apt/rudder_apt_key.gpg"
echo "deb http://repository.rudder.io/apt/7.2/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/rudder.list
sudo apt-get update
sudo apt-get install rudder-agent -y
sudo rudder agent policy-server 104.248.170.79
sudo rudder agent inventory
sudo rudder agent run
