#!/bin/sh

# Update information about sofware packages.
sudo apt-get update -y

# Remove useless files.
sudo rm -rf ~/python_games/

# Remove useless packages.
sudo apt-get remove --purge -y python-picamera python3-picamera \
    python-rpi.gpio python3-rpi.gpio gnome-themes-standard-data \
    gnome-icon-theme zenity zenity-common xserver-xorg-core xserver-common \
    sonic-pi lxde lxde-common lxde-core lxde-icon-theme penguinspuzzle \
    raspberrypi-artwork epiphany-browser supercollider wolfram-engine

sudo apt-get autoremove --purge -y

# Upgrade software packages.
sudo apt-get upgrade -y

# Install fail2ban.
sudo apt-get install -y fail2ban

# Install VIM.
sudo apt-get install -y vim

# Install screen.
sudo apt-get install -y screen

# Install irssi.
sudo apt-get install -y irssi
