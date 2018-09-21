#!/usr/bin/python
# shutdown/reboot(/power on) Raspberry Pi with pushbutton

import RPi.GPIO as GPIO
from subprocess import call
from datetime import datetime
import time

GPIO.setwarnings(False)

# pushbutton connected to this GPIO pin, using pin 5 also has the benefit of
# waking / powering up Raspberry Pi when button is pressed
shutdownPin = 5
# Blue color is used when button is pressed
bluePin = 13
# Red color is used to indicate boot
redPin = 8
# Green color is used to indicate everything is working
greenPin = 11

# if button pressed for at least this long then shut down. if less then reboot.
shutdownMinSeconds = 3

GPIO.setmode(GPIO.BOARD)
GPIO.setup(shutdownPin, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(bluePin, GPIO.OUT)
GPIO.setup(redPin, GPIO.OUT)
GPIO.setup(greenPin, GPIO.OUT)

GPIO.output(redPin, GPIO.LOW)
GPIO.output(greenPin, GPIO.HIGH)

buttonPressedTime = None

def buttonStateChanged(pin):
    global buttonPressedTime

    if not (GPIO.input(pin)):
        GPIO.output(bluePin, GPIO.HIGH)
        # button is down
        if buttonPressedTime is None:
            buttonPressedTime = datetime.now()
    else:
        # button is up
        if buttonPressedTime is not None:
            elapsed = (datetime.now() - buttonPressedTime).total_seconds()
            buttonPressedTime = None
            GPIO.output(bluePin, GPIO.LOW)
            if elapsed >= shutdownMinSeconds:
                GPIO.output(redPin, GPIO.HIGH)
                GPIO.output(greenPin, GPIO.LOW)
                # button pressed for more than specified time, shutdown
                call(['shutdown', '-h', 'now'], shell=False)

# subscribe to button presses
GPIO.add_event_detect(shutdownPin, GPIO.BOTH, callback=buttonStateChanged)

while True:
    # sleep to reduce unnecessary CPU usage
    time.sleep(5)