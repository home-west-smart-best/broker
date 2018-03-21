#!/bin/bash
# File: installRPI.sh

version="0.5"

# Getting hostname from /etc/hostname
if [ -f /etc/hostname ]; then
   host=$(</etc/hostname)
else
   host="???"
fi

ipaddress=$(hostname -I)

# Make sure only root can run this script
echo "-- Installing tooling and libs v$version"
echo "-- Hostname $host  $ipaddress"
echo

if [[ $EUID -ne 0 ]]; then
   echo "** This script must be run as root" 1>&2
   exit 1
fi

apt-get update

# Tooling
apt-get install tree htop tmux tmuxinator nmap cmake mutt -y
apt-get install doxygen doxygen-gui graphviz -y

# SSH support
apt-get install openssh-server -y
/etc/init.d/ssh restart

# Libs necessary for MQTT: mosquitto
apt-get install libssl-dev libc-ares-dev uuid-dev libwebsockets-dev -y

# Libs necessary for bluez and gattlib
apt-get install libusb-dev libdbus-1-dev libglib2.0-dev -y
apt-get install libudev-dev libical-dev libreadline-dev -y
apt-get install libbluetooth-dev -y
apt-get install bluetooth bluez blueman -y

ldconfig

echo
echo "-- Ready installing and updating IoT tooling and libs"
echo 
