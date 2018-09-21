#! /bin/sh

# Update listen-for-shutdown.py
/etc/init.d/listen-for-shutdown.sh stop
rm /usr/local/bin/listen-for-shutdown.py
cp ./daemon-scripts/listen-for-shutdown/daemon.py /usr/local/bin/listen-for-shutdown.py
chmod +x /usr/local/bin/listen-for-shutdown.py
/etc/init.d/listen-for-shutdown.sh start
