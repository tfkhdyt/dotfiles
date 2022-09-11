#!/bin/bash
while true
do
  if [[ $(xinput list --name-only | grep 'Razer Razer DeathAdder Essential') ]];
  then
    if [[ $(systemctl --user is-active imwheel) == inactive ]];
    then
      systemctl --user start --now imwheel
      echo "starting imwheel"
      #source .disable_accel.sh
      #echo "acceleration disabled"
    else
      echo "imwheel already running"
      #echo "acceleration already disabled"
    fi
  else
    if [[ $(systemctl --user is-active imwheel) == active ]];
    then
      systemctl --user stop --now imwheel
      echo "stopping imwheel"
    else
      echo "imwheel already stopped"
    fi
  fi
  sleep 3
done
