#!/bin/bash
sudo apt-get update
sudo apt-get -y upgrade
sudo kdir /pub/
sudo chown $USER:$USER /pub/
sudo chmod -R 755 /pub/
sudo mkdir /pub/Downloads
sudo mkdir /pub/Downloads/Complete
sudo mkdir /pub/Downloads/Complete/Movies
sudo mkdir /pub/Downloads/Complete/Music
sudo mkdir /pub/Downloads/Complete/TV
sudo mkdir /pub/Downloads/InProgress
sudo mkdir /pub/Videos
sudo mkdir /pub/Videos/TV
sudo mkdir /pub/Videos/Movies
sudo mkdir /pub/Music
sudo mkdir /pub/Pictures
sudo chown -R $USER:$USER /pub
sudo chmod -R 777 /pub
sudo apt-get install samba minidlna git sabnzbdplus
sudo vim /etc/samba/smb.conf
sudo vim /etc/minidlna.conf

git clone git://github.com/midgetspy/Sick-Beard.git .sickbeard.conf
cp .sickbeard/init.ubuntu /etc/init.d/sickbeard
echo "SB_HOME=/home/$USER/.sickbeard" > /etc/default/sickbeard
echo "SB_USER=$USER" >> /etc/default/sickbeard
echo "SB_DATA=/home/$USER/.sickbeard" >> /etc/default/sickbeard
chmod +x /etc/init.d/sickbeard
update-rc.d sickbeard defaults
chmod +x .sickbeard/SickBeard.py
chown -R $USER:$USER .sickbeard
su -c .sickbeard/SickBeard.py $USER
vim .sickbeard/config.ini

git clone git://github.com/RuudBurger/CouchPotatoServer.git .couchpotato
cp .couchpotato/init/ubuntu /etc/init.d/couchpotato
vim /etc/init.d/couchpotato
chmod +x /etc/init.d/couchpotato
update-rc.d couchpotato defaults
chmod +x .couchpotato/CouchPotato.py
chown -R $USER:$USER .couchpotato
su -c .couchpotato/CouchPotato.py $USER
vim .couchpotato/settings.conf

git clone git://github.com/rembo10/headphones.git .headphones
cp .headphones/init.ubuntu /etc/init.d/headphones
vim /etc/init.d/headphones
chmod +x /etc/init.d/headphones
update-rc.d headphones defaults
chmod +x .headphones/Headphones.py
chown -R $USER:$USER .headphones
su -c .headphones/Headphones.py $USER
vim .headphones/config.ini

