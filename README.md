# jetsonNanoConfig
Scripts to configure jetson nano for AI training and inference

## Follow this steps

### 1 - Run 01-nano.fast.ai.sh as root

Enter with jetson user and then `sudo su` to run this script

Installs Pytorch and Fastai withg all its glory.

Will reboot at end

### 2 - Run 02-nano.config.sh

Just run it as normal user, the crapy `run as root approach` is no longer needed from this point onward.

It will prep jupyter notebook, including allowing remote access though http + start jupyter server at boot.

Also clones some repos for playing around.
