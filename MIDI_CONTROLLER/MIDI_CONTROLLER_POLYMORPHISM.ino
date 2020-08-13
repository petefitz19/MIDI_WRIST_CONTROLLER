#include "Component.h"
#include "EERAM.h"
#include "MIDIUSB.h"
#include <MIDI.h>
#include <SoftwareSerial.h> 
#include "Adafruit_ILI9341.h" 
#include "Adafruit_NeoTrellis.h"

#define C_SIZE 34

#define TFT_DC 10              
#define TFT_CS 8            
#define TFT_RST 9
#define TFT_MISO 14         
#define TFT_MOSI 16          
#define TFT_CLK 15
Adafruit_ILI9341 tft = Adafruit_ILI9341(TFT_CS, TFT_DC, TFT_MOSI, TFT_CLK, TFT_RST, TFT_MISO);

Adafruit_NeoTrellis trellis;

SoftwareSerial swSerial(0, 1); // RX, TX

MIDI_CREATE_INSTANCE(SoftwareSerial, swSerial, MIDI1);

EERAM ram;
uint8_t read_buf[4];
int read_addr = 0;
uint8_t write_arr[4];
int write_addr = 0;
int bank_num = 0;

uint8_t gyro_on = 0;

/* Initialization of the user writable midi components */
Neotrellis n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16;
Slider s1, s2, s3;
Encoder e1, e2;
Button p1, p2;
Trackball t1, t2;
Gyroscope g1;
Button b1, b2, b3, b4, b5, b6, b7, b8;

/* Components grouped into specific sections */
ButtonEncoder button_encoder(&e1, &b1, &e2, &b2);
Forearm forearm(&s1, &s2, &s3);

/* Component Array: Useful in memory reading and writing */
Component *components[C_SIZE] = {
  &n1, &n2, &n3, &n4, &n5, &n6, &n7, &n8,
  &n9, &n10, &n11, &n12, &n13, &n14, &n15, &n16,
  &s1, &s2, &s3, 
  &e1, &e2, &p1, &p2,
  &t1, &t2,
  &g1,
  &b1, &b2, &b3, &b4, &b5, &b6, &b7, &b8
};

void setup() {
  Serial.begin(9600);
  ram.begin();                    // Init EEPRAM
  ram.setAutoStore(true);
  load_bank();                    // Assign component values to the initialized Component objects from memory
  MIDI1.begin(MIDI_CHANNEL_OFF);  // Init MIDI1
  forearm.begin();                // Init forearm (This is only Wire.begin(), maybe delete and group all with a single call)
  t1.begin();                     // Init the first trackball, REMEMBER to add for t2
  button_encoder.begin();         // Init the button/encoder section
  g1.begin();                     // Init the gyroscope
  trellis.begin(0x2E);            // Init the neotrellis matrix at address 0x2E
  trellis_startup();              // Display the startup sequence for the neotrellis matrix
  tft_startup();                  // Load the startup display for the tft
  updateDisplay();                // Update the display to the current component values
}

uint8_t test_arr[6];
void loop() {
  if(Serial.available()){
    if(Serial.readBytes(test_arr, 6) == 6){
      write_addr = (test_arr[0] * 200) + (test_arr[1] * 4);
      for(int i = 0; i< 4; i++){
        write_arr[i] = test_arr[i + 2];
      }
      ram.write(write_addr, write_arr, 4);
      if(bank_num == test_arr[0]){
        components[test_arr[1]]->set_Component(test_arr[2], test_arr[3], test_arr[4], test_arr[5]);
      }
    }
  }
  trellis.read();
  //t1.read();
  //Trackball1_sendMIDI();
  //forearm.read();
  //Forearm_sendMIDI();
  button_encoder.read();
  ButtonEncoder_sendMIDI();
  if(gyro_on){
    g1.read();
    Gyroscope_sendMIDI();
  }
}

void updateDisplay(){   //Note, give each sendMIDI function an update flag and update in here accordingly to reduce latency of midi signal
    if(t1.update_val==1){
      tft.fillCircle(210+map(t1._x_prev_val, 0, 127, 0, 82), 17+map(t1._y_prev_val, 0, 127, 0, 82), 5, ILI9341_BLACK);
      tft.fillCircle(210+map(t1._xvalue, 0, 127, 0, 82), 17+map(t1._yvalue, 0, 127, 0, 82), 5, ILI9341_GREEN);
      t1.update_val = 0;
    }
    if(t2.update_val==1){
      tft.fillCircle(210+map(t2._x_prev_val, 0, 127, 0, 82), 127+map(t2._y_prev_val, 0, 127, 0, 82), 5, ILI9341_BLACK);
      tft.fillCircle(210+map(t2._xvalue, 0, 127, 0, 82), 127+map(t1._yvalue, 0, 127, 0, 82), 5, ILI9341_GREEN);
      t2.update_val = 0;
    }
    if(s1.update_val == 1){
      if(s1._prev_val < s1._value){
        tft.fillRect(11, 11, s1._value, 8, ILI9341_WHITE);
      }
      else if(s1._prev_val > s1._value){
        tft.fillRect(11+s1._value, 11, 125-s1._value, 8, ILI9341_BLACK);
      }
      s1.update_val = 0;
    }
    if(s2.update_val==1){
      if(s2._prev_val < s2._value){
        tft.fillRect(11, 41, s2._value, 8, ILI9341_WHITE);
      }
      else if(s2._prev_val > s2._value){
        tft.fillRect(11+s2._value, 41, 125-s2._value, 8, ILI9341_BLACK);
      }
      s2.update_val = 0;
    }
    if(s3.update_val==1){
      if(s3._prev_val < s3._value){
        tft.fillRect(11, 71, s3._value, 8, ILI9341_WHITE);
      }
      else if(s3._prev_val > s3._value){
        tft.fillRect(11+s3._value, 71, 125-s3._value, 8, ILI9341_BLACK);
      }
      s3.update_val = 0;
    }
    if(button_encoder.update_val == 1){
      tft.fillRect(90, 100, 15, 15, ILI9341_BLACK);
      tft.setCursor(90, 100);
      tft.print(bank_num);
      button_encoder.update_val = 0;
    }
    if(button_encoder.update_val == 2){
      tft.fillRect(90, 120, 36, 15, ILI9341_BLACK);
      tft.setCursor(90, 120);
      if(gyro_on)
        tft.print("ON");
      else
        tft.print("OFF");
      button_encoder.update_val = 0;
    }
}

void Trackball1_sendMIDI(){
  if(t1._x_prev_val != t1._xvalue){
    MIDI1.sendControlChange(t1.get_Param1(), t1._xvalue, t1.get_Channel());
    MIDIUSB_CC(t1.get_Channel(),t1.get_Param1(),t1._xvalue);
    MidiUSB.flush();
    t1.update_val = 1;
    updateDisplay();
  }
  else if(t1._y_prev_val != t1._yvalue){
    MIDI1.sendControlChange(t1.get_Param2(), t1._yvalue, t1.get_Channel());
    MIDIUSB_CC(t1.get_Channel(),t1.get_Param2(),t1._yvalue);
    MidiUSB.flush();
    t1.update_val = 1;
    updateDisplay();
  }
  t1._x_prev_val = t1._xvalue;
  t1._y_prev_val = t1._yvalue;
}

void Forearm_sendMIDI(){
  if((s1._value >= s1._prev_val + 2) || (s1._value <= s1._prev_val - 2)){
    MIDI1.sendControlChange(s1.get_Command(), s1._value, s1.get_Channel());
    MIDIUSB_CC(s1.get_Channel(),s1.get_Command(),s1._value);
    MidiUSB.flush();
    s1.update_val = 1;
    updateDisplay();
    s1._prev_val = s1._value;
  }
  if((s2._value >= s2._prev_val + 2) || (s2._value <= s2._prev_val - 2)){
    MIDI1.sendControlChange(s2.get_Command(), s2._value, s2.get_Channel());
    MIDIUSB_CC(s2.get_Channel(),s2.get_Command(),s2._value);
    MidiUSB.flush();
    s2.update_val = 1;
    updateDisplay();
    s2._prev_val = s2._value;
  }
  if((s3._value >= s3._prev_val + 2) || (s3._value <= s3._prev_val - 2)){
    MIDI1.sendControlChange(s3.get_Command(), s3._value, s3.get_Channel());
    MIDIUSB_CC(s3.get_Channel(),s3.get_Command(),s3._value);
    MidiUSB.flush();
    s3.update_val = 1;
    updateDisplay();
    s3._prev_val = s3._value;
  }
}

void ButtonEncoder_sendMIDI(){
  if(e1._prev_val != e1._value){
    MIDI1.sendControlChange(e1.get_Command(), e1._value, e1.get_Channel());
    MIDIUSB_CC(e1.get_Channel(),e1.get_Command(),e1._value);
    MidiUSB.flush();
    e1.update_val = 1;
    //updateDisplay();
    e1._prev_val = e1._value;
  }
  if(e2._prev_val != e2._value){
    MIDI1.sendControlChange(e2.get_Command(), e2._value, e2.get_Channel());
    MIDIUSB_CC(e2.get_Channel(), e2.get_Command(),e2._value);
    MidiUSB.flush();
    e2.update_val = 1;
    //updateDisplay();
    e2._prev_val = e2._value;
  }
  if(button_encoder.button_mask != button_encoder.prev_button_mask){
    if(button_encoder.button_mask == 0b11111101){
      bank_num--;
      if(bank_num > 9){
        bank_num = 0;
      }
      if(bank_num < 0){
        bank_num = 9;
      }
      button_encoder.prev_button_mask = button_encoder.button_mask;
      read_addr = bank_num*200;
      button_encoder.update_val = 1;
      load_bank();
      updateDisplay();
    }
    else if(button_encoder.button_mask == 0b11111110){
      bank_num++;
      if(bank_num > 9){
        bank_num = 0;
      }
      if(bank_num < 0){
        bank_num = 9;
      }
      button_encoder.prev_button_mask = button_encoder.button_mask;
      read_addr = bank_num*200;
      button_encoder.update_val = 1;
      load_bank();
      updateDisplay();
    }
    else if(button_encoder.button_mask == 0b11111011){
      if(gyro_on){
        gyro_on = 0;
      }
      else{
        gyro_on = 1;
      }
      button_encoder.update_val = 2;
      updateDisplay();
    }
    else{
//      MIDI1.sendControlChange(buttons[0].Bcommand, buttons[0].Bvalue, buttons[0].Bchannel);
//      MIDIUSB_CC(buttons[0].Bchannel, buttons[0].Bcommand, buttons[0].Bvalue);
//      MidiUSB.flush();
      button_encoder.prev_button_mask = button_encoder.button_mask;
    }
    button_encoder.prev_button_mask = button_encoder.button_mask;
  }
}

void Gyroscope_sendMIDI(){
  if((g1._xvalue >= g1._x_prev_val + 2) || (g1._xvalue <= g1._x_prev_val - 2)){
    MIDI1.sendControlChange(g1.get_Param1(), g1._xvalue, g1.get_Channel());
    MIDIUSB_CC(g1.get_Channel(),g1.get_Param1(),g1._xvalue);
    MidiUSB.flush();
    g1.update_val = 1;
  }
  else if((g1._yvalue >= g1._y_prev_val + 2) || (g1._yvalue <= g1._y_prev_val - 2)){
    MIDI1.sendControlChange(g1.get_Param2(), g1._yvalue, g1.get_Channel());
    MIDIUSB_CC(g1.get_Channel(),g1.get_Param2(),g1._yvalue);
    MidiUSB.flush();
    g1.update_val = 1;
  }
  g1._x_prev_val = g1._xvalue;
  g1._y_prev_val = g1._yvalue;
}

void load_bank(){
  for(int i = 0; i < C_SIZE; i++){
    ram.read(read_addr, read_buf, 4);
    components[i]->set_Component(read_buf[0], read_buf[1], read_buf[2], read_buf[3]);
    read_addr += 4;
  }
}

// Input a value 0 to 255 to get a color value.
// The colors are a transition r - g - b - back to r.
uint32_t Wheel(byte WheelPos) {
  if(WheelPos < 85) {
   return trellis.pixels.Color(WheelPos * 3, 255 - WheelPos * 3, 0);
  } else if(WheelPos < 170) {
   WheelPos -= 85;
   return trellis.pixels.Color(255 - WheelPos * 3, 0, WheelPos * 3);
  } else {
   WheelPos -= 170;
   return trellis.pixels.Color(0, WheelPos * 3, 255 - WheelPos * 3);
  }
  return 0;
}

void trellis_startup(){
  //activate all keys and set callbacks
  for(int i=0; i<NEO_TRELLIS_NUM_KEYS; i++){
    trellis.activateKey(i, SEESAW_KEYPAD_EDGE_RISING);
    trellis.activateKey(i, SEESAW_KEYPAD_EDGE_FALLING);
    trellis.registerCallback(i, knuckleTrellis_blink);
  }

  //do a little animation to show we're on
  for (uint16_t i=0; i<trellis.pixels.numPixels(); i++) {
    trellis.pixels.setPixelColor(i, Wheel(map(i, 0, trellis.pixels.numPixels(), 0, 255)));
    trellis.pixels.show();
    delay(50);
  }
  for (uint16_t i=0; i<trellis.pixels.numPixels(); i++) {
    trellis.pixels.setPixelColor(i, 0x000000);
    trellis.pixels.show();
    delay(50);
  }
}

//TODO: Make Sure this works on the original board
TrellisCallback knuckleTrellis_blink(keyEvent evt){
  // Check is the pad pressed?
  if (evt.bit.EDGE == SEESAW_KEYPAD_EDGE_RISING) {
    trellis.pixels.setPixelColor(evt.bit.NUM, Wheel(map(evt.bit.NUM, 0, trellis.pixels.numPixels(), 0, 255))); //on rising
    switch(components[evt.bit.NUM]->get_Command()){
      case 0:
        MIDI1.sendNoteOn(components[evt.bit.NUM]->get_Param1(), components[evt.bit.NUM]->get_Param2(), components[evt.bit.NUM]->get_Channel());
        MIDIUSB_noteOn(components[evt.bit.NUM]->get_Channel(),components[evt.bit.NUM]->get_Param1(),components[evt.bit.NUM]->get_Param2());
        MidiUSB.flush();
        break;
      case 1:
        MIDI1.sendControlChange(components[evt.bit.NUM]->get_Param1(), components[evt.bit.NUM]->get_Param2(), components[evt.bit.NUM]->get_Channel());
        MIDIUSB_CC(components[evt.bit.NUM]->get_Channel(),components[evt.bit.NUM]->get_Param1(),components[evt.bit.NUM]->get_Param2());
        MidiUSB.flush();
        break;
      case 2:
        if (((Neotrellis*)components[evt.bit.NUM])->toggle == 0) {
          MIDI1.sendControlChange(components[evt.bit.NUM]->get_Param1(), 127, components[evt.bit.NUM]->get_Channel());
          MIDIUSB_CC(components[evt.bit.NUM]->get_Channel(),components[evt.bit.NUM]->get_Param1(), 127);
          MidiUSB.flush();
          ((Neotrellis*)components[evt.bit.NUM])->toggle = 1;
        }
        else if (((Neotrellis*)components[evt.bit.NUM])->toggle == 1) {
          MIDI1.sendControlChange(components[evt.bit.NUM]->get_Param1(), 0, components[evt.bit.NUM]->get_Channel());
          MIDIUSB_CC(components[evt.bit.NUM]->get_Channel(),components[evt.bit.NUM]->get_Param1(), 0);
          MidiUSB.flush();
          ((Neotrellis*)components[evt.bit.NUM])->toggle = 0;
        }
        break;
      case 3:
        MIDI1.sendProgramChange(components[evt.bit.NUM]->get_Param1(), components[evt.bit.NUM]->get_Channel());
        MIDIUSB_PC(components[evt.bit.NUM]->get_Channel(),components[evt.bit.NUM]->get_Param1());
        MidiUSB.flush();
        break;
      default:
        break;
    }
  } else if (evt.bit.EDGE == SEESAW_KEYPAD_EDGE_FALLING) {
    trellis.pixels.setPixelColor(evt.bit.NUM, 0); //off falling
    switch(components[evt.bit.NUM]->get_Command()){
      case 0:
         MIDI1.sendNoteOff(components[evt.bit.NUM]->get_Param1(), components[evt.bit.NUM]->get_Param2(), components[evt.bit.NUM]->get_Channel());
         MIDIUSB_noteOff(components[evt.bit.NUM]->get_Channel(),components[evt.bit.NUM]->get_Param1(),components[evt.bit.NUM]->get_Param2());
         MidiUSB.flush();
         break;
      default:
        break;
    }
  }

  // Turn on/off the neopixels!
  trellis.pixels.show();

  return 0;
}

void tft_startup(){
  tft.begin();
  tft.setRotation(3);

  tft.fillScreen(ILI9341_BLACK);

  // Draws the slider bars
  tft.drawRect(10, 10, 127, 10, ILI9341_WHITE);
  tft.drawRect(10, 40, 127, 10, ILI9341_WHITE);
  tft.drawRect(10, 70, 127, 10, ILI9341_WHITE);

  // Draw the TrackBall Boxes
  tft.drawRect(200, 10, 100, 100, ILI9341_WHITE);
  tft.drawRect(204, 6, 100, 100, ILI9341_WHITE);

  tft.drawRect(200, 120, 100, 100, ILI9341_WHITE);
  tft.drawRect(204, 116, 100, 100, ILI9341_WHITE);

  // Draws the Encoder values
  tft.setTextColor(ILI9341_GREEN);
  tft.setTextSize(2);
  tft.setCursor(145, 10);
  tft.print(127);
  tft.setCursor(145, 40);
  tft.print(127);

  // Write the Bank
  tft.setCursor(20, 100);
  tft.print("BANK:");
  tft.setCursor(20, 120);
  tft.print("GYRO: OFF");
}

void MIDIUSB_noteOn(byte channel, byte pitch, byte velocity) {
  midiEventPacket_t noteOn = {0x09, 0x90 | channel, pitch, velocity};
  MidiUSB.sendMIDI(noteOn);
}

void MIDIUSB_noteOff(byte channel, byte pitch, byte velocity) {
  midiEventPacket_t noteOff = {0x08, 0x80 | channel, pitch, velocity};
  MidiUSB.sendMIDI(noteOff);
}

void MIDIUSB_CC(byte channel, byte control, byte value) {
  midiEventPacket_t cc = {0x0B, 0xB0 | channel, control, value};
  MidiUSB.sendMIDI(cc);
}

void MIDIUSB_PC(byte channel, byte program) {
  midiEventPacket_t pc = {0x0C, 0xC0 | channel, program, 0};
  MidiUSB.sendMIDI(pc);
}
