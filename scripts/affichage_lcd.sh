#!/bin/bash 

#######################################################################
# Title      :    Affichage LCD
# Author     :    angelz
# Date       :    05/06/2013
# Version        :        1.0.0
#######################################################################
# Description
#   affichage lcd
# Note:
#   - 
#######################################################################


lcd_prise1=""
lcd_prise2=""
lcd_prise3=""

lcd_prise1_status=`cat /etc/lcd_bouton_rf433/etat_prise/etat_prise_1`
lcd_prise2_status=`cat /etc/lcd_bouton_rf433/etat_prise/etat_prise_2`
lcd_prise3_status=`cat /etc/lcd_bouton_rf433/etat_prise/etat_prise_3`



if [ "$lcd_prise1_status" = "on" ]; then      
        lcd_prise1=" Prise 1   ON "

elif [ "$lcd_prise1_status" = "off" ]; then
        lcd_prise1=" Prise 1   OFF"
 
else
        lcd_prise1="              "
        echo "pas d etat"
fi

if [ "$lcd_prise2_status" = "on" ]; then      
        lcd_prise2=" Prise 2   ON "

elif [ "$lcd_prise2_status" = "off" ]; then
        lcd_prise2=" Prise 2   OFF"

else
        lcd_prise2="              "
        echo "pas d etat"
fi


if [ "$lcd_prise3_status" = "on" ]; then      
        lcd_prise3=" Prise 3   ON "

elif [ "$lcd_prise3_status" = "off" ]; then
        lcd_prise3=" Prise 3   OFF"

else
        lcd_prise3="              "
        echo "pas d etat"
fi


 


python /etc/lcd_bouton_rf433/lcd/lcd_remise_text "PI Domo Remise"  " 192.168.1.36 " "              "  "$lcd_prise1" "$lcd_prise2" "$lcd_prise3"
