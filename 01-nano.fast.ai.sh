#!/bin/bash
# meant to be called as sudo
sudo apt update
sudo apt upgrade -y

# prep swap for extended memory, 4G aint enough
sudo fallocate -l 8G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo "/swapfile swap swap defaults 0 0" | sudo tee --append /etc/fstab > /dev/null

# cleanup stuff we don't need and takes ram
# this will eventually increase, one hopes
sudo systemctl enable multi-user.target
sudo systemctl set-default multi-user.target
sudo apt -y purge whoopsie
sudo apt -y purge unattended-upgrades
sudo apt -y purge modemmanager

# PyTorch dependencies
sudo apt install -y python3-dev python3-pip
# Fast.ai dependencies
sudo apt install -y libjpeg-dev zlib1g-dev
sudo apt install -y python3-matplotlib
sudo apt install -y python3-scipy
# jupyter dependencies
sudo apt install -y nodejs npm

# PyTorch dependencies
sudo python3.6 -m pip install --upgrade cython
# Fast.ai dependencies
sudo pip3 install numpy==1.18
sudo pip3 install scipy<=0.19.0
sudo pip3 install spacy==2.0.18

# install PyTorch
# Check the nvidia forum for updates, the community is great, get involved
wget https://nvidia.box.com/shared/static/phqe92v26cbhqjohwtvxorrwnmrnfx1o.whl -O torch-1.3.0-cp36-cp36m-linux_aarch64.whl
sudo pip3 install numpy torch-1.3.0-cp36-cp36m-linux_aarch64.whl
rm torch-1.3.0-cp36-cp36m-linux_aarch64.whl

# install Fast.ai
sudo pip3 install fastai

# install jupyter
sudo pip3 install jupyter jupyterlab

sudo reboot

