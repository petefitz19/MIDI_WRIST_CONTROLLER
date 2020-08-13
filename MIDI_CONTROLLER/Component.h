#ifndef Component_h
#define Component_h

#include <Arduino.h>
#include <Wire.h>

class Component{
  private:

  public:
    uint8_t _command;
    uint8_t _param1;
    uint8_t _param2;
    uint8_t _channel;

    uint8_t _value;
    uint8_t update_val = 1;
    
    Component();
    Component(uint8_t command, uint8_t param1, uint8_t param2, uint8_t channel);
    uint8_t get_Command();
    uint8_t get_Param1();
    uint8_t get_Param2();
    uint8_t get_Channel();
    void set_Component(uint8_t command, uint8_t param1, uint8_t param2, uint8_t channel);
};

class Neotrellis : public Component{
  private:
  
  public:
    uint8_t toggle = 0;
};

class Encoder : public Component{
  private:

  public:
  uint8_t _prev_val;
};

class Slider : public Component{
  private:

  public:
  uint8_t _prev_val;
};

class Forearm{
  private:

  public:
  Forearm(Slider* s1, Slider* s2, Slider* s3);
  void begin();
  void read();
  Slider* _s1;
  Slider* _s2;
  Slider* _s3;
};

class Trackball : public Component{
  private:
    uint8_t TADDR = 0x0A;
    uint8_t REG_LED_RED = 0x00;
    uint8_t REG_LED_GRN = 0x01;
    uint8_t REG_LED_BLU = 0x02;
    uint8_t REG_LED_WHT = 0x03;
    uint8_t REG_LEFT = 0x04;
    
  public:
    void begin();
    void read();
    
    int _yvalue;
    int _xvalue;
    int _x_prev_val;
    int _y_prev_val;
    uint8_t _switch;
};

class Button : public Component{
  private:
  
  public:
    uint8_t toggle = 0;
};

class ButtonEncoder{
  private:
  
  public: 
  ButtonEncoder(Encoder* e1, Button* b1, Encoder* e2, Button* b2);
  void begin();
  void read();
  Encoder* _e1;
  Button* _b1;
  Encoder* _e2;
  Button* _b2;
  uint8_t button_mask;
  uint8_t prev_button_mask;
  
  uint8_t update_val = 1;
};

class Gyroscope : public Component{
  private:
  
  public:
  void begin();
  void read();

  uint8_t _xvalue;
  uint8_t _yvalue;
  uint8_t _x_prev_val;
  uint8_t _y_prev_val;
};
#endif
