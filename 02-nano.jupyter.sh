#!/bin/bash
# prep jypiter
jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter labextension install @jupyterlab/statusbar
jupyter lab --generate-config
mv jetsonNanoConfig/jupyter_notebook_config.py .jupyter/jupyter_notebook_config.py

# make it start at boot
#sudo echo 'su bp -c "jupyter notebook --config=~/.jupyter/jupyter_notebook_config.py --no-browser --notebook-dir=~/works" &' >> /etc/rc.local
#sudo chmod +x /etc/rc.local
jupyter notebook password
