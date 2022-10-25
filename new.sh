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

##install extra apt packages
apt install -y apt-transport-https gdebi openjdk-11-jdk wget ##python3-dev python3-pip curl python3-tk libreoffice

##install pip packages
##pip3 install pygame pygal requests pandas numpy scikit-learn

##install snap packages
##snap install slack --classic

# install vs code by apt
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
apt update
apt install code

##install .deb packages
wget -P /home/digiadmin https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
gdebi /home/digiadmin/google-chrome-stable_current_amd64.deb --non-interactive
rm -f /home/digiadmin/google-chrome-stable_current_amd64.deb

wget -P /home/digiadmin https://zoom.us/client/latest/zoom_amd64.deb
gdebi /home/digiadmin/zoom_amd64.deb --non-interactive 
rm -f /home/digiadmin/zoom_amd64.deb

curl https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/ms_teams.sh|sudo /bin/bash

##set user
wget https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/users.txt
newusers ./users.txt
rm users.txt

#install rudder.io agent
wget --quiet -O /etc/apt/trusted.gpg.d/rudder_apt_key.gpg "https://repository.rudder.io/apt/rudder_apt_key.gpg"
echo "deb http://repository.rudder.io/apt/7.2/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/rudder.list
apt-get update
apt-get install rudder-agent -y
rudder agent policy-server 104.248.170.79
rudder agent inventory
rudder agent run

##final update and cleanup
apt update
apt upgrade -y
apt autoremove -y

##set ufw to default
ufw enable

##check and update firmware
fwupdmgr refresh
fwupdmgr update -y
