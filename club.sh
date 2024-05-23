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
apt install -y apt-transport-https gdebi openjdk-11-jdk wget gpg git

# install rudder.io agent
curl https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/rudder.sh|sudo /bin/bash

# install chrome .deb packages
wget -P /home/digiadmin https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
gdebi /home/digiadmin/google-chrome-stable_current_amd64.deb --non-interactive
rm -f /home/digiadmin/google-chrome-stable_current_amd64.deb

# set user
wget https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/club.txt
newusers ./club.txt
rm club.txt

# set up user /.venv
curl https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/venv.sh|sudo /bin/bash

# add venues
curl https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/venue.sh|sudo /bin/bash

# install vs code by apt
curl https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/vs_code_install.sh|sudo /bin/bash

# autostart chrome on digilocal user login
mkdir /home/digilocal/.config/autostart/
ln -sf /usr/share/applications/google-chrome.desktop /home/digilocal/.config/autostart/

# set up chrome wipe
curl https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/chrome-wipe.sh|sudo /bin/bash

# set up file wiper
curl https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/file_wipe_setup.sh|sudo /bin/bash

# set up launcher
wget -P /usr/share/backgrounds https://digilocal.org.uk/wp-content/uploads/2023/01/digilocal-1920-1080.png
curl https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/set_launcher.sh|sudo /bin/bash

# final update and cleanup
apt update
apt dist-upgrade -y
apt autoremove -y

# set ufw to default
ufw enable

# check and update firmware
fwupdmgr refresh
fwupdmgr update -y
