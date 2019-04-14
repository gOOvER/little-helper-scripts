#/bin/sh
cd /tmp
wget http://olivier.sessink.nl/jailkit/jailkit-2.20.tar.gz
tar xvfz jailkit-2.20.tar.gz
cd jailkit-2.20
echo 5 > debian/compat
./debian/rules binary
cd ..
dpkg -i jailkit_2.20-1_*.deb
rm -rf jailkit-2.20*
