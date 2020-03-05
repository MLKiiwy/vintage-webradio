#!/bin/bash
# Start mopidy via mpc with given playlist, wait for mpd being ready until timeout
AutoplayMpc () {
        theplaylist=$1
        thetimeout=120 #seconds
        theprefix="[AutostartMpc]"
        logger "$theprefix Started"
        loops=1
        while true;
        do
                mpc >/dev/null 2>&1
                if [ $? -eq 0 ]; then
                        logger "$theprefix MPD found, starting playlist $theplaylist"
                        mpc -q clear >/dev/null
                        mpc -q load $theplaylist >/dev/null
                        mpc -q repeat on >/dev/null
                        mpc -q play  >/dev/null
                        mpc -q play  >/dev/null
                        break
                else
                        sleep 1s
                        if [ "$loops" -gt "$thetimeout" ]; then logger "$theprefix MPD timeout" && break; else loops=$((loops+1)); fi
                fi
        done
}
AutoplayMpc "default" & # remove & for blocking execution
