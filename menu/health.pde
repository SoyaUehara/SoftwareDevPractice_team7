class health {
  ArrayList<task> taskList; 
  int achivementPoint;
  int totalPoint;
  int nowday = 0;

  int exercise = 10;
  int dayPoint = 0;
  String motion;
  int[] dayList = new int[exercise];
  int[] coordinateList = new int[exercise*2];
  int[] dayPointList = new int[exercise]; 

  boolean isTarget = false;
  boolean clearTarget = false;

  boolean isAchivement = false;
  
  boolean isSetTextArea = false;

  char keyData;
  String data = "";

  int pressEnterKey = 0;
  String filename = "database/todo.csv";
  boolean set_TorF = true;
  
  
  int red;
  int yello;
  int green;
  int baceCalorie;
  float playerHeight;
  float requiredCalories;
  void calcNutrition() {
    baceCalorie = red + yello + green;
    requiredCalories = playerHeight * playerHeight * 22;
    int r1 = round(requiredCalories);
    if (baceCalorie <= r1) {
      println("もっと食べましょう");
    }
    if (baceCalorie > r1) {
      println("食べ過ぎには気をつけましょう");
    }
  }
  float bike = 5.3;
  float walkFast = 5;
  float climbStairs = 6.4;
  float skippingRope = 10;
  float bathng = 2.9;
  float cleanUp = 3.3;
  float moveTimeMinutes = 0;
  int caloriesBurned;
  int targetCalories = 300;
  void motion() {
    int bike_r = round(bike * moveTimeMinutes);
    int walkFast_r = round(walkFast * moveTimeMinutes);
    int climbStairs_r = round(climbStairs * moveTimeMinutes);
    int skippingRope_r = round(skippingRope * moveTimeMinutes);
    int bathng_r = round(bathng * moveTimeMinutes);
    int cleanUp_r = round(cleanUp * moveTimeMinutes);
    caloriesBurned = bike_r + walkFast_r + climbStairs_r + skippingRope_r + bathng_r + cleanUp_r;
    if (targetCalories <= caloriesBurned) {
      println("よくできました");
    }
    if (targetCalories > caloriesBurned) {
      println("もっと頑張りましょう");
    }
  }
    void taskList() {
    taskList = new ArrayList();
    for (int i=0; i<exercise; i++) {
      task t = new task();
      taskList.add(t);
    }
  }

  void taskControll() {
    drawhealth();
    target();
    drawTextArea();
    drawTask();
    targetPress();
    healthTask();
    back();
  }

  void drawhealth() {
    background(255);
    int x = 0;
    int y = 0;

    fill(0);
    for (int exe = 1; exe <= exercise; exe++) {
      dayList[exe-1] = exe;
      fill(50);
      if (exe % 5 == 1) {
        x = 0;
        y += 1;
      }  
      if (exe == 1) {
       motion = "run";
      } else if(exe == 2){
        motion = "bike";
      } else if(exe == 3){
        motion = "walkFast";
      } else if(exe == 4){
        motion = "climbStairs";
      } else if(exe == 5){
        motion = "skippingRope";
      } else if(exe == 6){
        motion = "bathng";
      } else if(exe == 7){
        motion = "cleanUp";
      } else if(exe == 8){
        motion = "";
      } else if(exe == 9){
        motion = "";
      } else if(exe == 10){
        motion = "";
      } 
      fill(0);
      noFill();
      int cooX = x*170+75;
      int cooY = y*170+50;
      coordinateList[(exe-1)*2] = cooX;
      coordinateList[(exe-1)*2+1] = cooY;
      rect(cooX, cooY, 170, 170);
      text(motion, cooX+85, cooY+40);
      x += 1;
    }
  }

  void drawTask() {
  }

  void healthTask() { 
    if (mousePressed == true) {
      if (mouseX >= 75 && mouseX <= 255 && mouseY >= 50 && mouseY <= 205) {
        condition = 11;
      }
    }
  }

  void task() {
    text("500kcl",500,200);
  }

  void targetPress() {
    if (mousePressed == true) {
      if (800 <= mouseX && mouseX < 1000 && 650 <= mouseY && mouseY < 700 && isTarget == false) {
        isTarget = true;
      } else if (0 <= mouseX && mouseX < 200 && 100 <= mouseY && mouseY < 150 && isTarget == true) {
        isTarget = false;
      }
    }
  }

  void target() {
    if (isTarget == false) {
      rect(0, 0, 1000, 100);
      text("No target", 1000/2, 100/2);
      rect(0, 700, 1000, 100);
      text(data, 1000/2, (700+800)/2);
      rect(800, 650, 200, 50);
      text("Keep", (800 + 1000)/2, (650+700)/2);
    } else if (isTarget == true) {
      rect(0, 0, 1000, 100);
      text(data, 1000/2, 100/2);
      rect(0, 100, 200, 50);
      text("Delete", (0 + 200)/2, (100 + 150)/2);
    }
  }


  void drawTextArea() {
    if (isSetTextArea == false) {
      //setTextarea(0, 700, 1000, 100);

      isSetTextArea = true;
    } else if (isSetTextArea == true) {
    }
  }

  void judgeDraw(int i) {
    if (taskList.get(i).daypoint == 0) {
    } else if (taskList.get(i).daypoint == 1) {
      line(coordinateList[i*2]+50, coordinateList[(i/7*7)*2+1]+50, coordinateList[i*2]+50+15, coordinateList[(i/7*7)*2+1]+50+15);
      line(coordinateList[i*2]+50, coordinateList[(i/7*7)*2+1]+50, coordinateList[i*2]+50+15, coordinateList[(i/7*7)*2+1]+50-15);
      line(coordinateList[i*2]+50, coordinateList[(i/7*7)*2+1]+50, coordinateList[i*2]+50-15, coordinateList[(i/7*7)*2+1]+50+15);
      line(coordinateList[i*2]+50, coordinateList[(i/7*7)*2+1]+50, coordinateList[i*2]+50-15, coordinateList[(i/7*7)*2+1]+50-15);
    } else if (taskList.get(i).daypoint == 2) {
      ellipse(coordinateList[i*2]+50, coordinateList[(i/7*7)*2+1]+50, 30, 30);
    }
  }


  void judgeAchivement() {
    if (isAchivement == true) {
      condition = 2;
    }
  }

  void calcPoint() {
  }

  void key() {
    if (isTarget == false && data.length() <= 50) {
      keyData = key;
      if (key == BACKSPACE && data.length() > 0) {
        data = data.substring(0, data.length()-1);
      } else {
        data += keyData;
      }
    } else if (key == BACKSPACE && data.length() > 0) {
      data = data.substring(0, data.length()-1);
    }
  }
  void back() {
    fill(255);
    rect(900, 100, 100, 50);
    fill(0);
    text("back>>", 950, 140);
  }
}
