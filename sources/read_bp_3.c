#include <stdio.h>
#include <wiringPi.h>


int main(void)
{
		
	int switchPinBP3=2;


        int etat_bp3=1;
        
        if(wiringPiSetup()==-1)
        {
		return 0;
	}

        //le port GPIO est configure en lecture
        pinMode(switchPinBP3,INPUT);
        
        int button_BP3=0;
        
        while(1)
        {
              //on lit la valeur de la broche GPIO
              button_BP3=digitalRead(switchPinBP3);
               

              if(button_BP3==0)//Si un appui sur le bouton est detecte
              {
                      //on affiche un message
                      printf("button 3 pressed!\n");
                      if(etat_bp3==0)
                      {
                              printf("prise 3 on\n");
                              system("sh /etc/lcd_bouton_rf433/scripts/prise_radio.sh prise_3 on");
			      //system("bash /etc/lcd_bouton_rf433/scripts/envoie_linknx.sh 192.168.1.25 1028 prise_radio_remise_1_status on");
                              etat_bp3=1;
                      }
                      else if(etat_bp3==1)
                      {
                              printf("prise 3 off\n");
                              system("sh /etc/lcd_bouton_rf433/scripts/prise_radio.sh prise_3 off"); 
			      //system("bash /etc/lcd_bouton_rf433/scripts/envoie_linknx.sh 192.168.1.25 1028 prise_radio_remise_1_status off");
                              etat_bp3=0;
                      }
                      else
                      {
                              etat_bp3==button_BP3;
                      }

                      //cette boucle permet de gerer un appui continu
                      while(button_BP3==0)
                      {
                              //on relit la valeur a chaque fois
                              button_BP3=digitalRead(switchPinBP3);
                              delay(20);//et on attend 20ms
                      }
              }

                delay(20);//on attend 20ms entre chaque lecture.
        }
        return 0;
}
