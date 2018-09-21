#! /bin/sh

# Update listen-for-shutdown.py
sudo /etc/init.d/listen-for-shutdown.sh stop
sudo rm /usr/local/bin/listen-for-shutdown.py
sudo mv ./daemon-scripts/listen-for-shutdown/daemon.py /usr/local/bin/listen-for-shutdown.py
sudo /etc/init.d/listen-for-shutdown.sh start
