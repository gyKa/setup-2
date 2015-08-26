# RaspberryPi 1 Model B, a.k.a. *allez*

Install latest version of Raspbian OS.

When you start your Pi for the first time the raspi-config menu will appear.

Select following entries:

1) Expand Filesystem

3) Enable Boot to Desktop/Scratch > Console Text console, requiring login (default)

4) Internationalisation Options > Change Timezone > Europe > Vilnius

5) Enable Camera > Disable

8) Advanced Options > Hostname > Enter 'allez'

8) Advanced Options > Memory Split > 16

8) Advanced Options > Serial > No

Then select "Finish" and "Yes".

After reboot, change default account password.

## Prepare setup

Download `setup.sh` from this directory:

`wget https://raw.githubusercontent.com/gyKa/setup-2/raspberry-pi-model-b_allez/setup.sh`

And run `bash setup.sh`. After work, delete this file by running `rm setup.sh`.

## Locales

Add `LC_ALL="en_US.utf8"`to */etc/environment* and reboot.
