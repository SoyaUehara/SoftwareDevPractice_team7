class todotask {
  ArrayList<task> taskList; 
  int achivementPoint;
  int totalPoint;
  int nowday = 0;

  int days = 30;
  int dayPoint = 0;
  int clearPoint = 30;

  int[] dayList = new int[days];
  int[] coordinateList = new int[days*2];
  int[] dayPointList = new int[days]; 

  boolean isTarget = false;
  boolean clearTarget = false;

  boolean isAchivement = false;

  boolean isSetTextArea = false;

  boolean isClear = false;
  boolean isDrawClear = false;

  char keyData;
  String data = "";

  int pressEnterKey = 0;
  String filename_todo = "database/todo.csv";
  String filename_point = "database/daypoint.csv";
  boolean set_TorF = true;

  void taskList() {
    taskList = new ArrayList();
    for (int i=0; i<days; i++) {
      task t = new task();
      taskList.add(t);
    }
    csv_write();
  }

  void taskControll() {
    drawCalendar();
    target();
    drawTextArea();
    drawTask();
    targetPress();
    dayTask();
    back();
    result();
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
          println((i+1)+"日が押された");
          boolean task_TorF = false;
          for (int j=0; j<9; j++) {
            if (i==0) {
              task_TorF = true;
              break;
            } else {
              if (taskList.get(i-1).Todo[j].length() > 0) {
                task_TorF = true;
                break;
              }
            }
          }
          switch(mouseButton) {
          case LEFT:
            if (isTarget) {
              taskList.get(i).delete_task();
              csv_write();
            } else {
              if (task_TorF) {
                // task code
                nowday = i;
                taskList.get(i).day = i+1;
                condition = 3;
                mouseX = 0;
                mouseY = 0;
              }
            }
            break;
          case RIGHT:
            nowday = i;
            break;
          }
        }
      }
    }
  }

  void task() {
    taskList.get(nowday).write_print();
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
    if (dayPointList[i] == 0) {//無し
    } else if (dayPointList[i] == -1) {//×
      line(coordinateList[i*2]+50, coordinateList[(i/7*7)*2+1]+50, coordinateList[i*2]+50+15, coordinateList[(i/7*7)*2+1]+50+15);
      line(coordinateList[i*2]+50, coordinateList[(i/7*7)*2+1]+50, coordinateList[i*2]+50+15, coordinateList[(i/7*7)*2+1]+50-15);
      line(coordinateList[i*2]+50, coordinateList[(i/7*7)*2+1]+50, coordinateList[i*2]+50-15, coordinateList[(i/7*7)*2+1]+50+15);
      line(coordinateList[i*2]+50, coordinateList[(i/7*7)*2+1]+50, coordinateList[i*2]+50-15, coordinateList[(i/7*7)*2+1]+50-15);
    } else if (dayPointList[i] == 1) {//○
      ellipse(coordinateList[i*2]+50, coordinateList[(i/7*7)*2+1]+50, 30, 30);
    }
  }

  void judgeAchivement() {
    if (isAchivement == true) {
      condition = 2;
    }
  }

  int calcPoint() {
    dayPoint = 0;
    for (int i = 0; i < days; i++) {
      dayPoint += dayPointList[i];
    }
    return dayPoint;
  }

  void result() {
    if (calcPoint() >= clearPoint && isClear == false) {
      isClear = true;
      condition = 5;
    } else if (calcPoint() < clearPoint) {
    }
  }

  void key() {
    if (keyCode == CONTROL) {
    } else if (isTarget == false && data.length() <= 50) {
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

  void csv_write() {
    String[] todo_data = loadStrings(filename_todo);
    String[] point_data = loadStrings(filename_point);
    if (set_TorF) {
      for (int i=0; i<todo_data.length-1; i++) {
        String[] data = todo_data[i+1].split(",", -1);
        dayPointList[i] = Integer.parseInt(point_data[i]);
        taskList.get(i).Todo = data[0].split("/", -1);
        taskList.get(i).Done = data[1].split("/", -1);
      }
      set_TorF = false;
    } else {
      for (int i=0; i<todo_data.length-1; i++) {
        String csv_todo = "";
        String csv_done = "";
        for (int j=0; j<9; j++) {
          csv_todo += taskList.get(i).Todo[j];
          csv_done += taskList.get(i).Done[j];
          if (j!=8) {
            csv_todo += "/";
            csv_done += "/";
          }
        }
        todo_data[i+1] = ""+csv_todo+","+csv_done;
        point_data[i] = ""+dayPointList[i];
      }
    }
    saveStrings(filename_todo, todo_data);
    saveStrings(filename_point, point_data);
  }

  void back() {
    fill(255);
    rect(900, 100, 100, 50);
    fill(0);
    text("back>>", 950, 140);
  }
}
