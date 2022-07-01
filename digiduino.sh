sudo mkdir /usr/share/arduino
cd /usr/share/arduino
wget https://downloads.arduino.cc/arduino-1.8.19-linux64.tar.xz
tar -xf arduino-1.8.19-linux64.tar.xz
sudo rm arduino-1.8.19-linux64.tar.xy
cd arduino-1.8.19
sudo ./install.sh
sudo adduser digilocal dialout
