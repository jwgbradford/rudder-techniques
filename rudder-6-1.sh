#!/bin/sh

http://repository.rudder.io/apt/6.1/pool/main/r/rudder-agent/rudder-agent_6.1.3-ubuntu20.04_amd64.deb

wget -P /home/digiadmin/Downloads http://repository.rudder.io/apt/6.1/pool/main/r/rudder-agent/rudder-agent_6.1.3-ubuntu20.04_amd64.deb

sudo gdebi --non-interactive /home/digiadmin/Downloads/rudder-agent_6.1.3-ubuntu20.04_amd64.deb

sudo rm -f /home/digiadmin/Downloads/rudder-agent_6.1.3-ubuntu20.04_amd64.deb
sudo rudder agent reset
sudo rudder agent run
