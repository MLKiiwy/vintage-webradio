#!/usr/bin/python
# Control the radio (autamatically played on startup) from a playlist on the MPD server
# Use a rotary encoder as selector
# Source : https://www.raspberrypi.org/forums/viewtopic.php?t=198815
from gpiozero import Button
from mpd import MPDClient
import Queue
import os
import time

eventq = Queue.Queue()

pin_a = Button(XX)
pin_b = Button(XX)

def pin_a_rising():                    # Pin A event handler
    if pin_b.is_pressed: eventq.put(-1)# pin A rising while A is active is a clockwise turn

def pin_b_rising():                    # Pin B event handler
    if pin_a.is_pressed: eventq.put(1) # pin B rising while A is active is a clockwise turn

pin_a.when_pressed = pin_a_rising      # Register the event handler for pin A
pin_b.when_pressed = pin_b_rising      # Register the event handler for pin B

# Initialize MPDClient
client = MPDClient()
client.timeout = 10
client.idletimeout = None
client.connect("localhost", 6600)

# Debug
print(client.mpd_version) 

client.clear()
print(client.playlist())

radioPlaylist = client.listplaylist('radios')
numberOfRadios = len(radioPlaylist)
actualRadio = 0

print "Radios availables :"
print(numberOfRadios)

# see https://python-mpd2.readthedocs.io/en/latest/topics/commands.html

# maybe client.add(radioPlaylist[actualRadio]["uri"])
client.add(radioPlaylist[actualRadio])
client.play(0)

while True:
        message = eventq.get()
        actualRadio = actualRadio + message
        if actualRadio < 0
                actualRadio = numberOfRadios - 1
        else if actualRadio >= numberOfRadios
                actualRadio = 0
        client.stop()
        client.clear()
        client.add(radioPlaylist[actualRadio])
        client.play(0)
        time.sleep(0.01)
