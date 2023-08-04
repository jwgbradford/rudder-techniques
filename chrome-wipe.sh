#!/bin/bash
#rm /usr/local/bin/google_wipe.sh
#rm /usr/local/bin/google-chrome.tar.xz
#rm /etc/systemd/system/google_wipe.service
wget https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/google-chrome.tar.xz -P /usr/local/bin
wget https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/google_wipe.sh -P /usr/local/bin
wget https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/google_wipe.service -P /etc/systemd/system
chmod 744 /usr/local/bin/google_wipe.sh
chmod 644 /etc/systemd/system/google_wipe.service
systemctl enable google_wipe.service
systemctl daemon-reload
