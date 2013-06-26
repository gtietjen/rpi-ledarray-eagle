# rpi-ledarray-eagle

## Description

<p>The Raspberry Pi LED array is a printed circuit board that mates directly with the GPIO (general purpose input/output) headers of a [Raspberry Pi](http://www.raspberrypi.org/) computer. This module adds a 10 LED array that can be controlled by software however you'd like. The Raspberry Pi GPIO can be accessed and controlled by many different languages, and code examples can be found at: http://elinux.org/Rpi_Low-level_peripherals#GPIO_Code_examples</p>
<p>The LEDs are connected to the GPIO headers with their anode to the 5V pins and their cathode to a controllable GPIO pin via a current limiting series resistor. There are many reasons why they are connected this way. The first reason being the power supply. The GPIO pins provide both a 3.3V source and a 5V source. The 5V source is from the board's 5V power supply and is limited mostly by the power adapter being used. The 3.3V supply pins can only supply about 50mA. With 10 LEDs on the array board, 50mA simply isn't enough current, especially if you'd like to turn all LEDs on. All the numbered GPIO pins are 3.3V levels and can only source a maximum of 50mA, however they are able to sink up to 16mA per pin. So, each LED is being supplied 5V and being sinked to ground by a 3.3V level GPIO pin on command.</p>
<p>Since each LED is being supplied with 5V and sinked to ground, this alters the logic behind controlling each LED. To turn an LED on, a GPIO pin must be pulled to ground, LOW or 0 state. To turn an LED off completely, a GPIO pin was must be placed in an INPUT state, i.e. Hi-Z or high impedance state. You can turn an LED off by pulling the GPIO pin to a logic level HIGH or 1 state, but you may notice the LED is not completely off.</p>

## Dimensions
The board is approximately 1.31" x 0.62". The board has been designed to fit within a [Pibow](http://shop.pimoroni.com/products/pibow) Raspberry Pi case by [Pimoroni](http://shop.pimoroni.com/).

## LED Mapping
| LED | GPIO Pin |
|:---:|:--------:|
| 1 | 4 |
| 2 | 17 |
| 3 | 27 |
| 4 | 22 |
| 5 | 18 |
| 6 | 23 |
| 7 | 24 |
| 8 | 25 |
| 9 | 8 |
| 10 | 7 |

## Bill of Materials

| Part Number(s)	| Description	| Manufacturer	| MFG Number	| Distributor |
| ------------------|:-------------:| :------------:|:-------------:|:------------:|
| R1, R2, R3, R4, R5, R6, R7, R8, R9, R10 | RES 220 OHM 1/10W 5% 0603 SMD | Yageo|311-220GRCT-ND | <a href="http://www.digikey.com">Digikey</a> |
| LED1, LED2, LED3, LED4, LED5, LED6, LED7, LED8, LED9, LED10 | LED 3X1.5MM 568NM GN WTR CLR SMD | Kingbright | 754-1111-1-ND | <a href="http://www.digikey.com">Digikey</a> |
| JP1 | CONN HEADER FMAL 26PS .1" DL TIN | Sullins Connector Solutions | S7081-ND | <a href="http://www.digikey.com">Digikey</a> |

## Testing the board

In the "code" folder is a Bash script for testing the LED array PCB. In a terminal window on the Raspberry Pi, navigate to the "code" folder and run the following command:

	sudo bash testLEDarray.sh

-OR-

	sudo ./testLEDarray.sh

While the script is running, the LEDs on the LED array PCB should illuminate one by one in sequential order until all LEDs are illuminated. All LEDs should then turn off.
