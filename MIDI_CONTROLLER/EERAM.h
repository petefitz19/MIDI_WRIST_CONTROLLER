#ifndef _EERAM_h
#define _EERAM_h

#if defined(ARDUINO) && ARDUINO >= 100
  #include "arduino.h"
#else
  #include "WProgram.h"
#endif

typedef union {
  uint16_t a16;
  uint8_t a8[2];
}address16b;

class EERAM {
private:
  int8_t SRAM_REGISTER;
  int8_t CONTROL_REGISTER;
  uint8_t readControlRegister();

public:
  
  void begin(const uint8_t A0 = 0, const uint8_t A1 = 0);
  uint8_t write(const uint16_t address, const uint8_t value);
  uint8_t read(const uint16_t address);
  uint8_t store();
  uint8_t recall();
  void setAutoStore(const bool value);
  bool getAutoStore();
  
  uint8_t write(const uint16_t address, const uint8_t* values, const uint16_t size);
  void read(const uint16_t address, uint8_t* values, const uint16_t size);


};
#endif
