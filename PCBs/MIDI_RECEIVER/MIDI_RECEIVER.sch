EESchema Schematic File Version 4
LIBS:MIDI_RECEIVER-cache
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
L Device:R R1
U 1 1 5DF8321E
P 1050 3100
F 0 "R1" H 1120 3146 50  0000 L CNN
F 1 "R" H 1120 3055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 980 3100 50  0001 C CNN
F 3 "~" H 1050 3100 50  0001 C CNN
	1    1050 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5DF838B5
P 1650 3100
F 0 "R2" H 1720 3146 50  0000 L CNN
F 1 "R" H 1720 3055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 1580 3100 50  0001 C CNN
F 3 "~" H 1650 3100 50  0001 C CNN
	1    1650 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5DF83FA4
P 1350 3150
F 0 "#PWR01" H 1350 2900 50  0001 C CNN
F 1 "GND" H 1355 2977 50  0000 C CNN
F 2 "" H 1350 3150 50  0001 C CNN
F 3 "" H 1350 3150 50  0001 C CNN
	1    1350 3150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 5DF8447E
P 1650 3250
F 0 "#PWR02" H 1650 3100 50  0001 C CNN
F 1 "+5V" H 1665 3423 50  0000 C CNN
F 2 "" H 1650 3250 50  0001 C CNN
F 3 "" H 1650 3250 50  0001 C CNN
	1    1650 3250
	-1   0    0    1   
$EndComp
Text Label 1050 3250 3    50   ~ 0
MIDI_IN
NoConn ~ 1050 2850
NoConn ~ 1650 2850
Text Label 2200 5100 2    50   ~ 0
MIDI_IN
Text Label 3600 4700 0    50   ~ 0
CE
Text Label 3600 4600 0    50   ~ 0
CSN
Text Label 3600 4800 0    50   ~ 0
SCK
Text Label 3600 4900 0    50   ~ 0
MISO
Text Label 3600 5000 0    50   ~ 0
MOSI
$Comp
L power:+5V #PWR06
U 1 1 5DF8C12F
P 3600 4300
F 0 "#PWR06" H 3600 4150 50  0001 C CNN
F 1 "+5V" V 3615 4428 50  0000 L CNN
F 2 "" H 3600 4300 50  0001 C CNN
F 3 "" H 3600 4300 50  0001 C CNN
	1    3600 4300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5DF8C6D2
P 3600 4100
F 0 "#PWR05" H 3600 3850 50  0001 C CNN
F 1 "GND" V 3605 3972 50  0000 R CNN
F 2 "" H 3600 4100 50  0001 C CNN
F 3 "" H 3600 4100 50  0001 C CNN
	1    3600 4100
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5DF8CC15
P 2200 4200
F 0 "#PWR03" H 2200 3950 50  0001 C CNN
F 1 "GND" V 2205 4072 50  0000 R CNN
F 2 "" H 2200 4200 50  0001 C CNN
F 3 "" H 2200 4200 50  0001 C CNN
	1    2200 4200
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5DF8D1E0
P 2200 4300
F 0 "#PWR04" H 2200 4050 50  0001 C CNN
F 1 "GND" V 2205 4172 50  0000 R CNN
F 2 "" H 2200 4300 50  0001 C CNN
F 3 "" H 2200 4300 50  0001 C CNN
	1    2200 4300
	0    1    1    0   
$EndComp
Text Label 4700 2450 0    50   ~ 0
MISO
Text Label 4700 2550 0    50   ~ 0
SCK
Text Label 4700 2650 0    50   ~ 0
CE
Text Label 4200 2650 2    50   ~ 0
CSN
Text Label 4200 2550 2    50   ~ 0
MOSI
NoConn ~ 4200 2450
$Comp
L Device:C C1
U 1 1 5DFC54A8
P 4450 3100
F 0 "C1" V 4702 3100 50  0000 C CNN
F 1 "0.1uF" V 4611 3100 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 4488 2950 50  0001 C CNN
F 3 "~" H 4450 3100 50  0001 C CNN
	1    4450 3100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4200 2750 4200 3100
Wire Wire Line
	4200 3100 4300 3100
Wire Wire Line
	4700 2750 4700 3100
Wire Wire Line
	4700 3100 4600 3100
$Comp
L Regulator_Linear:LD1117S33TR_SOT223 U2
U 1 1 5DFC6E63
P 5850 2350
F 0 "U2" H 5850 2592 50  0000 C CNN
F 1 "LD1117S33TR_SOT223" H 5850 2501 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 5850 2550 50  0001 C CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00000544.pdf" H 5950 2100 50  0001 C CNN
	1    5850 2350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR011
U 1 1 5DFCADB6
P 5550 2350
F 0 "#PWR011" H 5550 2200 50  0001 C CNN
F 1 "+5V" V 5565 2478 50  0000 L CNN
F 2 "" H 5550 2350 50  0001 C CNN
F 3 "" H 5550 2350 50  0001 C CNN
	1    5550 2350
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR013
U 1 1 5DFCC599
P 6150 2350
F 0 "#PWR013" H 6150 2200 50  0001 C CNN
F 1 "+3.3V" V 6165 2478 50  0000 L CNN
F 2 "" H 6150 2350 50  0001 C CNN
F 3 "" H 6150 2350 50  0001 C CNN
	1    6150 2350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5DFCCF82
P 5850 2650
F 0 "#PWR012" H 5850 2400 50  0001 C CNN
F 1 "GND" H 5855 2477 50  0000 C CNN
F 2 "" H 5850 2650 50  0001 C CNN
F 3 "" H 5850 2650 50  0001 C CNN
	1    5850 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR07
U 1 1 5DFCD5B9
P 4200 2750
F 0 "#PWR07" H 4200 2600 50  0001 C CNN
F 1 "+3.3V" V 4215 2878 50  0000 L CNN
F 2 "" H 4200 2750 50  0001 C CNN
F 3 "" H 4200 2750 50  0001 C CNN
	1    4200 2750
	0    -1   -1   0   
$EndComp
Connection ~ 4200 2750
$Comp
L power:GND #PWR010
U 1 1 5DFCDE1C
P 4850 2750
F 0 "#PWR010" H 4850 2500 50  0001 C CNN
F 1 "GND" H 4855 2577 50  0000 C CNN
F 2 "" H 4850 2750 50  0001 C CNN
F 3 "" H 4850 2750 50  0001 C CNN
	1    4850 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 2750 4850 2750
Connection ~ 4700 2750
$Comp
L Device:CP C2
U 1 1 5DFCE79D
P 4450 3850
F 0 "C2" H 4568 3896 50  0000 L CNN
F 1 "10uF" H 4568 3805 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P1.50mm" H 4488 3700 50  0001 C CNN
F 3 "~" H 4450 3850 50  0001 C CNN
	1    4450 3850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR08
U 1 1 5DFCF6CC
P 4450 3700
F 0 "#PWR08" H 4450 3550 50  0001 C CNN
F 1 "+5V" H 4465 3873 50  0000 C CNN
F 2 "" H 4450 3700 50  0001 C CNN
F 3 "" H 4450 3700 50  0001 C CNN
	1    4450 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5DFCFB85
P 4450 4000
F 0 "#PWR09" H 4450 3750 50  0001 C CNN
F 1 "GND" H 4455 3827 50  0000 C CNN
F 2 "" H 4450 4000 50  0001 C CNN
F 3 "" H 4450 4000 50  0001 C CNN
	1    4450 4000
	1    0    0    -1  
$EndComp
$Comp
L Connector:DIN-5_180degree J1
U 1 1 5DFDCE4E
P 1350 2850
F 0 "J1" H 1350 2483 50  0000 C CNN
F 1 "DIN-5_180degree" H 1350 2574 50  0000 C CNN
F 2 "MIDI_jack:Midi_jack" H 1350 2850 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/18/40_c091_abd_e-75918.pdf" H 1350 2850 50  0001 C CNN
	1    1350 2850
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J2
U 1 1 5DFF129B
P 4400 2550
F 0 "J2" H 4450 2867 50  0000 C CNN
F 1 "Conn_02x04_Odd_Even" H 4450 2776 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Vertical" H 4400 2550 50  0001 C CNN
F 3 "~" H 4400 2550 50  0001 C CNN
	1    4400 2550
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 5E006B53
P 2500 1000
F 0 "H1" H 2600 1046 50  0000 L CNN
F 1 "MountingHole" H 2600 955 50  0000 L CNN
F 2 "MountingHole:MountingHole_2mm" H 2500 1000 50  0001 C CNN
F 3 "~" H 2500 1000 50  0001 C CNN
	1    2500 1000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5E0077C5
P 3300 1000
F 0 "H3" H 3400 1046 50  0000 L CNN
F 1 "MountingHole" H 3400 955 50  0000 L CNN
F 2 "MountingHole:MountingHole_2mm" H 3300 1000 50  0001 C CNN
F 3 "~" H 3300 1000 50  0001 C CNN
	1    3300 1000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5E0077FF
P 2500 1300
F 0 "H2" H 2600 1346 50  0000 L CNN
F 1 "MountingHole" H 2600 1255 50  0000 L CNN
F 2 "MountingHole:MountingHole_2mm" H 2500 1300 50  0001 C CNN
F 3 "~" H 2500 1300 50  0001 C CNN
	1    2500 1300
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5E007A15
P 3300 1300
F 0 "H4" H 3400 1346 50  0000 L CNN
F 1 "MountingHole" H 3400 1255 50  0000 L CNN
F 2 "MountingHole:MountingHole_2mm" H 3300 1300 50  0001 C CNN
F 3 "~" H 3300 1300 50  0001 C CNN
	1    3300 1300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J3
U 1 1 5E001CBC
P 5550 4100
F 0 "J3" H 5658 4281 50  0000 C CNN
F 1 "RAW" H 5650 4200 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 5550 4100 50  0001 C CNN
F 3 "~" H 5550 4100 50  0001 C CNN
	1    5550 4100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J4
U 1 1 5E00258F
P 5550 4500
F 0 "J4" H 5658 4681 50  0000 C CNN
F 1 "GND" H 5658 4590 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 5550 4500 50  0001 C CNN
F 3 "~" H 5550 4500 50  0001 C CNN
	1    5550 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5E003FD8
P 5750 4500
F 0 "#PWR0102" H 5750 4250 50  0001 C CNN
F 1 "GND" V 5755 4372 50  0000 R CNN
F 2 "" H 5750 4500 50  0001 C CNN
F 3 "" H 5750 4500 50  0001 C CNN
	1    5750 4500
	0    -1   -1   0   
$EndComp
Text Label 5750 4100 0    50   ~ 0
RAW
Text Label 3600 4000 0    50   ~ 0
RAW
$Comp
L promicro:ProMicro U1
U 1 1 5E8F2FE7
P 2900 4750
F 0 "U1" H 2900 5787 60  0000 C CNN
F 1 "ProMicro" H 2900 5681 60  0000 C CNN
F 2 "promicro:ProMicro" H 3000 3700 60  0001 C CNN
F 3 "" H 3000 3700 60  0000 C CNN
	1    2900 4750
	1    0    0    -1  
$EndComp
$EndSCHEMATC
