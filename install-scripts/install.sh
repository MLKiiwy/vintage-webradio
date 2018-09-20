#! /bin/sh

# Install the daemon listen-for-shutdown.py

# Install the binary
sudo mv ./daemon-scripts/listen-for-shutdown/daemon.py /usr/local/bin/listen-for-shutdown.py
sudo chmod +x /usr/local/bin/listen-for-shutdown.py

# Setup service
sudo mv ./daemon-scripts/listen-for-shutdown/service.sh /etc/init.d/listen-for-shutdown.sh
sudo chmod +x /etc/init.d/listen-for-shutdown.sh

# Now we'll register the script to run on boot.
sudo update-rc.d listen-for-shutdown.sh defaults

sudo /etc/init.d/listen-for-shutdown.sh start

