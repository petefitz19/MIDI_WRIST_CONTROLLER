EESchema Schematic File Version 4
LIBS:I2C_Front_Forearm_Mini-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L dk_Embedded-Microcontrollers:ATMEGA328P-PU U1
U 1 1 5E4DCC80
P 2650 3700
F 0 "U1" H 2928 3703 60  0000 L CNN
F 1 "ATMEGA328P-PU" H 2928 3597 60  0000 L CNN
F 2 "digikey-footprints:DIP-28_W7.62mm" H 2850 3900 60  0001 L CNN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en608326" H 2850 4000 60  0001 L CNN
F 4 "ATMEGA328P-PU-ND" H 2850 4100 60  0001 L CNN "Digi-Key_PN"
F 5 "ATMEGA328P-PU" H 2850 4200 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 2850 4300 60  0001 L CNN "Category"
F 7 "Embedded - Microcontrollers" H 2850 4400 60  0001 L CNN "Family"
F 8 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en608326" H 2850 4500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/microchip-technology/ATMEGA328P-PU/ATMEGA328P-PU-ND/1914589" H 2850 4600 60  0001 L CNN "DK_Detail_Page"
F 10 "IC MCU 8BIT 32KB FLASH 28DIP" H 2850 4700 60  0001 L CNN "Description"
F 11 "Microchip Technology" H 2850 4800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2850 4900 60  0001 L CNN "Status"
	1    2650 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5E4DF610
P 2000 2450
F 0 "R1" H 2070 2496 50  0000 L CNN
F 1 "10k" H 2070 2405 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 1930 2450 50  0001 C CNN
F 3 "~" H 2000 2450 50  0001 C CNN
	1    2000 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 2600 2000 2600
Wire Wire Line
	2000 2300 2650 2300
Connection ~ 2650 2300
Wire Wire Line
	2650 2300 2750 2300
$Comp
L power:+5V #PWR0101
U 1 1 5E4E0775
P 2000 2300
F 0 "#PWR0101" H 2000 2150 50  0001 C CNN
F 1 "+5V" H 2015 2473 50  0000 C CNN
F 2 "" H 2000 2300 50  0001 C CNN
F 3 "" H 2000 2300 50  0001 C CNN
	1    2000 2300
	1    0    0    -1  
$EndComp
Connection ~ 2000 2300
Text Label 2150 2700 2    50   ~ 0
D0
Text Label 2150 2800 2    50   ~ 0
D1
Text Label 2150 2900 2    50   ~ 0
D2
Text Label 2150 3000 2    50   ~ 0
D3
Text Label 2150 3100 2    50   ~ 0
D4
Text Label 2150 3200 2    50   ~ 0
XTAL1
Text Label 2150 3300 2    50   ~ 0
XTAL2
Text Label 2150 3400 2    50   ~ 0
D5
Text Label 2150 3500 2    50   ~ 0
D6
Text Label 2150 3600 2    50   ~ 0
D7
Text Label 2150 3700 2    50   ~ 0
D8
Text Label 2150 3800 2    50   ~ 0
D9
Text Label 2150 3900 2    50   ~ 0
D10
Text Label 2150 4000 2    50   ~ 0
D11
Text Label 2150 4100 2    50   ~ 0
D12
Text Label 2150 4200 2    50   ~ 0
D13
Text Label 2150 4400 2    50   ~ 0
A0
Text Label 2150 4500 2    50   ~ 0
A1
Text Label 2150 4700 2    50   ~ 0
A3
Text Label 2150 4600 2    50   ~ 0
A2
Text Label 2150 4800 2    50   ~ 0
SDA
Text Label 2150 4900 2    50   ~ 0
SCL
$Comp
L power:GND #PWR0102
U 1 1 5E4E2486
P 2700 5300
F 0 "#PWR0102" H 2700 5050 50  0001 C CNN
F 1 "GND" H 2705 5127 50  0000 C CNN
F 2 "" H 2700 5300 50  0001 C CNN
F 3 "" H 2700 5300 50  0001 C CNN
	1    2700 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 5200 2650 5300
Wire Wire Line
	2650 5300 2700 5300
Wire Wire Line
	2750 5200 2750 5300
Wire Wire Line
	2750 5300 2700 5300
Connection ~ 2700 5300
$Comp
L Device:Crystal Y1
U 1 1 5E4E30BC
P 1500 3300
F 0 "Y1" H 1500 3568 50  0000 C CNN
F 1 "Crystal" H 1500 3477 50  0000 C CNN
F 2 "Crystal:Crystal_HC52-8mm_Vertical" H 1500 3300 50  0001 C CNN
F 3 "~" H 1500 3300 50  0001 C CNN
	1    1500 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 3200 1650 2950
Wire Wire Line
	1650 2950 1350 2950
Wire Wire Line
	1350 2950 1350 3300
$Comp
L Device:C C1
U 1 1 5E4E51D7
P 1350 3550
F 0 "C1" H 1236 3504 50  0000 R CNN
F 1 "22pF" H 1236 3595 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 1388 3400 50  0001 C CNN
F 3 "~" H 1350 3550 50  0001 C CNN
	1    1350 3550
	1    0    0    1   
$EndComp
Connection ~ 1350 3300
$Comp
L Device:C C2
U 1 1 5E4E6DFF
P 1650 3550
F 0 "C2" H 1765 3596 50  0000 L CNN
F 1 "22pF" H 1765 3505 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 1688 3400 50  0001 C CNN
F 3 "~" H 1650 3550 50  0001 C CNN
	1    1650 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 3300 1350 3400
Wire Wire Line
	1650 3300 1650 3400
Connection ~ 1650 3300
Wire Wire Line
	1650 3200 2150 3200
Wire Wire Line
	1650 3300 2150 3300
$Comp
L power:GND #PWR0103
U 1 1 5E4EAC05
P 1500 3750
F 0 "#PWR0103" H 1500 3500 50  0001 C CNN
F 1 "GND" H 1505 3577 50  0000 C CNN
F 2 "" H 1500 3750 50  0001 C CNN
F 3 "" H 1500 3750 50  0001 C CNN
	1    1500 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 3700 1350 3750
Wire Wire Line
	1350 3750 1500 3750
Wire Wire Line
	1650 3700 1650 3750
Wire Wire Line
	1650 3750 1500 3750
Connection ~ 1500 3750
$Comp
L PTL45-15O1-503B2:PTL45-15O1-503B2 J2
U 1 1 5E4EBE8D
P 4100 2650
F 0 "J2" H 4550 2915 50  0000 C CNN
F 1 "Slider_2" H 4550 2824 50  0000 C CNN
F 2 "PTL45-10O1-503B2:PTL4515O1503B2" H 4850 2750 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/PTL45-15O1-503B2.pdf" H 4850 2650 50  0001 L CNN
F 4 "Slide Potentiometers 50Kohms Travel=45mm Center Detent" H 4850 2550 50  0001 L CNN "Description"
F 5 "23" H 4850 2450 50  0001 L CNN "Height"
F 6 "652-PTL45-15O1-503B2" H 4850 2350 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=652-PTL45-15O1-503B2" H 4850 2250 50  0001 L CNN "Mouser Price/Stock"
F 8 "Bourns" H 4850 2150 50  0001 L CNN "Manufacturer_Name"
F 9 "PTL45-15O1-503B2" H 4850 2050 50  0001 L CNN "Manufacturer_Part_Number"
	1    4100 2650
	1    0    0    -1  
$EndComp
Text Label 4100 2650 2    50   ~ 0
A2
NoConn ~ 4100 2850
$Comp
L power:+5V #PWR0104
U 1 1 5E4ED6B4
P 3950 2600
F 0 "#PWR0104" H 3950 2450 50  0001 C CNN
F 1 "+5V" H 3965 2773 50  0000 C CNN
F 2 "" H 3950 2600 50  0001 C CNN
F 3 "" H 3950 2600 50  0001 C CNN
	1    3950 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 2600 3950 2750
Wire Wire Line
	3950 2750 4100 2750
$Comp
L power:GND #PWR0105
U 1 1 5E4EEA21
P 3950 2950
F 0 "#PWR0105" H 3950 2700 50  0001 C CNN
F 1 "GND" H 3955 2777 50  0000 C CNN
F 2 "" H 3950 2950 50  0001 C CNN
F 3 "" H 3950 2950 50  0001 C CNN
	1    3950 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 2950 3950 2950
$Comp
L Device:R R2
U 1 1 5E4EEF3F
P 5000 2900
F 0 "R2" H 4931 2854 50  0000 R CNN
F 1 "470" H 4950 2950 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4930 2900 50  0001 C CNN
F 3 "~" H 5000 2900 50  0001 C CNN
	1    5000 2900
	1    0    0    1   
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 5E4EF82E
P 5300 2650
F 0 "#PWR0106" H 5300 2500 50  0001 C CNN
F 1 "+5V" H 5315 2823 50  0000 C CNN
F 2 "" H 5300 2650 50  0001 C CNN
F 3 "" H 5300 2650 50  0001 C CNN
	1    5300 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5E4F0F9B
P 5150 2650
F 0 "#PWR0107" H 5150 2400 50  0001 C CNN
F 1 "GND" H 5155 2477 50  0000 C CNN
F 2 "" H 5150 2650 50  0001 C CNN
F 3 "" H 5150 2650 50  0001 C CNN
	1    5150 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 2650 5150 2650
Wire Wire Line
	5000 3050 5300 3050
Wire Wire Line
	5300 3050 5300 2650
$Comp
L PTL45-15O1-503B2:PTL45-15O1-503B2 J3
U 1 1 5E4F849E
P 4100 3500
F 0 "J3" H 4550 3765 50  0000 C CNN
F 1 "Slider_1" H 4550 3674 50  0000 C CNN
F 2 "PTL45-10O1-503B2:PTL4515O1503B2" H 4850 3600 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/PTL45-15O1-503B2.pdf" H 4850 3500 50  0001 L CNN
F 4 "Slide Potentiometers 50Kohms Travel=45mm Center Detent" H 4850 3400 50  0001 L CNN "Description"
F 5 "23" H 4850 3300 50  0001 L CNN "Height"
F 6 "652-PTL45-15O1-503B2" H 4850 3200 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=652-PTL45-15O1-503B2" H 4850 3100 50  0001 L CNN "Mouser Price/Stock"
F 8 "Bourns" H 4850 3000 50  0001 L CNN "Manufacturer_Name"
F 9 "PTL45-15O1-503B2" H 4850 2900 50  0001 L CNN "Manufacturer_Part_Number"
	1    4100 3500
	1    0    0    -1  
$EndComp
Text Label 4100 3500 2    50   ~ 0
A1
NoConn ~ 4100 3700
$Comp
L power:+5V #PWR0108
U 1 1 5E4F84A6
P 3950 3450
F 0 "#PWR0108" H 3950 3300 50  0001 C CNN
F 1 "+5V" H 3965 3623 50  0000 C CNN
F 2 "" H 3950 3450 50  0001 C CNN
F 3 "" H 3950 3450 50  0001 C CNN
	1    3950 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 3450 3950 3600
Wire Wire Line
	3950 3600 4100 3600
$Comp
L power:GND #PWR0109
U 1 1 5E4F84AE
P 3950 3800
F 0 "#PWR0109" H 3950 3550 50  0001 C CNN
F 1 "GND" H 3955 3627 50  0000 C CNN
F 2 "" H 3950 3800 50  0001 C CNN
F 3 "" H 3950 3800 50  0001 C CNN
	1    3950 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3800 3950 3800
$Comp
L Device:R R3
U 1 1 5E4F84B5
P 5000 3750
F 0 "R3" H 4931 3704 50  0000 R CNN
F 1 "470" H 4950 3800 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4930 3750 50  0001 C CNN
F 3 "~" H 5000 3750 50  0001 C CNN
	1    5000 3750
	1    0    0    1   
$EndComp
$Comp
L power:+5V #PWR0110
U 1 1 5E4F84BB
P 5300 3500
F 0 "#PWR0110" H 5300 3350 50  0001 C CNN
F 1 "+5V" H 5315 3673 50  0000 C CNN
F 2 "" H 5300 3500 50  0001 C CNN
F 3 "" H 5300 3500 50  0001 C CNN
	1    5300 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5E4F84C1
P 5150 3500
F 0 "#PWR0111" H 5150 3250 50  0001 C CNN
F 1 "GND" H 5155 3327 50  0000 C CNN
F 2 "" H 5150 3500 50  0001 C CNN
F 3 "" H 5150 3500 50  0001 C CNN
	1    5150 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 3500 5150 3500
Wire Wire Line
	5000 3900 5300 3900
Wire Wire Line
	5300 3900 5300 3500
$Comp
L PTL45-15O1-503B2:PTL45-15O1-503B2 J4
U 1 1 5E4FCA34
P 4100 4350
F 0 "J4" H 4550 4615 50  0000 C CNN
F 1 "Slider_0" H 4550 4524 50  0000 C CNN
F 2 "PTL45-10O1-503B2:PTL4515O1503B2" H 4850 4450 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/PTL45-15O1-503B2.pdf" H 4850 4350 50  0001 L CNN
F 4 "Slide Potentiometers 50Kohms Travel=45mm Center Detent" H 4850 4250 50  0001 L CNN "Description"
F 5 "23" H 4850 4150 50  0001 L CNN "Height"
F 6 "652-PTL45-15O1-503B2" H 4850 4050 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=652-PTL45-15O1-503B2" H 4850 3950 50  0001 L CNN "Mouser Price/Stock"
F 8 "Bourns" H 4850 3850 50  0001 L CNN "Manufacturer_Name"
F 9 "PTL45-15O1-503B2" H 4850 3750 50  0001 L CNN "Manufacturer_Part_Number"
	1    4100 4350
	1    0    0    -1  
$EndComp
Text Label 4100 4350 2    50   ~ 0
A0
NoConn ~ 4100 4550
$Comp
L power:+5V #PWR0112
U 1 1 5E4FCA3C
P 3950 4300
F 0 "#PWR0112" H 3950 4150 50  0001 C CNN
F 1 "+5V" H 3965 4473 50  0000 C CNN
F 2 "" H 3950 4300 50  0001 C CNN
F 3 "" H 3950 4300 50  0001 C CNN
	1    3950 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 4300 3950 4450
Wire Wire Line
	3950 4450 4100 4450
$Comp
L power:GND #PWR0113
U 1 1 5E4FCA44
P 3950 4650
F 0 "#PWR0113" H 3950 4400 50  0001 C CNN
F 1 "GND" H 3955 4477 50  0000 C CNN
F 2 "" H 3950 4650 50  0001 C CNN
F 3 "" H 3950 4650 50  0001 C CNN
	1    3950 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4650 3950 4650
$Comp
L Device:R R4
U 1 1 5E4FCA4B
P 5000 4600
F 0 "R4" H 4931 4554 50  0000 R CNN
F 1 "470" H 4950 4650 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4930 4600 50  0001 C CNN
F 3 "~" H 5000 4600 50  0001 C CNN
	1    5000 4600
	1    0    0    1   
$EndComp
$Comp
L power:+5V #PWR0114
U 1 1 5E4FCA51
P 5300 4350
F 0 "#PWR0114" H 5300 4200 50  0001 C CNN
F 1 "+5V" H 5315 4523 50  0000 C CNN
F 2 "" H 5300 4350 50  0001 C CNN
F 3 "" H 5300 4350 50  0001 C CNN
	1    5300 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5E4FCA57
P 5150 4350
F 0 "#PWR0115" H 5150 4100 50  0001 C CNN
F 1 "GND" H 5155 4177 50  0000 C CNN
F 2 "" H 5150 4350 50  0001 C CNN
F 3 "" H 5150 4350 50  0001 C CNN
	1    5150 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 4350 5150 4350
Wire Wire Line
	5000 4750 5300 4750
Wire Wire Line
	5300 4750 5300 4350
$Comp
L Connector:Conn_01x04_Female J1
U 1 1 5E4FD344
P 3300 2150
F 0 "J1" V 3350 2050 50  0000 L CNN
F 1 "I2C_Conn" V 3450 1950 50  0000 L CNN
F 2 "Connector_JST:JST_PH_B4B-PH-K_1x04_P2.00mm_Vertical" H 3300 2150 50  0001 C CNN
F 3 "~" H 3300 2150 50  0001 C CNN
	1    3300 2150
	0    -1   1    0   
$EndComp
Text Label 3200 1950 1    50   ~ 0
SCL
Text Label 3300 1950 1    50   ~ 0
SDA
$Comp
L power:+5V #PWR0116
U 1 1 5E5000A9
P 3400 1950
F 0 "#PWR0116" H 3400 1800 50  0001 C CNN
F 1 "+5V" H 3415 2123 50  0000 C CNN
F 2 "" H 3400 1950 50  0001 C CNN
F 3 "" H 3400 1950 50  0001 C CNN
	1    3400 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 5E5011AB
P 3650 1950
F 0 "#PWR0117" H 3650 1700 50  0001 C CNN
F 1 "GND" H 3655 1777 50  0000 C CNN
F 2 "" H 3650 1950 50  0001 C CNN
F 3 "" H 3650 1950 50  0001 C CNN
	1    3650 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 1950 3650 1950
$Comp
L Mechanical:MountingHole H1
U 1 1 5E4FC891
P 6000 1500
F 0 "H1" H 6100 1546 50  0000 L CNN
F 1 "MountingHole" H 6100 1455 50  0000 L CNN
F 2 "MountingHole:MountingHole_2mm" H 6000 1500 50  0001 C CNN
F 3 "~" H 6000 1500 50  0001 C CNN
	1    6000 1500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5E4FD6F0
P 6800 1500
F 0 "H3" H 6900 1546 50  0000 L CNN
F 1 "MountingHole" H 6900 1455 50  0000 L CNN
F 2 "MountingHole:MountingHole_2mm" H 6800 1500 50  0001 C CNN
F 3 "~" H 6800 1500 50  0001 C CNN
	1    6800 1500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5E4FE24C
P 6000 2000
F 0 "H2" H 6100 2046 50  0000 L CNN
F 1 "MountingHole" H 6100 1955 50  0000 L CNN
F 2 "MountingHole:MountingHole_2mm" H 6000 2000 50  0001 C CNN
F 3 "~" H 6000 2000 50  0001 C CNN
	1    6000 2000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5E4FEC10
P 6800 2000
F 0 "H4" H 6900 2046 50  0000 L CNN
F 1 "MountingHole" H 6900 1955 50  0000 L CNN
F 2 "MountingHole:MountingHole_2mm" H 6800 2000 50  0001 C CNN
F 3 "~" H 6800 2000 50  0001 C CNN
	1    6800 2000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J5
U 1 1 5E532563
P 4100 2150
F 0 "J5" V 4050 2200 50  0000 R CNN
F 1 "LED_Input" V 3950 2300 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 4100 2150 50  0001 C CNN
F 3 "~" H 4100 2150 50  0001 C CNN
	1    4100 2150
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0118
U 1 1 5E5347A7
P 4100 1950
F 0 "#PWR0118" H 4100 1800 50  0001 C CNN
F 1 "+5V" H 4115 2123 50  0000 C CNN
F 2 "" H 4100 1950 50  0001 C CNN
F 3 "" H 4100 1950 50  0001 C CNN
	1    4100 1950
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 5E534F9F
P 3850 1950
F 0 "#PWR0119" H 3850 1700 50  0001 C CNN
F 1 "GND" H 3855 1777 50  0000 C CNN
F 2 "" H 3850 1950 50  0001 C CNN
F 3 "" H 3850 1950 50  0001 C CNN
	1    3850 1950
	1    0    0    -1  
$EndComp
Text Label 4200 1950 1    50   ~ 0
D7
Wire Wire Line
	4000 1950 3850 1950
$Comp
L power:+5V #PWR?
U 1 1 5E6DDD61
P 2150 4300
F 0 "#PWR?" H 2150 4150 50  0001 C CNN
F 1 "+5V" V 2165 4428 50  0000 L CNN
F 2 "" H 2150 4300 50  0001 C CNN
F 3 "" H 2150 4300 50  0001 C CNN
	1    2150 4300
	0    -1   -1   0   
$EndComp
$EndSCHEMATC