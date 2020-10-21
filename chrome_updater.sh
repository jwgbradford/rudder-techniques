#!/bin/sh

wget -P /home/digiadmin/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
 
sudo gdebi /home/digiadmin/Downloads/google-chrome-stable_current_amd64.deb --non-interactive

rm /home/digiadmin/Downloads/google-chrome-stable_current_amd64.deb
