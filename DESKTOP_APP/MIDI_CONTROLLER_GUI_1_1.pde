/**
* ControlP5 Textfield
*
*
* find a list of public methods available for the Textfield Controller
* at the bottom of this sketch.
*
* by Andreas Schlegel, 2012
* www.sojamo.de/libraries/controlp5
*
* Use this for examples:
* https://github.com/sojamo/controlp5/blob/master/examples/controllers/ControlP5numberbox/ControlP5numberbox.pde
*
*/


import controlP5.*;
import processing.serial.*;

ControlP5 cp5;
Serial port;

String textValue = "";

int x_offset = 490;
int y_offset = 30;
int item_num, comm, p1, p2, chan, bank_num; //Note if item_num is -1 then there is none pressed, we can use an error message then
String item_type;

enum Commands {
  Note, CC, CCT, PC
};
enum Matrix {
  M01, M02, M03, M04,
  M05, M06, M07, M08,
  M09, M10, M11, M12,
  M13, M14, M15, M16
};
enum Slider {
  S01, S02, S03
};

RadioButton type, matrix, slider, encoder, encoder_button, trackball, gyroscope;
Numberbox channel, param1, param2, bank;
Bang enter;
Textlabel status;

void setup() {
  size(700,410);
  //size(displayWidth, displayHeight);
  surface.setResizable(true);
  
  //printArray(Serial.list());  //prints all available serial ports
  
  port = new Serial(this, "/dev/cu.usbmodemMIDI1", 9600);
  //port = new Serial(this, "/dev/cu.usbserial-1410", 9600);
  
  PFont font = createFont("arial", 20);
  
  cp5 = new ControlP5(this);
  
  status = cp5.addTextlabel("status")
                    .setPosition(230,50)
                    .setFont(createFont("Arial",20))
                    ;
  
  type = cp5.addRadioButton("type")
      .setPosition(20, 50)
      .setSize(40, 40)
      .setItemsPerRow(4)
      .setSpacingColumn(13)
      .addItem("NOTE", 0)
      .addItem("CC", 1)
      .addItem("CC Tog", 2)
      .addItem("PC", 3)
      .align(CENTER, CENTER)
      .activate(0)
      .setNoneSelectedAllowed(true)
      ;
  
  channel = cp5.addNumberbox("channel")
     .setPosition(20,100)
     .setSize(200,40)
     .setValue(0)
     .setRange(0, 15)
     .setScrollSensitivity(.1)
     .setDecimalPrecision(0)
     .setFont(font)
     .align(CENTER, CENTER, CENTER, CENTER)
     ;
  
  final NumberboxInput channel_in = new NumberboxInput(channel);
  channel.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      if (theEvent.getAction()==ControlP5.ACTION_ENTER) { channel_in.setActive( true ); } 
      else if (theEvent.getAction()==ControlP5.ACTION_LEAVE) { channel_in.setActive( false ); channel_in.submit(); }
      else if(theEvent.getAction()==ControlP5.ACTION_PRESS) { channel_in.clearText(); }
    }
  }
  );
     
  param1 = cp5.addNumberbox("param1")
     .setPosition(20,170)
     .setSize(200,40)
     .setValue(0)
     .setLabel("Note")
     .setRange(0, 127)
     .setScrollSensitivity(.1)
     .setDecimalPrecision(0)
     .setFont(font)
     .align(CENTER, CENTER, CENTER, CENTER)
     ;
     
  final NumberboxInput param1_in = new NumberboxInput(param1);
  param1.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      if (theEvent.getAction()==ControlP5.ACTION_ENTER) { param1_in.setActive( true ); } 
      else if (theEvent.getAction()==ControlP5.ACTION_LEAVE) { param1_in.setActive( false ); param1_in.submit(); }
      else if(theEvent.getAction()==ControlP5.ACTION_PRESS) { param1_in.clearText(); }
    }
  }
  );
 
 param2 = cp5.addNumberbox("param2")
     .setPosition(20,240)
     .setSize(200,40)
     .setValue(0)
     .setLabel("Velocity")
     .setRange(0, 127)
     .setScrollSensitivity(.1)
     .setDecimalPrecision(0)
     .setFont(font)
     .align(CENTER, CENTER, CENTER, CENTER)
     ;
     
 final NumberboxInput param2_in = new NumberboxInput(param2);
  param2.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      if (theEvent.getAction()==ControlP5.ACTION_ENTER) { param2_in.setActive( true ); } 
      else if (theEvent.getAction()==ControlP5.ACTION_LEAVE) { param2_in.setActive( false ); param2_in.submit(); }
      else if(theEvent.getAction()==ControlP5.ACTION_PRESS) { param2_in.clearText(); }
    }
  }
  );

 bank = cp5.addNumberbox("bank")
     .setPosition(20, 310)
     .setSize(200, 40)
     .setValue(0)
     .setRange(0, 9)
     .setScrollSensitivity(.1)
     .setDecimalPrecision(0)
     .setFont(font)
     .align(CENTER, CENTER, CENTER, CENTER)
     ;
     
  final NumberboxInput bank_in = new NumberboxInput(bank);
  bank.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      if (theEvent.getAction()==ControlP5.ACTION_ENTER) { bank_in.setActive( true ); } 
      else if (theEvent.getAction()==ControlP5.ACTION_LEAVE) { bank_in.setActive( false ); bank_in.submit(); }
      else if(theEvent.getAction()==ControlP5.ACTION_PRESS) { bank_in.clearText(); }
    }
  }
  );
     
  enter = cp5.addBang("enter")
      .setPosition(240, 170)
      .setSize(80, 40)
      .align(CENTER,CENTER, CENTER, CENTER)
      ;
      
  matrix = cp5.addRadioButton("matrix")
      .setPosition(x_offset, y_offset)
      .setSize(40, 40)
      .setItemsPerRow(4)
      .setSpacingColumn(10)
      .setSpacingRow(10)
      .align(CENTER, CENTER)
      ;
  for(int i = 0; i < 16; i++){
     matrix.addItem("" + Matrix.values()[i], i); 
  matrix.activate(0);
  }
  
  slider = cp5.addRadioButton("slider")
    .setPosition(x_offset, y_offset+250)
    .setSize(190,20)
    .setSpacingRow(10)
    .align(CENTER, CENTER)
    ;
    for(int i = 0; i < 3; i++){
     slider.addItem("" + Slider.values()[i], i); 
  }
  
  encoder = cp5.addRadioButton("encoder")
    .setPosition(x_offset+100, y_offset+220)
    .setSize(40, 20)
    .setItemsPerRow(2)
    .setSpacingColumn(10)
    .align(CENTER, CENTER)
    .addItem("E01", 0)
    .addItem("E02", 1)
    ;
    
  encoder_button = cp5.addRadioButton("encoder_button")
    .setPosition(x_offset+110, y_offset+200)
    .setSize(20, 18)
    .setItemsPerRow(2)
    .setSpacingColumn(30)
    .align(CENTER, CENTER)
    .addItem("P01", 0)
    .addItem("P02", 1)
    ;
    
  trackball = cp5.addRadioButton("trackball")
    .setPosition(x_offset-75, y_offset+200)
    .setSize(60, 40)
    .setItemsPerRow(2)
    .setSpacingColumn(30)
    .align(CENTER, CENTER)
    .addItem("T02", 0)
    .addItem("T01", 1)
    ;
    
   gyroscope = cp5.addRadioButton("gyroscope")
    .setPosition(x_offset-75, y_offset+70)
    .setSize(50, 50)
    .setItemsPerRow(1)
    .align(CENTER, CENTER)
    .addItem("G01", 0)
    ;
}

void draw() {
  background(0);
  fill(255);
  text(textValue.toUpperCase(), 300,80);
}

void enter(){
  comm = (int)cp5.get(RadioButton.class,"type").getValue();
  p1 = (int)cp5.get(Numberbox.class,"param1").getValue();
  p2 = (int)cp5.get(Numberbox.class,"param2").getValue();
  chan = (int)cp5.get(Numberbox.class,"channel").getValue();
  bank_num = (int)cp5.get(Numberbox.class,"bank").getValue();
  if(item_num == -1){
    println("Please select a component");
  }
  else if(comm == -1){
    println("Please Select a Command");
  }
  else{
    port.write(bank_num);
    port.write(item_num);
    port.write(comm);
    port.write(p1);
    port.write(p2);
    port.write(chan);
    String s = "ITEM NUM: " + item_num + "\n";
    s += "COMMAND: " + Commands.values()[comm] + "\n";
    s += "PARAM 1: " + p1 + "\n";
    s += "PARAM 2: " + p2 + "\n";
    s += "CHANNEL: " + chan;
    status.setText(s);
  }
}

void matrix(int a) {
  type.getItem(0).show();
  type.getItem(1).show();
  type.getItem(2).show();
  type.getItem(3).show();
  param1.setLabel("Note");
  param2.setLabel("Velocity");
  slider.deactivateAll();
  encoder.deactivateAll();
  encoder_button.deactivateAll();
  trackball.deactivateAll();
  gyroscope.deactivateAll();
  item_num = (byte)a;
}

void slider(int a){
  type.getItem(0).hide();
  type.getItem(1).show();
  type.getItem(2).hide();
  type.getItem(3).hide();
  type.activate(1);
  param1.setLabel("Number");
  param2.setLabel("Range");
  param2.setValue(127);
  matrix.deactivateAll();
  encoder.deactivateAll();
  encoder_button.deactivateAll();
  trackball.deactivateAll();
  gyroscope.deactivateAll();
  if(a == -1){
    item_num = -1;
  }
  else{
    item_num = 16 + a; 
  }
}

void encoder(int a){
  type.getItem(0).hide();
  type.getItem(1).show();
  type.getItem(2).hide();
  type.getItem(3).hide();
  type.activate(1);
  param1.setLabel("Number");
  param2.setLabel("Tick");
  matrix.deactivateAll();
  slider.deactivateAll();
  encoder_button.deactivateAll();
  trackball.deactivateAll();
  gyroscope.deactivateAll();
  if(a == -1){
    item_num = -1;
  }
  else{
    item_num = 19 + a;
  }
}

void encoder_button(int a){
  type.getItem(0).show();
  type.getItem(1).show();
  type.getItem(2).show();
  type.getItem(3).show();
  param1.setLabel("Number");
  param2.setLabel("Value");
  matrix.deactivateAll();
  slider.deactivateAll();
  encoder.deactivateAll();
  trackball.deactivateAll();
  gyroscope.deactivateAll();
  if(a == -1){
    item_num = -1;
  }
  else{
    item_num = 21 + a;
  }
}

void trackball(int a){
  type.getItem(0).hide();
  type.getItem(1).show();
  type.getItem(2).hide();
  type.getItem(3).hide();
  type.activate(1);
  param1.setLabel("X Number");
  param2.setLabel("Y Number");
  matrix.deactivateAll();
  slider.deactivateAll();
  encoder.deactivateAll();
  encoder_button.deactivateAll();
  gyroscope.deactivateAll();
  if(a == -1){
    item_num = -1;
  }
  else{
    item_num = 23 + 1 - a;
    println(item_num);
  }
}

void gyroscope(int a){
  type.getItem(0).hide();
  type.getItem(1).show();
  type.getItem(2).hide();
  type.getItem(3).hide();
  type.activate(1);
  param1.setLabel("X Number");
  param2.setLabel("Y Number");
  matrix.deactivateAll();
  slider.deactivateAll();
  encoder.deactivateAll();
  encoder_button.deactivateAll();
  trackball.deactivateAll();
  if(a == -1){
    item_num = -1;
  }
  else{
    item_num = 25 + a;
    println(item_num);
  }
}

void controlEvent(ControlEvent theEvent) {
  if(theEvent.isAssignableFrom(Numberbox.class)) {
    println("controlEvent: accessing a string from controller '"
            +theEvent.getName()+"': "
            +theEvent.getValue()
            );
  }
}

public class NumberboxInput {

  String text = "";

  Numberbox n;

  boolean active;

  int col;
  
  NumberboxInput(Numberbox theNumberbox) {
    n = theNumberbox;
    registerMethod("keyEvent", this );
    col = n.getColor().getValueLabel();
  }

  public void keyEvent(KeyEvent k) {
    // only process key event if input is active 
    if (k.getAction()==KeyEvent.PRESS && active) {
      if (k.getKey()=='\n') { // cofirm input with enter
        submit();
        return;
      } else if(k.getKeyCode()==BACKSPACE) { 
        text = ""; // clear all text with backspace
      }
      else if(k.getKey()<255) {
        // check if the input is a valid (decimal) number
        final String regex = "\\d+";
        if ( java.util.regex.Pattern.matches(regex, text + k.getKey()) && (text.length() < 3)) {
          text += k.getKey();
        }
      }
      n.getValueLabel().setText(this.text);
    }
  }

  public void setActive(boolean b) {
    active = b;
    if(active) {
      col = n.getColor().getValueLabel();
      n.setColorValueLabel(n.getColor().getActive());
      text = n.getValueLabel().getText(); 
    }
  }
  
  public void clearText(){
    text = ""; 
  }
  public void submit() {
    if (!text.isEmpty()) {
      n.setValue( int( text ) );
      text = "";
    } 
    else {
      n.getValueLabel().setText(""+(int)n.getValue());
    }
    n.setColorValueLabel(col);
  }
}
