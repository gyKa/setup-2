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

## Backup

Check the blockdevices using `lsblk` command. Then prepare backup directory assuming your user's UID is 1000, GID is 1000 :

```
sudo mkdir /media/backup
sudo mount -t vfat /dev/sda1 /media/backup -o uid=1000,gid=1000,umask=022
```
**umask=022** sets permission mode 755 for all files on the partition.

Backup model in `/home/pi/Backup/models/pi_backup.rb` should look like this:

```ruby
Model.new(:pi_backup, 'PI backup') do
  archive :txts do |archive|
    archive.add '/home/pi/Uzrasai/'
    archive.add '/home/pi/Sprintai/'
  end

  store_with Local do |local|
    local.path = '/media/backup/'
    local.keep = 5
  end
end
```

Let's grab the executable path:

```
which backup
# /home/pi/.rbenv/shims/backup
```

And now let's type `crontab -e` to setup cron job. Add a line at the bottom that looks like the following:

```
0 0 * * * /bin/bash -l -c '/home/pi/.rbenv/shims/backup perform -t pi_backup'
```
