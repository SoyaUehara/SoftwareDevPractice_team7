int state = 0;
PImage startbutton;
PImage exitbutton;
int startbuttonX = 500;
int startbuttonY = 210;
int exitbuttonX = 500;
int exitbuttonY = 350;

void setup() {
  size(1000, 800);
  strokeWeight(2);
  frameRate(10);
  imageMode(CENTER); 
  startbutton = loadImage("software1.png");
  exitbutton = loadImage("software2.png");
}

void draw() {
  if (state == 0) {
    title();
  } else if (state ==1) {
    testDo();
  } else if (state ==2) {
    TDT.dayTask();
  }
}

todotask TDT = new todotask();

void title() {
  background(255);
  fill(252,132,3);
  textSize(50);
  text("MENU",430,110);
  textSize(10);
  image(startbutton, startbuttonX, startbuttonY, 200, 200); 
  image(exitbutton, exitbuttonX, exitbuttonY, 220, 220);
  if(mousePressed && mouseX >= 425 && mouseX <= 570 && mouseY >= 175 && mouseY <= 240)
     state = 1 ;
     else if(mousePressed && mouseX >= 425 && mouseX <= 570 && mouseY >= 320 && mouseY <= 380)
     exit();
}



void testDo() {
  TDT.drawCalendar();
  state = 2;
  TDT.target();
}
