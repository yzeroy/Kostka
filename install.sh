cd /home/pi
sudo git clone https://github.com/yzeroy/Kostka.git


sudo nano /home/pi/Kostka/.git/hooks/post-merge

#!/bin/sh 
rm /home/pi/update_conf.sh
cp -f /home/pi/Kostka/update.sh /home/pi/update_conf.sh
cd /home/pi
chmod +x update_conf.sh 
./update_conf.sh

 
sudo nano /home/pi/update_conf.sh

xxxxx

sudo chmod +x /home/pi/update_conf.sh
sudo chmod +x /home/pi/Kostka/.git/hooks/post-merge

cd /home/pi/printer_data/config/

sudo mkdir /home/pi/printer_data/config/Archive

sudo cp /home/pi/Kostka/Konfigurace/* /home/pi/printer_data/config/Konfigy/

sudo chown -R pi:pi /home/pi

sudo service klipper restart
sudo service moonraker restart
