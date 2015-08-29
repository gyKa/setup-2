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

# Configure irssi.
wget https://raw.githubusercontent.com/gyKa/setup-2/raspberry-pi-model-b_allez/.irssi/config
mv config ~/.irssi/
chmod 0640 ~/.irssi/config

# Install some Ruby dependencies.
sudo apt-get install -y libssl-dev libreadline-dev

# Install Rbenv.
## Check out rbenv into ~/.rbenv .
git clone git://github.com/sstephenson/rbenv.git .rbenv
## Add ~/.rbenv/bin to your $PATH for access to the rbenv command-line utility.
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
## Add rbenv init to your shell to enable shims and autocompletion.
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
## Restart your shell so that PATH changes take effect.
exec $SHELL
## ruby-build is an rbenv plugin that provides an rbenv install command to compile and install different versions of Ruby on UNIX-like systems.
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

# Install Ruby.
rbenv install 2.2.2
rbenv global 2.2.2

# Install Backup gem.
gem install backup
backup generate:model --trigger pi_backup

# Install IRC bot framework Cinch.
gem install cinch

# Install my bot.
git clone https://github.com/gyKa/sekhmeta.git
