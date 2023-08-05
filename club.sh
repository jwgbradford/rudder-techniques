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

#install apt packages
apt install -y apt-transport-https gdebi openjdk-11-jdk wget gpg

#install extra apt packages
apt install -y python3-dev python3-pip python3-tk python3-pil.imagetk git

#install pip packages
pip3 install pygame pygal requests pandas numpy scikit-learn pillow 

#install snap packages
# snap install slack --classic

#install vs code by apt
curl https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/vs_code_install.sh|sudo /bin/bash

#install .deb packages
wget -P /home/digiadmin https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
gdebi /home/digiadmin/google-chrome-stable_current_amd64.deb --non-interactive
rm -f /home/digiadmin/google-chrome-stable_current_amd64.deb

#set user
wget https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/club.txt
newusers ./club.txt
rm club.txt

#install rudder.io agent
curl https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/rudder.sh|sudo /bin/bash

# set up chrome wipe
curl https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/chrome-wipe.sh|sudo /bin/bash

# set up launcher
curl https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/set_launcher.sh|sudo /bin/bash

#final update and cleanup
apt update
apt upgrade -y
apt autoremove -y

#et ufw to default
ufw enable

#check and update firmware
fwupdmgr refresh
fwupdmgr update -y
