#! /bin/sh

# -------------------------------
# Enable serial (Use for led power indicator)

echo "enable_uart=1" >> /boot/config

# -------------------------------
# Install library gpiozero
sudo apt install python-gpiozero
# Install library mpd2
pip install python-mpd2

# -------------------------------
# Install the daemon listen-for-shutdown.py

### Install the binary
sudo cp ./daemon-scripts/listen-for-shutdown/daemon.py /usr/local/bin/listen-for-shutdown.py
sudo chmod +x /usr/local/bin/listen-for-shutdown.py

### Setup service
sudo cp ./daemon-scripts/listen-for-shutdown/service.sh /etc/init.d/listen-for-shutdown.sh
sudo chmod +x /etc/init.d/listen-for-shutdown.sh

### Now we'll register the script to run on boot.
sudo update-rc.d listen-for-shutdown.sh defaults

sudo /etc/init.d/listen-for-shutdown.sh start

# -------------------------------
# Install the daemon listen-volume.py

### Install the binary
sudo cp ./daemon-scripts/listen-volume/daemon.py /usr/local/bin/listen-volume.py
sudo chmod +x /usr/local/bin/listen-volume.py

### Setup service
sudo cp ./daemon-scripts/listen-volume/service.sh /etc/init.d/listen-volume.sh
sudo chmod +x /etc/init.d/listen-volume.sh

### Now we'll register the script to run on boot.
sudo update-rc.d listen-volume.sh defaults

sudo /etc/init.d/listen-volume.sh start

# -------------------------------
# Install radios
sudo cp -r ./radios/* /var/lib/mopidy/playlists/
chmod 777 /var/lib/mopidy/playlists/*
sudo service mopidy restart

# -------------------------------
# Install the daemon listen-radios-selector.py

### Install the binary
sudo cp ./daemon-scripts/listen-radios-selector/daemon.py /usr/local/bin/listen-radios-selector.py
sudo chmod +x /usr/local/bin/listen-radios-selector.py

### Setup service
sudo cp ./daemon-scripts/listen-radios-selector/service.sh /etc/init.d/listen-radios-selector.sh
sudo chmod +x /etc/init.d/listen-radios-selector.sh

### Now we'll register the script to run on boot.
sudo update-rc.d listen-radios-selector.sh defaults

sudo /etc/init.d/listen-radios-selector.sh start
