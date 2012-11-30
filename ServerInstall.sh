#!/bin/bash
apt-get update
apt-get -y upgrade
mkdir /pub/
chown rwood:rwood /pub/
chmod -R 755 /pub/
mkdir /pub/Downloads
mkdir /pub/Downloads/Complete
mkdir /pub/Downloads/Complete/Movies
mkdir /pub/Downloads/Complete/Music
mkdir /pub/Downloads/Complete/TV
mkdir /pub/Downloads/InProgress
mkdir /pub/Videos
mkdir /pub/Videos/TV
mkdir /pub/Videos/Movies
mkdir /pub/Music
mkdir /pub/Pictures
chown -R rwood:rwood /pub
chmod -R 777 /pub
apt-get install samba minidlna
vim /etc/samba/smb.conf
vim /etc/minidlna.conf

git clone git://github.com/midgetspy/Sick-Beard.git .sickbeard.conf
cp .sickbeard/init.ubuntu /etc/init.d/sickbeard
echo "SB_HOME=/home/rwood/.sickbeard" > /etc/default/sickbeard
echo "SB_USER=rwood" >> /etc/default/sickbeard
echo "SB_DATA=/home/rwood/.sickbeard" >> /etc/default/sickbeard
chmod +x /etc/init.d/sickbeard
update-rc.d sickbeard defaults
chmod +x .sickbeard/SickBeard.py
chown -R rwood:rwood .sickbeard
su -c .sickbeard/SickBeard.py rwood
vim .sickbeard/config.ini

git clone git://github.com/RuudBurger/CouchPotatoServer.git .couchpotato
cp .couchpotato/init/ubuntu /etc/init.d/couchpotato
vim /etc/init.d/couchpotato
chmod +x /etc/init.d/couchpotato
update-rc.d couchpotato defaults
chmod +x .couchpotato/CouchPotato.py
chown -R rwood:rwood .couchpotato
su -c .couchpotato/CouchPotato.py rwood
vim .couchpotato/settings.conf

git clone git://github.com/rembo10/headphones.git .headphones
cp .headphones/init.ubuntu /etc/init.d/headphones
vim /etc/init.d/headphones
chmod +x /etc/init.d/headphones
update-rc.d headphones defaults
chmod +x .headphones/Headphones.py
chown -R rwood:rwood .headphones
su -c .headphones/Headphones.py rwood
vim .headphones/config.ini

