class task {
  String[] Todo;
  String[] Done;
  String mode;
  int day;
  int daypoint;
  char k;
  PImage todo_image;
  PImage done_image;
  int todoX = 500, todoY = 240;
  int doneX = 500, doneY = 440;
  int box_num;
  health h;

  task() {
    Todo = new String[9];
    Done = new String[9];
    todo_image = loadImage("to_do.png");
    done_image = loadImage("Done.png");
    box_num = 0;
  }

  void todo_done() {//todoとdoneの表示
    textSize(30);
    fill(255);
    rect(399, 189, 201, 101);
    rect(399, 389, 201, 101);
    fill(0);
    image(todo_image, todoX, todoY, 200, 100);
    image(done_image, doneX, doneY, 200, 100);
    base_print();
    if (mousePressed && mouseX >= 399 && mouseX <= 600 && mouseY >= 189 && mouseY <= 290) {
      mode = "T";
      condition =  4;
    }
    if (mousePressed && mouseX >= 399 && mouseX <= 600 && mouseY >= 389 && mouseY <= 490) {
      mode = "D";
      condition =  4;
    }
  }

  void write() {
    if (mode == "T") {
      Todo[box_num] = task_key(Todo[box_num]);
    }
    if (mode == "D") {
      Done[box_num] = task_key(Done[box_num]);
    }
  }

  void write_print() {
    task_drow();
    judge();
    textSize(30);
    fill(0);
    if (mode == "T") {
      for(int i=0; i<3; i++){
        for (int j=0; j<3; j++){
          text(Todo[j+(i*3)], 150+120+240*j, 100+100+200*i);
        }
      }
    }
    if (mode == "D") {
      for(int i=0; i<3; i++){
        for (int j=0; j<3; j++){
          text(Done[j+(i*3)], 150+120+240*j, 100+100+200*i);
        }
      }
    }
    base_print();
  }

  void base_print() {
    fill(255);
    rect(800, 0, 200, 50);
    fill(0);
    text("back>>", 900, 40);
    text(day, 30, 40);
    if (condition == 4) {
      if (mode== "T") {
        text("To do", 100, 40);
      } else if (mode == "D") {
        text("Done", 100, 40);
      }
    }
  }

  String task_key(String d) {
    if (key == ENTER || key == ',' || key == '/'){
      return d;
    }
    else if (d.length() <= 13) {
      k = key;
      if (key == BACKSPACE && d.length() > 0) {
        d = d.substring(0, d.length()-1);
      } else {
        d += k;
      }
    } else if (key == BACKSPACE && d.length() > 0) {
      d = d.substring(0, d.length()-1);
    }
    return d;
  }

  void mode_reset() {
    mode = "";
    box_num = 0;
  }
  void todo_done_judge() {
  }

  void delete_task() {
    for (int i=0; i<9; i++){
      Todo[i] = "";
      Done[i] = "";
    }
  }
  void task_drow(){
    fill(255);
    rect(150, 100, 720, 600);
    line(150+240,100, 150+240,700);
    line(150+480,100, 150+480,700);
    line(150,100+200, 150+720,100+200);
    line(150,100+400, 150+720,100+400);
  }
  void judge(){
    if(mousePressed == true && 150 <= mouseX && mouseX <= 870 && 100 <= mouseY && mouseY <= 700){
      box_num = (int) (Math.floor((mouseX-150)/240)+Math.floor((mouseY-100)/200)*3);
    }
  }
}
