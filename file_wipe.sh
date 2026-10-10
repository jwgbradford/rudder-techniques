#!/bin/bash
rm -rf /home/digilocal/Downloads/*
rm -rf /home/digilocal/Desktop/*
rm -rf /home/digilocal/Documents/*
rm -rf /home/digilocal/Pictures/*
rm /home/digilocal/*
find /home/digilocal/Downloads/ -type f -name ".*" -delete
find /home/digilocal/Documents/ -type f -name ".*" -delete
find /home/digilocal/Downloads/ -type d -name ".*"
find /home/digilocal/Documents/ -type d -name ".*"
mkdir -p /home/digilocal/.config/Code/User
chown -R digilocal /home/digilocal/.config
rm /home/digilocal/.config/Code/User/settings.json
echo '{"chat.disableAIFeatures": true}' > /home/digilocal/.config/Code/User/settings.json
