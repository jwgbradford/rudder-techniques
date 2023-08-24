# clear old apt installs
sudo apt purge -y python3-tk python3-pil.imagetk git python3-pygame python3-pygal python3-pandas

# update to full python install
sudo apt install python3-full
# create virtual environment
sudo python3 -m venv /home/digilocal/.venv
# not activating atm
#source /home/digilocal/.venv/bin/activate
sudo /home/digilocal/.venv/bin/pip3 install pygame pandas pygal git tk pil.imagetk
sudo /home/digilocal/.venv/bin/pip3 install --upgrade pip
sudo /home/digilocal/.venv/bin/pip3 install --upgrade Pillow
