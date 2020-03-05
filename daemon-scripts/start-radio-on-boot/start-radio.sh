#!/bin/sh

sleep 2  # Waits 2 seconds.
if mpc status | awk 'NR==2' | grep playing; then
  echo "Already playing, do nothing"
else
  # Nothing is playing
  echo "--Play playlist--"
  echo "-----------------"
  mpc clear
  mpc load sky_radio
  mpc play
fi
