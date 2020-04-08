#! /bin/sh

sudo systemctl disable apt-daily.service
sudo systemctl disable apt-daily-upgrade.service
sudo systemctl disable raspi-config.service
sudo systemctl disable triggerhappy.service
sudo systemctl disable dphys-swapfile.service
sudo systemctl disable avahi-daemon.service
sudo systemctl disable keyboard-setup.service


# ystemd-analyze blame to find time of each services at boot