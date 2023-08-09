#!/bin/bash
#SERIAL=$(sudo dmidecode -t system | grep Serial)
#set -- $SERIAL
#Get serial number of laptop
SERIAL=$(sudo dmidecode -s system-serial-number)
NEWHOSTNAME='digilocal-'$SERIAL
#Set hostname
hostnamectl set-hostname $NEWHOSTNAME

add-apt-repository multiverse
apt update
apt upgrade -y

# install main apt packages
apt install -y apt-transport-https gdebi openjdk-11-jdk wget gpg libreoffice

##install .deb packages
wget -P /home/digiadmin https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
gdebi /home/digiadmin/google-chrome-stable_current_amd64.deb --non-interactive
rm -f /home/digiadmin/google-chrome-stable_current_amd64.deb

wget -P /home/digiadmin https://zoom.us/client/latest/zoom_amd64.deb
gdebi /home/digiadmin/zoom_amd64.deb --non-interactive 
rm -f /home/digiadmin/zoom_amd64.deb

# set up desktop environment
wget -P /usr/share/backgrounds https://digilocal.org.uk/wp-content/uploads/2023/01/digilocal-1920-1080.png
curl https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/enviro_setup.sh|sudo /bin/bash

#install rudder.io agent
curl https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/rudder.sh|sudo /bin/bash

##set user
wget https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/users.txt
newusers ./users.txt
rm users.txt

##final update and cleanup
apt update
apt upgrade -y
apt autoremove -y

##set ufw to default
ufw enable

##check and update firmware
fwupdmgr refresh
fwupdmgr update -y
