# run updates - not required on new build
sudo apt update
sudo apt dist-upgrade -y

# clear old apt installs - not required on new build
#sudo apt purge -y python3-tk python3-pil.imagetk python3-pygame python3-pygal python3-pandas

# update to full python install
sudo apt install -y python3-full python3-dev python3-pip
sudo apt autoremove -y

# delete old venv
#sudo rm -rf /home/digilocal/.venv

# create virtual environment
sudo -u digilocal python3 -m venv /home/digilocal/.venv

# install pip packages as digilocal
sudo -u digilocal /home/digilocal/.venv/bin/pip3 install --no-input --upgrade pip
sudo -u digilocal /home/digilocal/.venv/bin/pip3 install --no-input --upgrade Pillow
sudo -u digilocal /home/digilocal/.venv/bin/pip3 install --no-input pygame pygal tk requests opencv-python ursina matplotlib pandas scikit-learn
