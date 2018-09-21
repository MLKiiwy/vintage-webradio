#! /bin/sh

# Update listen-for-shutdown.py
sudo /etc/init.d/listen-for-shutdown.sh stop
sudo mv -f ./daemon-scripts/listen-for-shutdown/daemon.py /usr/local/bin/listen-for-shutdown.py
sudo /etc/init.d/listen-for-shutdown.sh start
