#!/usr/bin/python
#Control MPD Client volume using a physical rotary encoder
#pip install mopidy-spotify

from RPi import GPIO
from time import sleep
import os

clk = 31
dt = 33

GPIO.setmode(GPIO.BOARD)
GPIO.setup(clk, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
GPIO.setup(dt, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

counter = 0
clkLastState = GPIO.input(clk)

try:
        while True:
                clkState = GPIO.input(clk)
                dtState = GPIO.input(dt)
                if clkState != clkLastState:
                        if dtState != clkState:
                                print "Volume +"
                                os.system("amixer set 'Master' 10%+")
                        else:
                                print "Volume -"
                                os.system("amixer set 'Master' 10%-")
                        clkLastState = clkState
                        sleep(0.01)
finally:
        GPIO.cleanup
