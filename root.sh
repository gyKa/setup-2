#!/bin/sh

echo "==> Updating the list of packages..."
apt-get update > /dev/null

echo "==> Installing the newest versions of all packages..."
apt-get upgrade -y > /dev/null

echo "==> Adding new user..."
adduser gytis

echo "==> Disabling root login over SSH..."
echo "    PermitRootLogin no" >> /etc/ssh/ssh_config
/etc/init.d/ssh reload

