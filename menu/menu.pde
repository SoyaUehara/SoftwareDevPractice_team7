import javax.swing.*; //<>//
import java.awt.*;

int condition = 0;
PImage menu, home, nutrition, exercise, health, todo, exit, people, exitbutton;//画像読み込み
int menuX = 500, menuY = 70;//menuの座標
int homeX = 500, homeY = 170;//homeの座標
int nutritionX = 500, nutritionY = 260;//nutritionの座標
int exerciseX = 500, exerciseY = 350;//exerciseの座標
int healthX = 500, healthY = 440;//healthの座標
int todoX = 500, todoY = 530;//todoの座標
int exitX = 500, exitY = 620;//exitの座標
int peopleX = 500, peopleY = 725;//peopleの座標

JLayeredPane pane;
JTextArea area;

todotask TDT = new todotask();
test T = new test();
health HEL = new health();


void setup() {
  TDT.taskList();
  size(1000, 800); //size(1000,500);
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

void draw() {
  background(255, 255, 255);
  if (condition == 0) {  // menu scene
    image(menu, menuX, menuY, 200, 100); 
    image(home, homeX, homeY, 200, 100); 
    image(nutrition, nutritionX, nutritionY, 200, 100); 
    image(exercise, exerciseX, exerciseY, 200, 100); 
    image(health, healthX, healthY, 200, 100); 
    image(todo, todoX, todoY, 200, 100); 
    image(exit, exitX, exitY, 200, 100); 
    image(people, peopleX, peopleY, 520, 157);
  } else if (condition == 1) {
    PFont font = createFont("HiraMaruProN-W4", 24);
    textFont(font);
    textAlign(CENTER);
    //strokeWeight(2);
    play();
  } else if (condition == 10) {
    PFont font = createFont("HiraMaruProN-W4", 24);
    textFont(font);
    textAlign(CENTER);
    //strokeWeight(2);
    play_1();
  } else if (condition == 3) {
    TDT.csv_write();
    background(255, 255, 255);
    TDT.taskList.get(TDT.nowday).todo_done();
  } else if (condition == 4) {
    background(255, 255, 255);
    TDT.task();
  } else if (condition == 11) {
    background(255, 255, 255);
    HEL.task();
  }
}
void mousePressed() {
  if (condition == 1 && mouseX >= 900 && mouseX <= 1000 && mouseY >= 100 && mouseY <= 150) {
    condition = 0;
  }
  if (condition == 10 && mouseX >= 900 && mouseX <= 1000 && mouseY >= 100 && mouseY <= 150) {
    condition = 0;
  }
  if (condition == 3 && mouseX >= 800 && mouseX <= 1000 && mouseY >= 0 && mouseY <= 50) {
    TDT.taskList.get(TDT.nowday).mode_reset();
    condition =  1;
  }
  if (condition == 4 && mouseX >= 800 && mouseX <= 1000 && mouseY >= 0 && mouseY <= 50) {
    condition =  3;
  }
}
void mouseClicked() {
  if (condition == 0) {
    if (mouseX >= 450 && mouseX <= 550 && mouseY >= 500 && mouseY <= 560) {
      condition = 1 ;
    } else if (mouseX >= 450 && mouseX <= 550 && mouseY >= 440 && mouseY <= 500) {
      condition = 10 ;
    } else if (mouseX >= 450 && mouseX <= 550 && mouseY >= 560 && mouseY <= 620) {
      exit();
    } else if (condition == 2) {
      gameClear();
    }
  }
}

void keyPressed() {
  if (condition == 1) {
    TDT.key();
    } else if (condition == 10) {
    HEL.key();
  } else if (condition == 4) {
    TDT.taskList.get(TDT.nowday).write();
    if (keyCode==ENTER) {
      area.setText("");
    }
  }
}

void play() {
  TDT.taskControll();
}

void play_1() {
  HEL.taskControll();
}

void motion() {
  HEL.motion();
}

void gameClear() {
}

void mouse_reset() {
  mouseX = 0;
  mouseY = 0;
}

void setTextarea(int x, int y, int xx, int yy) {

  // enter japanese key code

  Canvas canvas = (Canvas) surface.getNative();
  pane = (JLayeredPane) canvas.getParent().getParent();

  area = new JTextArea();
  area.setLineWrap(true);
  area.setWrapStyleWord(true);
  JScrollPane scrollPane = new JScrollPane(area);
  scrollPane.setBounds(x, y, xx, yy);
  pane.add(scrollPane);
}
