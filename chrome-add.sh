# install main apt packages
apt install -y apt-transport-https gdebi openjdk-11-jdk wget gpg libsdl2-dev

# install chrome .deb packages
wget -P /home/digiadmin https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
gdebi /home/digiadmin/google-chrome-stable_current_amd64.deb --non-interactive
rm -f /home/digiadmin/google-chrome-stable_current_amd64.deb
