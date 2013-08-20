#!/bin/bash
# RPi LED Array: Show disk usage
# by Rory Nugent
# prizepony.us
# github.com/prizepony

if [ "$(whoami)" != "root" ]; then
        echo "You must run this script as a root user." 2>&1
        exit 1
fi

# Raspberry Pi hardware revision
REV=2

PINS=(4 17 27 22 18 23 24 25 8 7)

DF=$(df /dev/root | awk 'END {print $5}')
USAGE="${DF%?}"
SCALED=$((USAGE / 10))
X=0

for i in "${PINS[@]}"
do
	if [ $X -lt $SCALED ]; then
		echo "$i" > /sys/class/gpio/export
        	echo "out" > /sys/class/gpio/gpio$i/direction
	        echo "0" > /sys/class/gpio/gpio$i/value
		echo "$i" > /sys/class/gpio/unexport
	else
		echo "$i" > /sys/class/gpio/export
		echo "out" > /sys/class/gpio/gpio$i/direction
		echo "1" > /sys/class/gpio/gpio$i/value
		echo "$i" > /sys/class/gpio/unexport	
	fi
	((X=$X+1))
done
