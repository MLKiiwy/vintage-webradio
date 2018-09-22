#!/usr/bin/python
# Control volume with rotary encoder
from gpiozero import Button
import Queue
import os
import time

eventq = Queue.Queue()

pin_a = Button(6)
pin_b = Button(13)

def pin_a_rising():                    # Pin A event handler
    if pin_b.is_pressed: eventq.put(-1)# pin A rising while A is active is a clockwise turn

def pin_b_rising():                    # Pin B event handler
    if pin_a.is_pressed: eventq.put(1) # pin B rising while A is active is a clockwise turn

pin_a.when_pressed = pin_a_rising      # Register the event handler for pin A
pin_b.when_pressed = pin_b_rising      # Register the event handler for pin B

while True:
        message = eventq.get()
        if message == 1:
                print "Volume +"
                os.system("amixer set 'PCM' 10%+")
        else:
                print "Volume -"
                os.system("amixer set 'PCM' 10%-")
        time.sleep(0.01)
