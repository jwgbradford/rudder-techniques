#!/bin/bash
add-apt-repository multiverse
apt update
spt upgrade -y

##install extra apt packages
apt install -y apt-transport-https gdebi openjdk-11-jdk wget python3-pip

##install pip packages
#pip3 install pygame

##install snap packages
#snap install slack --classic

##install .deb packages
wget -P /home/digiadmin https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
gdebi /home/digiadmin/google-chrome-stable_current_amd64.deb --non-interactive
rm -f /home/digiadmin/google-chrome-stable_current_amd64.deb

wget -P /home/digiadmin https://zoom.us/client/latest/zoom_amd64.deb
gdebi /home/digiadmin/zoom_amd64.deb --non-interactive 
rm -f /home/digiadmin/zoom_amd64.deb

##set user
wget https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/users.txt
newusers ./users.txt
rm users.txt

##set ufw to default
ufw enable

#SERIAL=$(sudo dmidecode -t system | grep Serial)
#set -- $SERIAL
#Get serial number of laptop
SERIAL=$(sudo dmidecode -s system-serial-number)
NEWHOSTNAME='digilocal-'$SERIAL
#Set hostname
hostnamectl set-hostname $NEWHOSTNAME

#install rudder.io agent
wget --quiet -O /etc/apt/trusted.gpg.d/rudder_apt_key.gpg "https://repository.rudder.io/apt/rudder_apt_key.gpg"
echo "deb http://repository.rudder.io/apt/7.1/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/rudder.list
apt-get update
apt-get install rudder-agent -y
rudder agent policy-server 104.248.170.79
rudder agent inventory
rudder agent run

##final update and cleanup
apt update
apt full-upgrade -y
apt autoremove -y

##check and update firmware
fwupdmgr refresh
fwupdmgr update -y
