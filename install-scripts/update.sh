#! /bin/sh

# Update listen-for-shutdown.py
/etc/init.d/listen-for-shutdown.sh stop
rm /usr/local/bin/listen-for-shutdown.py
cp ./daemon-scripts/listen-for-shutdown/daemon.py /usr/local/bin/listen-for-shutdown.py
chmod +x /usr/local/bin/listen-for-shutdown.py
/etc/init.d/listen-for-shutdown.sh start

# Update listen-volume.py
/etc/init.d/listen-volume.sh stop
rm /usr/local/bin/listen-volume.py
cp ./daemon-scripts/listen-volume/daemon.py /usr/local/bin/listen-volume.py
chmod +x /usr/local/bin/listen-volume.py
/etc/init.d/listen-volume.sh start

# Update listen-radios-selector.py
/etc/init.d/listen-radios-selector.sh stop
rm /usr/local/bin/listen-radios-selector.py
cp ./daemon-scripts/listen-radios-selector/daemon.py /usr/local/bin/listen-radios-selector.py
chmod +x /usr/local/bin/listen-radios-selector.py
/etc/init.d/listen-radios-selector.sh start
