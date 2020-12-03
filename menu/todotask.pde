class todotask {

  ArrayList<task> taskList; 
  int achivementPoint;
  int totalPoint;

  int days = 30;
  int dayPoint = 0;

  int[] dayList = new int[days];
  int[] coordinateList = new int[days*2];
  int[] dayPointList = new int[days]; 

  boolean isTarget = false;
  boolean clearTarget = false;

  boolean isAchivement = false;

  char keyData;
  String data = "あああああ";

  int pressEnterKey = 0;

  todotask() {
    taskList = new ArrayList();
    for (int i=0; i<days; i++) {
      task t = new task();
      taskList.add(t);
    }
  }

  void taskControll() {
    drawCalendar();
    target();
    dayTask();
    targetPress();
    drawTask();
  }

  void drawCalendar() {
    background(255);
    int x = 0;
    int y = 0;
    fill(0);
    for (int day = 1; day <= days; day++) {
      dayList[day-1] = day;
      fill(50);
      if (day % 7 == 1) {
        x = 0;
        y += 1;
      }    
      fill(0);
      noFill();
      int cooX = x*100+140;
      int cooY = y*100+50;
      coordinateList[(day-1)*2] = cooX;
      coordinateList[(day-1)*2+1] = cooY;
      rect(cooX, cooY, 100, 100);
      text(day, cooX+15, cooY+20);
      x += 1;
    }
  }

  void drawTask() {
    for (int i = 0; i < days; i++) {
      judgeDraw(i);
    }
  }

  void dayTask() { 
    if (mousePressed == true) {
      for (int i = 0; i < days; i++) {
        if (coordinateList[i*2] <= mouseX && mouseX < coordinateList[i*2]+100 && coordinateList[(i/7*7)*2+1] <= mouseY && mouseY < coordinateList[(i/7*7)*2+1]+100) {
          // task code
          taskList.get(i).write();
          println(dayList[i]);
          //
        }
      }
    }
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

  void judgeDraw(int i) {
    if (dayPointList[i] == 0) {
    } else if (dayPointList[i] == 1) {
      line(coordinateList[i*2]+50, coordinateList[(i/7*7)*2+1]+50, coordinateList[i*2]+50+15, coordinateList[(i/7*7)*2+1]+50+15);
      line(coordinateList[i*2]+50, coordinateList[(i/7*7)*2+1]+50, coordinateList[i*2]+50+15, coordinateList[(i/7*7)*2+1]+50-15);
      line(coordinateList[i*2]+50, coordinateList[(i/7*7)*2+1]+50, coordinateList[i*2]+50-15, coordinateList[(i/7*7)*2+1]+50+15);
      line(coordinateList[i*2]+50, coordinateList[(i/7*7)*2+1]+50, coordinateList[i*2]+50-15, coordinateList[(i/7*7)*2+1]+50-15);
    } else if (dayPointList[i] == 2) {
      ellipse(coordinateList[i*2]+50, coordinateList[(i/7*7)*2+1]+50, 30, 30);
    }
  }


  void judgeAchivement() {
    if (isAchivement == true) {
      condition = 2;
    }
  }

  void calcPoint() {
    dayPoint = 0;
    for (int i = 0; i < days; i++) {
      dayPoint += dayPointList[i] - 1;
    }
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
}
