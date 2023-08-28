# run updates
sudo apt update
sudo apt dist-upgrade -y

# clear old apt installs
sudo apt purge -y python3-tk python3-pil.imagetk python3-pygame python3-pygal python3-pandas

# update to full python install
sudo apt install -y python3-full
sudo apt autoremove -y

# create virtual environment
sudo python3 -m venv /home/digilocal/.venv

# not activating atm
#source /home/digilocal/.venv/bin/activate

# install pip packages
sudo /home/digilocal/.venv/bin/pip3 install --no-input --upgrade pip
sudo /home/digilocal/.venv/bin/pip3 install --no-input --upgrade Pillow
sudo /home/digilocal/.venv/bin/pip3 install --no-input pygame pandas scikit-learn pygal python3-tk 
