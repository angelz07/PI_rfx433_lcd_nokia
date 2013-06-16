#include <stdio.h>
#include <wiringPi.h>


int main(void)
{
		
	int switchPinBP2=7;


        int etat_bp2=1;
        
        if(wiringPiSetup()==-1)
        {
		return 0;
	}

        //le port GPIO est configure en lecture
        pinMode(switchPinBP2,INPUT);
        
        int button_BP2=0;
        
        while(1)
        {
              //on lit la valeur de la broche GPIO
              button_BP2=digitalRead(switchPinBP2);
               

              if(button_BP2==0)//Si un appui sur le bouton est detecte
              {
                      //on affiche un message
                      printf("button 2 pressed!\n");
                      if(etat_bp2==0)
                      {
                              printf("prise 2 on\n");
                              system("sh /etc/lcd_bouton_rf433/scripts/prise_radio.sh prise_2 on");
			      //system("bash /etc/lcd_bouton_rf433/scripts/envoie_linknx.sh 192.168.1.25 1028 prise_radio_remise_1_status on");
                              etat_bp2=1;
                      }
                      else if(etat_bp2==1)
                      {
                              printf("prise 2 off\n");
                              system("sh /etc/lcd_bouton_rf433/scripts/prise_radio.sh prise_2 off"); 
			      //system("bash /etc/lcd_bouton_rf433/scripts/envoie_linknx.sh 192.168.1.25 1028 prise_radio_remise_1_status off");
                              etat_bp2=0;
                      }
                      else
                      {
                              etat_bp2==button_BP2;
                      }

                      //cette boucle permet de gerer un appui continu
                      while(button_BP2==0)
                      {
                              //on relit la valeur a chaque fois
                              button_BP2=digitalRead(switchPinBP2);
                              delay(20);//et on attend 20ms
                      }
              }

                delay(20);//on attend 20ms entre chaque lecture.
        }
        return 0;
}
