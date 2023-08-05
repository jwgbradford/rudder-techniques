#!/bin/bash
wget https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/file_wipe.sh -P /usr/local/bin
wget https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/file_wipe.service -P /etc/systemd/system
chmod 744 /usr/local/bin/file_wipe.sh
chmod 644 /etc/systemd/system/file_wipe.service
systemctl enable file_wipe.service
systemctl daemon-reload
