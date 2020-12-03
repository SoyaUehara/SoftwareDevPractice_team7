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

  char keyData;
  String data;

  todotask() {
    taskList = new ArrayList();
    for (int i=0; i<31; i++) {
      task t = new task();
      taskList.add(t);
    }
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

  void dayTask() { 
    if (mousePressed == true) {
      for (int i = 0; i < days; i++) {
        if (coordinateList[i*2] <= mouseX && mouseX < coordinateList[i*2]+100 && coordinateList[(i/7*7)*2+1] <= mouseY && mouseY < coordinateList[(i/7*7)*2+1]+100) {
          taskList.get(i).write();
          println(dayList[i]);
          // kari code

          testDraw(i);

          //
        }
      }
    }
  }

  void targetPress() {
    if (mousePressed == true) {
      if (0 <= mouseX && mouseX < 1000 && 700 <= mouseY && mouseY < 800) {
      }
    }
  }

  void target() {
    if (isTarget == false) {
      rect(0, 0, 1000, 100);
      text("No target", 1000/2, 100/2);
      rect(0, 700, 1000, 100);
      text("Please click this box and enter target", 1000/2, (700+800)/2);
    } else if (isTarget == true) {
      rect(0, 0, 1000, 100);
      text("Your target", 1000/2, 100/2);
    }
  }

  void testDraw(int i) {
    if (dayPointList[i] == 0) {
      dayPointList[i] = 1;
      ellipse(coordinateList[i*2]+50, coordinateList[(i/7*7)*2+1]+50, 30, 30);
    } else if (dayPointList[i] == 1) {
      dayPointList[i] = 0;
      line(coordinateList[i*2]+50, coordinateList[(i/7*7)*2+1]+50, coordinateList[i*2]+50+15, coordinateList[(i/7*7)*2+1]+50+15);
      line(coordinateList[i*2]+50, coordinateList[(i/7*7)*2+1]+50, coordinateList[i*2]+50+15, coordinateList[(i/7*7)*2+1]+50-15);
      line(coordinateList[i*2]+50, coordinateList[(i/7*7)*2+1]+50, coordinateList[i*2]+50-15, coordinateList[(i/7*7)*2+1]+50+15);
      line(coordinateList[i*2]+50, coordinateList[(i/7*7)*2+1]+50, coordinateList[i*2]+50-15, coordinateList[(i/7*7)*2+1]+50-15);
    }
  }


  void judgeAchivement() {
  }

  void calcPoint() {
    dayPoint = 0;
    for (int i = 0; i < days; i++) {
      dayPoint += dayPointList[i];
    }
  }

  void keyPressed() {
    keyData = key;
  }
}
