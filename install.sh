#!/bin/bash
echo "**** News Provider Info ************"
echo "Username: "
read NEWS_USER
echo "Password: "
read NEWS_PASS
echo "**** NZBMatrix Info ****************"
echo "Username: "
read NZB_USER
echo "API Key: "
read NZB_API
SAB_API_KEY=$(uuidgen | sed "s/-//g")

echo "Updating Apt"
sudo apt-get update
echo "Installing apps."
sudo apt-get install samba minidlna sabnzbdplus ffmpeg python-cherrypy

echo "Configuring web site...."
chmod +x MediaBase.py 
sudo chown root shutdown.sh
sudo chmod 4755 shutdown.sh
sudo cp mediabase.init /etc/init.d/mediabase
sudo chmod +x /etc/init.d/mediabase
sudo sed -i "s,PATH_TO_APP,$PWD,g" /etc/init.d/mediabase
sudo update-rc.d mediabase defaults

echo "Creating content directories...."
sudo mkdir /pub/
sudo chown $USER:$USER /pub/
sudo chmod -R 755 /pub/
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

echo "Configuring samba...."
sudo mv /etc/samba/smb.conf /etc/samba/smb.conf.bak
sudo cp ./configs/smb.conf /etc/samba/smb.conf
sudo sed -i "s/USERNAME/$USER/g" /etc/samba/smb.conf
sudo sed -i "s/HOSTNAME/$HOSTNAME/g" /etc/samba/smb.conf

echo "Configuring minidlna...."
sudo mv /etc/minidlna.conf /etc/minidlna.conf.bak
sudo cp ./configs/minidlna.conf /etc/minidlna.conf
sudo sed -i "s/HOSTNAME/$HOSTNAME/g" /etc/minidlna.conf

echo "Configuring sabnzbdplus...."
sudo mv /etc/default/sabnzbdplus /etc/default/sabnzbdplus.bak
sudo cp configs/sabnzbdplus /etc/default/sabnzbdplus
sudo sed -i "s/USERNAME/$USER/g" /etc/default/sabnzbdplus
mkdir /home/$USER/.sabnzbd
cp configs/sabnzbd.ini /home/$USER/.sabnzbd/sabnzbd.ini
sed -i "s/USERNAME/$USER/g" /home/$USER/.sabnzbd/sabnzbd.ini
sed -i "s/NEWS_USER/$NEWS_USER/g" /home/$USER/.sabnzbd/sabnzbd.ini
sed -i "s/NEWS_PASS/$NEWS_PASS/g" /home/$USER/.sabnzbd/sabnzbd.ini
sed -i "s/NZB_USER/$NZB_USER/g" /home/$USER/.sabnzbd/sabnzbd.ini
sed -i "s/NZB_API/$NZB_API/g" /home/$USER/.sabnzbd/sabnzbd.ini
sed -i "s/SAB_API_KEY/$SAB_API_KEY/g" /home/$USER/.sabnzbd/sabnzbd.ini

echo "Installing sickbeard...."
git clone git://github.com/midgetspy/Sick-Beard.git /home/$USER/.sickbeard
echo "Configuring sickbeard...."
sudo cp /home/$USER/.sickbeard/init.ubuntu /etc/init.d/sickbeard
sudo cp configs/sickbeard /etc/default/sickbeard
sudo sed -i "s/USERNAME/$USER/g" /etc/default/sickbeard
sudo chmod +x /etc/init.d/sickbeard
sudo update-rc.d sickbeard defaults
chmod +x /home/$USER/.sickbeard/SickBeard.py
cp /home/$USER/.sickbeard/autoProcessTV/autoProcessTV.cfg.sample /home/$USER/.sickbeard/autoProcessTV/autoProcessTV.cfg
sed -i "s/8081/5002/g" /home/$USER/.sickbeard/autoProcessTV/autoProcessTV.cfg
cp configs/sickbeard.config.ini /home/$USER/.sickbeard/config.ini
sed -i "s/NZB_USER/$NZB_USER/g" /home/$USER/.sickbeard/config.ini
sed -i "s/NZB_API/$NZB_API/g" /home/$USER/.sickbeard/config.ini
sed -i "s/SAB_API_KEY/$sab_api_key/g" /home/$USER/.sickbeard/config.ini

echo "Installing couchpotato...."
git clone git://github.com/RuudBurger/CouchPotatoServer.git /home/$USER/.couchpotato
echo "Configuring couchpotato...."
sudo cp /home/$USER/.couchpotato/init/ubuntu /etc/init.d/couchpotato
sudo sed -i "s/YOUR_USERNAME_HERE/$USER/g" /etc/init.d/couchpotato
sudo sed -i "s/\\/usr\\/local\\/sbin\\/CouchPotatoServer/\\/home\\/$USER\\/.couchpotato/g" /etc/init.d/couchpotato
sudo chmod +x /etc/init.d/couchpotato
sudo update-rc.d couchpotato defaults
chmod +x /home/$USER/.couchpotato/CouchPotato.py
cp configs/couchpotato.settings.conf /home/$USER/.couchpotato/settings.conf
sed -i "s/USERNAME/$USER/g" /home/$USER/.couchpotato/settings.conf
sed -i "s/NZB_USER/$NZB_USER/g" /home/$USER/.couchpotato/settings.conf
sed -i "s/NZB_API/$NZB_API/g" /home/$USER/.couchpotato/settings.conf
sed -i "s/SAB_API_KEY/$sab_api_key/g" /home/$USER/.couchpotato/settings.conf

echo "Installing headphones...."
git clone git://github.com/rembo10/headphones.git /home/$USER/.headphones
echo "Configureing headphones...."
sudo cp /home/$USER/.headphones/init.ubuntu /etc/init.d/headphones
sudo sed -i "s/root/$USER/g" /etc/init.d/headphones
sudo sed -i "s/\\/usr\\/local\\/sbin\\/headphones/\\/home\\/$USER\\/.headphones/g" /etc/init.d/headphones
sudo chmod +x /etc/init.d/headphones
sudo update-rc.d headphones defaults
chmod +x /home/$USER/.headphones/Headphones.py
cp configs/headphones.config.ini /home/$USER/.headphones/config.ini
sed -i "s/USERNAME/$USER/g" /home/$USER/.headphones/config.ini
sed -i "s/NZB_USER/$NZB_USER/g" /home/$USER/.headphones/config.ini
sed -i "s/NZB_API/$NZB_API/g" /home/$USER/.headphones/config.ini
sed -i "s/SAB_API_KEY/$sab_api_key/g" /home/$USER/.headphones/config.ini

