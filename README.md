# Vintage webradio

Transform an old vintage radio from the 50's into a modern portable webradio.

- Webradio support
- spotify support
- using a lithium battery
- keeping original aspect/design and button

# Inspiration

A good project, quite similar : 
https://www.hackster.io/tinkernut/diy-vintage-spotify-radio-using-a-raspberry-pi-bc3322


# Step 1 : Install system base

Dowmload raspbian image (lite) from here : https://www.raspberrypi.org/downloads/raspbian/
Follow installation instruction to put it on the SD Card https://www.raspberrypi.org/documentation/installation/installing-images/README.md

Because, I don't have any screen, configure wifi before turning on the raspberry.
Follow instructions here : https://core-electronics.com.au/tutorials/raspberry-pi-zerow-headless-wifi-setup.html OR https://www.raspberrypi.org/documentation/configuration/wireless/headless.md

To summarize, create the file "/boot/wpa_supplicant.conf" on the "boot" image 
With content :

```bash
country=NL
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
network={
	ssid="WIFI_SSID"
	psk="WIFI_CODE"
	key_mgmt=WPA-PSK
}
```
And also an empty ssh file : "/boot/ssh"

Put the card on the raspberry pi, and search on netwoork the IP.
Use ssh to connect to the raspberry : ssh pi@IP_ADDRESS
With code : raspberry

When connected, use "sudo raspi-config" to finish installtion. (I change the hostname to : vintage-webradio)

# Step 2 : Wire Amp and setup system to use it 

Just follow this tutorial : https://learn.adafruit.com/adafruit-max98357-i2s-class-d-mono-amp/overview

# Step 3 : Install and configure modipy

https://www.mopidy.com

## Check PERL locale setting warning
Before installing modipy, check if your ssh client is correctly configured for locales. Because Raspbian system only support en_GB by default on lite versions.
See : https://stackoverflow.com/questions/2499794/how-to-fix-a-locale-setting-warning-from-perl

## Install modipy

Follow installation procedure here : https://docs.mopidy.com/en/latest/installation/debian/#debian-install

```ssh
#Add the archive’s GPG key:
wget -q -O - https://apt.mopidy.com/mopidy.gpg | sudo apt-key add -

#Add the APT repo to your package sources:
sudo wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/stretch.list

#Install Mopidy and all dependencies:
sudo apt-get update
sudo apt-get install mopidy
```

## Set it as service

This will make Mopidy start when the system boots.

```ssh
sudo systemctl enable mopidy
```

Mopidy is started, stopped, and restarted just like any other systemd service:

```ssh
sudo systemctl start mopidy
sudo systemctl stop mopidy
sudo systemctl restart mopidy

# You can check if Mopidy is currently running as a service by running:
sudo systemctl status mopidy
```

## Install spotify plugin

```ssh
sudo apt-cache search mopidy
sudo apt-get install mopidy-spotify
```

## Configure

TODO : the config file is not the one in user dire but in /etc/...

```ssh
```


Set the file like this :

TODO : update

```ssh
[mpd]
enabled=true
hostname=::
port=6600
max_connection=20
connection_timeout=60
zeroconf=Mopidy MPD server on $hostname

[http]
enabled=true
hostname=::
port=6680
zeroconf=Mopidy HTTP server on $hostname

[spotify]
enabled=true
username=
password=
client_id=
client_secret=
```

For spotify client_id and client_secret follow : https://www.mopidy.com/authenticate/#spotify

Warning : check that your config is loaded into the service, this command will show the config use by modipy

```ssh
sudo mopidyctl config
```
