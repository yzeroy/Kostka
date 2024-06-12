#!/bin/bash

if ! command -v zip &> /dev/null; then
    sudo apt-get update
    sudo apt-get install zip -y

    if [ $? -eq 0 ]; then
        echo "ZIP utility installed successfully."
    else
        echo "Failed to install ZIP utility."
        exit 1
    fi
fi


echo "Zálohuji předchozí konfigurace"

cd /home/pi/printer_data/config

zip -r "zaloha_$(date +"%d-%m-%Y").zip" /home/pi/printer_data/config/* -x "/home/pi/printer_data/config/Archive/*" -x "/home/pi/printer_data/config/Archive"

mv "zaloha_$(date +"%d-%m-%Y").zip" /home/pi/printer_data/config/Archive

cp -f /home/pi/Kostka/Konfigy/* /home/pi/printer_data/config/Konfigy/

echo "Restartuji klipper pro načtení nových konfigurací"

service klipper restart

echo "Update hotový"
 