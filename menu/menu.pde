int condition = 0;
PImage menu;
PImage home;
PImage nutrition;
PImage exercise;
PImage health;
PImage todo;
PImage exit;
PImage people;
PImage exitbutton;
int menuX = 500;
int menuY = 70;
int homeX = 500;
int homeY = 170;
int nutritionX = 500;
int nutritionY = 260;
int exerciseX = 500;
int exerciseY = 350;
int healthX = 500;
int healthY = 440;
int todoX = 500;
int todoY = 530;
int exitX = 500;
int exitY = 620;
int peopleX = 500;
int peopleY = 725;

todotask TDT = new todotask();

void setup(){
  TDT.taskList();
  size(1000,800); //size(1000,500);
  imageMode(CENTER);
  menu = loadImage("menu.png");
  home = loadImage("home.png");
  nutrition = loadImage("nutrition.png");
  exercise = loadImage("exercise.png");
  health = loadImage("health.png");
  todo = loadImage("todo.png");
  exit = loadImage("exit.png");
  people = loadImage("01.png");
}

void draw(){
  background(255, 255, 255);
  fill(252,132,3);
  textSize(50);
  text("MENU",430,110);    
  if (condition == 0) {  // menu scene
    image(menu,menuX,menuY,200,100); 
    image(home,homeX,homeY,200,100); 
    image(nutrition,nutritionX,nutritionY,200,100); 
    image(exercise,exerciseX,exerciseY,200,100); 
    image(health,healthX,healthY,200,100); 
    image(todo,todoX,todoY,200,100); 
    image(exit,exitX,exitY,200,100); 
    image(people,peopleX,peopleY,520,157); 
  }else if (condition == 1){
    PFont font = createFont("HiraMaruProN-W4",24);
    textFont(font);
    textAlign(CENTER);
    //strokeWeight(2);
    play();
  }else if (condition == 3){
    background(255, 255, 255);
    TDT.taskList.get(TDT.nowday).todo_done();
  }else if(condition == 4){
    background(255, 255, 255);
    TDT.task();
  }
}

void mousePressed() {
  if(condition == 0){
     if(mousePressed && mouseX >= 450 && mouseX <= 550 && mouseY >= 500 && mouseY <= 560){
     condition = 1 ; //<>//
     }else if(mousePressed && mouseX >= 450 && mouseX <= 550 && mouseY >= 560 && mouseY <= 620){
     exit();
    } else if (condition == 2) {
      gameClear();
    }
  }if(condition == 3 && mousePressed && mouseX >= 800 && mouseX <= 1000 && mouseY >= 0 && mouseY <= 240){
    TDT.taskList.get(TDT.nowday).mode_reset();
    condition =  1;
  }
  if(condition == 4 && mousePressed && mouseX >= 800 && mouseX <= 1000 && mouseY >= 0 && mouseY <= 240){
    condition =  3;
  }
}

void keyPressed() {
  if (condition == 1 ) {
    TDT.key();
  }else if(condition == 4){
    TDT.taskList.get(TDT.nowday).write();
  }
}

void play() {
  TDT.taskControll();
}

void gameClear() {
}
