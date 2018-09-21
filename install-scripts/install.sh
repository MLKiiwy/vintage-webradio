#! /bin/sh

# Enable serial (Use for led power indicator)

echo "enable_uart=1" >> /boot/config

# Install the daemon listen-for-shutdown.py

# Install the binary
sudo cp ./daemon-scripts/listen-for-shutdown/daemon.py /usr/local/bin/listen-for-shutdown.py
sudo chmod +x /usr/local/bin/listen-for-shutdown.py

# Setup service
sudo cp ./daemon-scripts/listen-for-shutdown/service.sh /etc/init.d/listen-for-shutdown.sh
sudo chmod +x /etc/init.d/listen-for-shutdown.sh

# Now we'll register the script to run on boot.
sudo update-rc.d listen-for-shutdown.sh defaults

sudo /etc/init.d/listen-for-shutdown.sh start

# Install the daemon listen-volume.py

# Install the binary
sudo cp ./daemon-scripts/listen-volume/daemon.py /usr/local/bin/listen-volume.py
sudo chmod +x /usr/local/bin/listen-volume.py

# Setup service
sudo cp ./daemon-scripts/listen-volume/service.sh /etc/init.d/listen-volume.sh
sudo chmod +x /etc/init.d/listen-volume.sh

# Now we'll register the script to run on boot.
sudo update-rc.d listen-volume.sh defaults

sudo /etc/init.d/listen-volume.sh start
