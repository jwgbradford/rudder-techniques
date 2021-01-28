apt update
apt full-upgrade -y

#install core dependencies
apt install -y python3-dev openjdk-11-jdk gdebi

#install apt packages
apt install -y python3-pip git

#install vs code by apt
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

apt-get install apt-transport-https -y
apt-get update
apt-get install code -y

#install pip packages
pip3 install pygame==2.0.0.dev10

#install snap packages
snap install slack --classic

#install .deb packages
wget -P $HOME/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
gdebi $HOME/Downloads/google-chrome-stable_current_amd64.deb --non-interactive
rm $HOME/Downloads/google-chrome-stable_current_amd64.deb

wget -P $HOME/Downloads https://zoom.us/client/latest/zoom_amd64.deb
gdebi --non-interactive $HOME/Downloads/zoom_amd64.deb
rm -f $HOME/Downloads/zoom_amd64.deb

#set desktop favourites
#gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'libreoffice-writer.desktop', 'google-chrome.desktop']"

#set ufw to default
ufw enable

add-apt-repository multiverse
apt update

#SERIAL=$(sudo dmidecode -t system | grep Serial)
#set -- $SERIAL
#Get serial number of laptop
SERIAL=$(sudo dmidecode -s system-serial-number)
NEWHOSTNAME='digilocal-'$SERIAL
#Set hostname
hostnamectl set-hostname $NEWHOSTNAME

#install rudder.io agent
wget --quiet -O- "https://repository.rudder.io/apt/rudder_apt_key.pub" | apt-key add -
echo "deb http://repository.rudder.io/apt/6.1/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/rudder.list
apt-get update
apt-get install rudder-agent -y
echo '104.248.170.79' > /var/rudder/cfengine-community/policy_server.dat
rudder agent inventory
rudder agent run

#set up default user
useradd -m DigiHome
echo 'DigiHome:Digi@Home' | chpasswd

#final update and cleanup
apt update
apt full-upgrade -y
apt autoremove -y

#check and update firmware
fwupdmgr refresh
fwupdmgr update -y
