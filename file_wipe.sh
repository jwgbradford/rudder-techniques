#!/bin/bash
rm -rf /home/digilocal/Downloads/*
rm -rf /home/digilocal/Desktop/*
rm -rf /home/digilocal/Documents/*
rm -rf /home/digilocal/Pictures/*
rm /home/digilocal/*
find /home/digilocal/Downloads/ -type f -name ".*" -delete
find /home/digilocal/Documents/ -type f -name ".*" -delete
rm /home/digilocal/.config/Code/User/settings.json
mkdir -p /home/digilocal/.config/Code/User
chown -R digilocal /home/digilocal/.config
echo '{"chat.disableAIFeatures": true}' > /home/digilocal/.config/Code/User/settings.json
