#!/bin/bash
#title           :pbupdate.sh
#description     :This script will update PhantomBot to latest Nightly.
#author		 	 :gOOvER (Torsten Widmann)
#date            :02102018
#version         :0.1
#licence		 :GPLv3

## Vars
## Change it for your needs
##

botdir="/home/phantom/phantombot"
botname="phantombot"
botuser="phantom"
botgroup="phantom"

##
##Checks if running as root
##
if [[ $EUID -eq 0 ]]; then
  echo "This script must NOT be run as root" 1>&2
  exit 1
fi
##
echo "Bot is stopping..."
##
##Backup of the Bot
##
sudo systemctl stop phantombot
echo "Backing Up the Bot..."
cd $botdir
tar czvf ~/backup/$botname.backup.$(date +%Y%m%d).tgz *
cd ~
##
##Download & Install
##
echo "Downloading Bot..."
wget https://github.com/PhantomBot/nightly-build/raw/master/PhantomBot-nightly.zip
unzip PhantomBot-nightly.zip
cd PhantomBot-2*
echo "Copy Bot..."
cp -a * $botdir
cd ~
cd $botdir
echo "Set permissions...."
chown -fR $botuser:$botgroup *
chmod u+x launch-service.sh launch.sh
sudo systemctl start phantombot
##
## CleanUp
##
cd ~
rm -fR PhantomBot-nightly.zip
rm -fR PhnatomBot-2*
