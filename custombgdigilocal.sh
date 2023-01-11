#!/bin/sh
sudo mv /usr/share/backgrounds/warty-final-ubuntu.png /usr/share/backgrounds/warty-final-ubuntu-old.png
sleep 5s
#new background image
wget -P /home/digiadmin/Downloads https://digilocal.org.uk/wp-content/uploads/2023/01/digilocal-1920-1080.png
sleep 5s
sudo mv /home/digiadmin/Downloads/digilocal-1920-1080.png /usr/share/backgrounds/warty-final-ubuntu.png
sleep 5s
sudo chmod 644 /usr/share/backgrounds/warty-final-ubuntu.png
