#!/bin/bash 

#######################################################################
# Title      :    run prise radio
# Author     :    angelz
# Date       :    05/06/2013
# Version        :        1.0.0
#######################################################################
# Description
#   prise radio on off  
# Note:
#   - 
#######################################################################

prise=$1
etat=$2

if [ "$prise" = "prise_1" ]; then
    if [ "$etat" = "on" ]; then
	 #run commande rfx433
	 python /etc/lcd_bouton_rf433/rfx433/rfxcmd.py -d /dev/ttyUSB0 -a send -r "0B1100010095D83E01010F70"
	 echo "on" > /etc/lcd_bouton_rf433/etat_prise/etat_prise_1 
	sleep 2
	 bash /etc/lcd_bouton_rf433/scripts/envoie_linknx.sh 192.168.1.25 1028 prise_radio_remise_1_status on 
	 
    elif [ "$etat" = "off" ]; then
	 python /etc/lcd_bouton_rf433/rfx433/rfxcmd.py -d /dev/ttyUSB0 -a send -r "0B1100010095D83E01000070"
	 echo "off" > /etc/lcd_bouton_rf433/etat_prise/etat_prise_1 
	sleep 2
	 bash /etc/lcd_bouton_rf433/scripts/envoie_linknx.sh 192.168.1.25 1028 prise_radio_remise_1_status off
    else
       echo "pas d etat"
    fi

#prise 2
elif [ "$prise" = "prise_2" ]; then
    if [ "$etat" = "on" ]; then      
	 python /etc/lcd_bouton_rf433/rfx433/rfxcmd.py -d /dev/ttyUSB0 -a send -r "0B1100010095D83E02010F70"
	sleep 2
	 bash /etc/lcd_bouton_rf433/scripts/envoie_linknx.sh 192.168.1.25 1028 prise_radio_remise_2_status on
	 echo "on" > /etc/lcd_bouton_rf433/etat_prise/etat_prise_2 

    elif [ "$etat" = "off" ]; then
	 python /etc/lcd_bouton_rf433/rfx433/rfxcmd.py -d /dev/ttyUSB0 -a send -r "0B1100010095D83E02000070"
	sleep 2
	 bash /etc/lcd_bouton_rf433/scripts/envoie_linknx.sh 192.168.1.25 1028 prise_radio_remise_2_status off
         echo "off" > /etc/lcd_bouton_rf433/etat_prise/etat_prise_2

    else
       echo "pas d etat"
    fi


#prise 3
elif [ "$prise" = "prise_3" ]; then
    if [ "$etat" = "on" ]; then      
	 python /etc/lcd_bouton_rf433/rfx433/rfxcmd.py -d /dev/ttyUSB0 -a send -r "0B1100010095D83E03010F70"
	sleep 2
	 bash /etc/lcd_bouton_rf433/scripts/envoie_linknx.sh 192.168.1.25 1028 prise_radio_remise_3_status on
	 echo "on" > /etc/lcd_bouton_rf433/etat_prise/etat_prise_3 

    elif [ "$etat" = "off" ]; then
	 python /etc/lcd_bouton_rf433/rfx433/rfxcmd.py -d /dev/ttyUSB0 -a send -r "0B1100010095D83E03000070"
	sleep 2
	 bash /etc/lcd_bouton_rf433/scripts/envoie_linknx.sh 192.168.1.25 1028 prise_radio_remise_3_status off 
	 echo "off" > /etc/lcd_bouton_rf433/etat_prise/etat_prise_3

    else
       echo "pas d etat"
    fi


else
    echo "pas de prise"
fi




sh /etc/lcd_bouton_rf433/scripts/affichage_lcd.sh

