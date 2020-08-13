
#include "Component.h"

Component::Component(){
  _command = 0x00;
  _param1 = 0x00;
  _param2 = 0x00;
  _channel = 0x00;
}
Component::Component(uint8_t command, uint8_t param1, uint8_t param2, uint8_t channel){
  _command = command;
  _param1 = param1;
  _param2 = param2;
  _channel = channel;
}

uint8_t Component::get_Command(){
  return _command;
}

uint8_t Component::get_Param1(){
  return _param1;
}

uint8_t Component::get_Param2(){
  return _param2;
}

uint8_t Component::get_Channel(){
  return _channel;
}

void Component::set_Component(uint8_t command, uint8_t param1, uint8_t param2, uint8_t channel){
  _command = command;
  _param1 = param1;
  _param2 = param2;
  _channel = channel;
}

void Trackball::begin(){
  Wire.begin(); // Initiate the Wire library
  Wire.beginTransmission(TADDR);
  Wire.write(REG_LED_WHT);
  Wire.write(0x20);
  Wire.endTransmission();
}

void Trackball::read(){
  Wire.beginTransmission(TADDR); // Begin transmission to the Sensor 
  //Ask the particular registers for data
  Wire.write(REG_LEFT);
  Wire.endTransmission(); // Ends the transmission and transmits the data from the two registers
  
  Wire.requestFrom(TADDR,0x05); // Request the transmitted five bytes from the registers
  
  if(Wire.available()<=5) {  // 
    _yvalue += Wire.read(); // Reads the data from the register
    _yvalue -= Wire.read();   
    _xvalue -= Wire.read();
    _xvalue += Wire.read();
    _switch = Wire.read();
  }

  if(_yvalue < 0){
    _yvalue = 0;
  }
  if(_yvalue > 127){
    _yvalue = 127;
  }
  if(_xvalue < 0){
    _xvalue = 0;
  }
  if(_xvalue > 127){
    _xvalue = 127;
  }
  if(_switch == 128){
    _yvalue = 0;
    _xvalue = 0;
  }
  Wire.beginTransmission(TADDR);
  Wire.write(REG_LED_BLU);
  Wire.write(_yvalue);
  Wire.endTransmission();

  Wire.beginTransmission(TADDR);
  Wire.write(REG_LED_RED);
  Wire.write(_xvalue);
  Wire.endTransmission();
}

Forearm::Forearm(Slider* s1, Slider* s2, Slider* s3){
  _s1 = s1;
  _s2 = s2;
  _s3 = s3;
}

void Forearm::begin(){
  Wire.begin();
}

void Forearm::read(){
  Wire.requestFrom(0x19, 3);  // request 3 bytes from hand section

  if(Wire.available() <= 3) { // slave may send less than requested
    _s1->_value = Wire.read();
    _s2->_value = Wire.read();
    _s3->_value = Wire.read();
  }
}

ButtonEncoder::ButtonEncoder(Encoder* e1, Button* b1, Encoder* e2, Button* b2){
  _e1 = e1;
  _b1 = b1;
  _e2 = e2;
  _b2 = b2;
}

void ButtonEncoder::begin(){
  Wire.begin();
}

void ButtonEncoder::read(){
  Wire.requestFrom(0xAA, 5);  // request 3 bytes from hand section

  if(Wire.available() <= 5) { // slave may send less than requested
    _e1->_value = Wire.read();
    _b1->_value = Wire.read();
    _e2->_value = Wire.read();
    _b2->_value = Wire.read();
    button_mask = Wire.read();
  }
}

void Gyroscope::begin(){
  Wire.begin();
  Wire.beginTransmission(0x68); // Begins a transmission to the I2C slave (GY-521 board)
  Wire.write(0x6B); // PWR_MGMT_1 register
  Wire.write(0); // set to zero (wakes up the MPU-6050)
  Wire.endTransmission(true);
}

void Gyroscope::read(){
  Wire.beginTransmission(0x68);
  Wire.write(0x3B);
  Wire.endTransmission(false);
  Wire.requestFrom(0x68, 2*2, true);
  _xvalue = map(Wire.read()<<8 | Wire.read(), -15352, 16932, 0, 127);
  _yvalue = map(Wire.read()<<8 | Wire.read(), -15352, 16932, 0, 127);
  if(_xvalue > 127){
    _xvalue = 127;
  }
  if(_xvalue < 0){
    _xvalue = 0;
  }
  if(_yvalue > 127){
    _yvalue = 127;
  }
  if(_yvalue < 0){
    _yvalue = 0;
  }
}
