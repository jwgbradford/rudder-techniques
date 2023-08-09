wget -P /etc/dconf/profile https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/user
mkdir /etc/dconf/db/local.d
wget -P /etc/dconf/db/local.d https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/01-favorite-apps
dconf update
