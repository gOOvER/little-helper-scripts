#!/bin/sh

echo "Restarting Services....";
systemctl restart php5.6-fpm
systemctl restart php7.0-fpm
systemctl restart php7.1-fpm
systemctl restart php7.2-fpm
systemctl restart php7.3-fpm
systemctl restart apache2
echo "Done...";