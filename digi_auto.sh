add-apt-repository multiverse
apt update

##install pip packages
#pip3 install pygame==2.0.0.dev10

##install snap packages
#snap install slack --classic

##install .deb packages
wget -P /run/mydir https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
gdebi /run/mydir/google-chrome-stable_current_amd64.deb --non-interactive
rm /run/mydir/google-chrome-stable_current_amd64.deb

wget -P /run/mydir https://zoom.us/client/latest/zoom_amd64.deb
gdebi --non-interactive /target/temp-inst/zoom_amd64.deb
rm -f /run/mydir/zoom_amd64.deb

##set desktop favourites
wget -P etc/dconf/profile/ https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/user
wget -P /etc/dconf/db/local.d/ https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/00-favourite-apps

##set ufw to default
ufw enable

#SERIAL=$(sudo dmidecode -t system | grep Serial)
#set -- $SERIAL
#Get serial number of laptop
SERIAL=$(sudo dmidecode -s system-serial-number)
NEWHOSTNAME='digilocal-'$SERIAL
Set hostname
hostnamectl set-hostname $NEWHOSTNAME

#install rudder.io agent
wget --quiet -O- "https://repository.rudder.io/apt/rudder_apt_key.pub" | apt-key add -
echo "deb http://repository.rudder.io/apt/6.2/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/rudder.list

apt-get update
apt-get install rudder-agent -y
echo '104.248.170.79' > /var/rudder/cfengine-community/policy_server.dat
rudder agent inventory
rudder agent run

##final update and cleanup
apt update
apt full-upgrade -y
apt autoremove -y

##check and update firmware
fwupdmgr refresh
fwupdmgr update -y
