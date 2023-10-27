sudo cp /etc/resolv.conf /etc/resolv.conf.auto

sudo rm /etc/dhcp3/dhclient.conf
wget -O /etc/dhcp3/dhclient.conf https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/dns.sh
sudo ifdown eth0 && sudo ifup eth0
