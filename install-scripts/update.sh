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

# Update listen-switch-radio.py
/etc/init.d/listen-switch-radio.sh stop
rm /usr/local/bin/listen-switch-radio.py
cp ./daemon-scripts/listen-switch-radio/daemon.py /usr/local/bin/listen-switch-radio.py
chmod +x /usr/local/bin/listen-switch-radio.py
/etc/init.d/listen-switch-radio.sh start

# Update start-radio.py
rm /usr/local/bin/start-radio.sh
cp -r ./daemon-scripts/start-radio-on-boot/start-radio.sh /usr/local/bin/start-radio.sh
chmod +x /usr/local/bin/start-radio.sh
/etc/init.d/start-radio-on-boot.sh start

# Update radio list
cp -r ./radios/* /var/lib/mopidy/playlists/
chmod 777 /var/lib/mopidy/playlists/*
service mopidy restart
