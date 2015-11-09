#!/bin/sh

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

sudo apt-get install -y virtualbox-guest-utils virtualbox-guest-x11 virtualbox-guest-dkms

# Upload generated SSH key to Github.
ssh-keygen -t rsa -b 4096 -C "vm@ubuntu-mate-15_10"

sudo apt-get install -y git gitg pgadmin3

git config --global user.email "gytis@karciauskas.lt"
git config --global user.name "Gytis Karčiauskas"

git clone git@github.com:gyKa/setup-2.git ~/Workspace/setup-2
