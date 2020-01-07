#!/bin/bash
jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter lab --generate-config
cp jetsonNanoConfig/jupyter_notebook_config.py .jupyter/jupyter_notebook_config.py

# this is for my work env, remove if not applicable
git config --global credential.helper store
mkdir works
cd works
git clone https://github.com/fastai/course-v3.git
git clone https://github.com/brunoclpinto/Fastai.jetsonNano.git
git clone https://github.com/brunoclpinto/euromillions.git
cd ..

# make it start at boot
sudo /bin/bash -c 'echo "su bp -c \"/home/bp/.local/bin/jupyter notebook --config=/home/bp/.jupyter/jupyter_notebook_config.py --no-browser --notebook-dir=/home/bp/works\" &" >> /etc/rc.local'
sudo chmod +x /etc/rc.local
jupyter notebook password

sudo reboot
