
#!/bin/bash
#title           :sogeupdate.sh
#description     :This script will update SogeBot to latest Nightly.
#author          :gOOvER (Torsten Widmann)
#date            :01022019
#version         :0.1
#licence         :GPLv3

cd sogeBot
pm2 stop all
pm2 kill
git pull
make
pm2 start --name sogebot npm -- start
