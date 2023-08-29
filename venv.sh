# run updates - not required on new build
#sudo apt update
#sudo apt dist-upgrade -y

# clear old apt installs - not required on new build
#sudo apt purge -y python3-tk python3-pil.imagetk python3-pygame python3-pygal python3-pandas

# update to full python install
sudo apt install -y python3-full
sudo apt autoremove -y

# create virtual environment & point vs code at it
sudo python3 -m venv /home/digilocal/.venv
wget -O /home/digilocal/.config/Code/User/settings.json https://raw.githubusercontent.com/jwgbradford/rudder-techniques/master/vs_code_settings.json

# install pip packages
sudo /home/digilocal/.venv/bin/pip3 install --no-input --upgrade pip
sudo /home/digilocal/.venv/bin/pip3 install --no-input --upgrade Pillow
sudo /home/digilocal/.venv/bin/pip3 install --no-input pygame pandas scikit-learn pygal tk 
