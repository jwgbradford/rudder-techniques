# set up keyring for apt
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

# apt install
apt update
apt install code

# post install extensions
sudo -u digilocal code --install-extension ms-python.python
sudo -u digilocal code --install-extension oderwat.indent-rainbow

# configure for .venv
sudo -u digilocal mkdir /home/digilocal/.config/Code/User
wget -O /home/digilocal/.config/Code/User/settings.json https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/vs_code_settings.json
