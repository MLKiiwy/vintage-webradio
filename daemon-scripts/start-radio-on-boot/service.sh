#! /bin/sh

### BEGIN INIT INFO
# Provides:          start-radio-on-boot.py
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
### END INIT INFO

# If you want a command to always run, put it here

# Carry out specific functions when asked to by the system
case "$1" in
  start)
    echo "Starting start-radio.sh"
    /usr/local/bin/start-radio.sh sky_radio
    ;;
  *)
    echo "Usage: /etc/init.d/start-radio-on-boot.sh {start}"
    exit 1
    ;;
esac

exit 0
