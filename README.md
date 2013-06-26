# rpi-ledarray-eagle

## Bill of Materials

| Part Number(s)	| Description	| Manufacturer	| MFG Number	| Distributor |
| ------------------|:-------------:| :------------:|:-------------:|------------:|
| R1,R2,R3,R4,R5,R6,R7,R8,R9,R10 | RES 220 OHM 1/10W 5% 0603 SMD | Yageo|311-220GRCT-ND | <a href="http://www.digikey.com">Digikey</a> |
| LED1,LED2,LED3,LED4,LED5,LED6,LED7,LED8,LED9,LED10 | LED 3X1.5MM 568NM GN WTR CLR SMD | Kingbright | 754-1111-1-ND | <a href="http://www.digikey.com">Digikey</a> |
| JP1 | CONN HEADER FMAL 26PS .1" DL TIN | Sullins Connector Solutions | S7081-ND | <a href="http://www.digikey.com">Digikey</a> |

## Testing the board

In the "code" folder is a Bash script for testing the LED array PCB. In a terminal window on the Raspberry Pi, navigate to the "code" folder and run the following command:

	sudo bash testLEDarray.sh

-OR-

	sudo ./testLEDarray.sh

While the script is running, the LEDs on the LED array PCB should illuminate one by one in sequential order until all LEDs are illuminated. All LEDs should then turn off.
