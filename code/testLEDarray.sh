#!/bin/bash
# RPi LED Array tester
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

# initialize all LEDs
for i in "${PINS[@]}"
do
	echo "$i" > /sys/class/gpio/export
        echo "in" > /sys/class/gpio/gpio$i/direction
done

# turn on all LEDs in order
for i in "${PINS[@]}"
do
	# toggle LED
	echo "out" > /sys/class/gpio/gpio$i/direction
	echo "0" > /sys/class/gpio/gpio$i/value
	echo -n "#"
	sleep 0.5
done

# cleanup
for i in "${PINS[@]}"
do
	echo "in" > /sys/class/gpio/gpio$i/direction
	echo "$i" > /sys/class/gpio/unexport
done

# fin
echo "... DONE!"
