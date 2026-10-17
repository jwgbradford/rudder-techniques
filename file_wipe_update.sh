sudo apt update&&sudo apt upgrade -y&&sudo apt autoremove
rm /usr/local/bin/file_wipe.sh
wget https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/file_wipe.sh -P /usr/local/bin
chmod 744 /usr/local/bin/file_wipe.sh
