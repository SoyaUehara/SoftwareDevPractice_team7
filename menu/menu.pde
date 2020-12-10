int condition = 0;
PImage startbutton;
PImage exitbutton;
int startbuttonX = 500;
int startbuttonY = 210;
int exitbuttonX = 500;
int exitbuttonY = 350;

todotask TDT = new todotask();

void setup(){
  size(1000,800); //size(1000,500);
  imageMode(CENTER);
  startbutton = loadImage("software1.png");
  exitbutton = loadImage("software2.png");
}

void draw(){
  background(255, 255, 255);
  fill(252,132,3);
  textSize(50);
  text("MENU",430,110);    
  if (condition == 0) {  // menu scene
    image(startbutton,startbuttonX,startbuttonY,200,200); 
    image(exitbutton,exitbuttonX,exitbuttonY,220,220);
  }else if (condition == 1){
    PFont font = createFont("HiraMaruProN-W4",24);
    textFont(font);
    textAlign(CENTER);
    //strokeWeight(2);
    play();
  }else if (condition == 3){
    background(255, 255, 255);
    TDT.Task();
  }
}

void mousePressed() {
  if(condition == 0){
     if(mousePressed && mouseX >= 425 && mouseX <= 570 && mouseY >= 175 && mouseY <= 240){
     condition = 1 ;
     }else if(mousePressed && mouseX >= 425 && mouseX <= 570 && mouseY >= 320 && mouseY <= 380){
     exit();
    } else if (condition == 2) {
      gameClear();
    }
  }if(condition == 3){
    condition = 1;
  }
}

void keyPressed() {
  if (condition == 1 && mousePressed == false) {
    TDT.key();
  }
}

void play() {
  TDT.taskControll();
}

void gameClear() {
}
