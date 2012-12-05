#!/bin/bash
CUR_USER=$USER
echo "**** News Provider Info ************"
echo "Username: "
#read NEWS_USER
NEWS_USER=roger.wood@gmail.com
echo "Password: "
#read NEWS_PASS
NEWS_PASS=un0rm41r
echo "**** NZBMatrix Info ****************"
echo "Username: "
#read NZB_USER
NZB_USER=djester631
echo "API Key: "
#read NZB_API
NZB_API=da0dccb37b47affdf96f3139833879e0

echo "Updating Apt"
#sudo apt-get update
echo "Installing apps."
#sudo apt-get install samba minidlna sabnzbdplus
echo "Creating content directories...."
#sudo mkdir /pub/
#sudo chown $CUR_USER:$CUR_USER /pub/
#sudo chmod -R 755 /pub/
#mkdir /pub/Downloads
#mkdir /pub/Downloads/Complete
#mkdir /pub/Downloads/Complete/Movies
#mkdir /pub/Downloads/Complete/Music
#mkdir /pub/Downloads/Complete/TV
#mkdir /pub/Downloads/InProgress
#mkdir /pub/Videos
#mkdir /pub/Videos/TV
#mkdir /pub/Videos/Movies
#mkdir /pub/Music
#mkdir /pub/Pictures

echo "Configuring samba...."
#sudo mv /etc/samba/smb.conf /etc/samba/smb.conf.bak
#sudo cp ./smb.conf /etc/samba/smb.conf
#sudo sed -i "s/USERNAME/$CUR_USER/g" /etc/samba/smb.conf
#sudo sed -i "s/HOSTNAME/$HOSTNAME/g" /etc/samba/smb.conf

echo "Configuring minidlna...."
#sudo mv /etc/minidlna.conf /etc/minidlna.conf.bak
#sudo cp ./minidlna.conf /etc/minidlna.conf
#sudo sed -i "s/HOSTNAME/$HOSTNAME/g" /etc/minidlna.conf

echo "Configuring sabnzbdplus...."
sudo mv /etc/default/sabnzbdplus /etc/default/sabnzbdplus.bak
sudo cp configs/sabnzbdplus /etc/default/sabnzbdplus
sudo sed -i "s/USERNAME/$CUR_USER/g" /etc/default/sabnzbdplus
mkdir /home/$CUR_USER/.sabnzbd
cp configs/sabnzbd.ini /home/$CUR_USER/.sabnzbd/sabnzbd.ini
sed -i "s/NEWS_USER/$NEWS_USER/g" /home/$CUR_USER/.sabnzbd/sabnzbd.ini
sed -i "s/NEWS_PASS/$NEWS_PASS/g" /home/$CUR_USER/.sabnzbd/sabnzbd.ini
sed -i "s/NZB_USER/$NZB_USER/g" /home/$CUR_USER/.sabnzbd/sabnzbd.ini
sed -i "s/NZB_API/$NZB_API/g" /home/$CUR_USER/.sabnzbd/sabnzbd.ini


#git clone git://github.com/midgetspy/Sick-Beard.git .sickbeard
#cp .sickbeard/init.ubuntu /etc/init.d/sickbeard
#echo "SB_HOME=/home/$CUR_USER/.sickbeard" > /etc/default/sickbeard
#echo "SB_USER=$CUR_USER" >> /etc/default/sickbeard
#echo "SB_DATA=/home/$CUR_USER/.sickbeard" >> /etc/default/sickbeard
#chmod +x /etc/init.d/sickbeard
#sudo update-rc.d sickbeard defaults
#chmod +x .sickbeard/SickBeard.py
#vim .sickbeard/config.ini
#dont forget the config file in the autoProcessScripts folder

#git clone git://github.com/RuudBurger/CouchPotatoServer.git .couchpotato
#cp .couchpotato/init/ubuntu /etc/init.d/couchpotato
#vim /etc/init.d/couchpotato
#chmod +x /etc/init.d/couchpotato
#update-rc.d couchpotato defaults
#chmod +x .couchpotato/CouchPotato.py
#chown -R $CUR_USER:$CUR_USER .couchpotato
#su -c .couchpotato/CouchPotato.py $CUR_USER
#vim .couchpotato/settings.conf

#git clone git://github.com/rembo10/headphones.git .headphones
#cp .headphones/init.ubuntu /etc/init.d/headphones
#vim /etc/init.d/headphones
#chmod +x /etc/init.d/headphones
#update-rc.d headphones defaults
#chmod +x .headphones/Headphones.py
#chown -R $CUR_USER:$CUR_USER .headphones
#su -c .headphones/Headphones.py $CUR_USER
#vim .headphones/config.ini

