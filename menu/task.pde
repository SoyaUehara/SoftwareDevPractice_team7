class task {
  String Todo;
  String Done;
  char k;
  boolean isTarget;
  String d;
  health h;
  String mode;
  task() {
    Todo = "";
    Done = "";
    isTarget = false;
    d = "";
  }
  void todo_done(){//todoとdoneの表示
    textSize(30);
    fill(255);
    rect(400, 200, 200, 50);
    rect(400, 400, 200, 50);
    fill(0);
    text("Todo", 500, 240);
    text("Done", 500, 440);
    back_print();
    if(mousePressed && mouseX >= 400 && mouseX <= 600 && mouseY >= 200 && mouseY <= 250){
      mode = "T";
      condition =  4;
    }
    if(mousePressed && mouseX >= 400 && mouseX <= 600 && mouseY >= 400 && mouseY <= 450){
      mode = "D";
      condition =  4;
    }
  }
  void TorD(){//
    if(mode == "T"){
      Todo += d;
    }if(mode == "D"){
      Done += d;
    }
    d = "";
  }
  void write() {
    task_key();
  }
  void write_print(String m) {
    textSize(30);
    fill(0);
    if(m == "T"){
      text(Todo, width*0.5, height*0.5);
    }
    if(m == "D"){
      text(Done, width*0.5, height*0.5);
    }
    back_print();
  }
  void back_print(){
    fill(255);
    rect(1000-200, 0, 200, 50);
    fill(0);
    text("back>>", 900, 40);
  }
  void task_key() {
    if (isTarget == false && d.length() <= 50) {
      k = key;
      if (key == BACKSPACE && d.length() > 0) {
        d = d.substring(0, d.length()-1);
      } else {
        d += k;
      }
    } else if (key == BACKSPACE && d.length() > 0) {
      d = d.substring(0, d.length()-1);
    }
  }
  void mode_reset(){
    mode = "";
  }
}
