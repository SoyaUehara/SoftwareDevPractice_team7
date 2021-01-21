class task {
  String Todo;
  String Done;
  String mode;
  int day;
  int daypoint;
  char k;
  PImage todo_image;
  PImage done_image;
  int todoX = 500, todoY = 240;
  int doneX = 500, doneY = 440;
  health h;

  task() {
    Todo = "";
    Done = "";
    todo_image = loadImage("to_do.png");
    done_image = loadImage("Done.png");
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
      Todo = task_key(Todo);
    }
    if (mode == "D") {
      Done = task_key(Done);
    }
  }

  void write_print() {
    textSize(30);
    fill(0);
    if (mode == "T") {
      text(Todo, width*0.5, height*0.5);
    }
    if (mode == "D") {
      text(Done, width*0.5, height*0.5);
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
    if (d.length() <= 50) {
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
  }

  void todo_done_judge() {
    if (Todo.length() > 0 && Done.length() > 0) {
      if (Todo.equals(Done)) {
        daypoint = 2;//todo達成
      } else {
        daypoint = 1;//todo未達成
      }
    } else {
      daypoint = 0;//todoとdoneが無い
    }
  }

  void delete_task() {
    Todo = "";
    Done = "";
  }
}
