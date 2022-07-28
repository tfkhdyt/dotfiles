#!/bin/bash

SEARCH='Razer Razer DeathAdder Essential'

if [ "$SEARCH" = "" ]; then 
    exit 1
fi

ids=$(xinput --list | awk -v search="$SEARCH" \
    '$0 ~ search {match($0, /id=[0-9]+/);\
                  if (RSTART) \
                    print substr($0, RSTART+3, RLENGTH-3)\
                 }'\
     )
echo $ids

for i in $ids
do
    xinput --set-prop $i 'libinput Accel Profile Enabled' 0, 1
done
