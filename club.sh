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

# install extra apt packages - replaced by venv pip
#apt install -y python3-full python3-dev python3-pip python3-tk python3-pil.imagetk git python3-pygame python3-pygal python3-pandas

# install snap packages
#snap install slack --classic

# install vs code by apt
curl https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/vs_code_install.sh|sudo /bin/bash

# install chrome .deb packages
wget -P /home/digiadmin https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
gdebi /home/digiadmin/google-chrome-stable_current_amd64.deb --non-interactive
rm -f /home/digiadmin/google-chrome-stable_current_amd64.deb

# install rudder.io agent
# commented out until Rudder release Lunar dist
#curl https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/rudder.sh|sudo /bin/bash

# set user
wget https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/club.txt
newusers ./club.txt
rm club.txt

# install pip packages - ignored until figure out virtual environments
curl https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/venv.sh|sudo /bin/bash

# set up chrome wipe
curl https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/chrome-wipe.sh|sudo /bin/bash

# set up file wiper
#curl https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/file_wipe_setup.sh|sudo /bin/bash

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
