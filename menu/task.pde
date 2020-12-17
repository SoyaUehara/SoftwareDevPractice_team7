class task {
  String Todo;
  String Done;
  String mode;
  int day;
  
  char k;
  
  health h;
  
  task() {
    Todo = "";
    Done = "";
  }
  
  void todo_done(){//todoとdoneの表示
    textSize(30);
    fill(255);
    rect(400, 200, 200, 50);
    rect(400, 400, 200, 50);
    fill(0);
    text("Todo", 500, 240);
    text("Done", 500, 440);
    base_print();
    if(mousePressed && mouseX >= 400 && mouseX <= 600 && mouseY >= 200 && mouseY <= 250){
      mode = "T";
      condition =  4;
    }
    if(mousePressed && mouseX >= 400 && mouseX <= 600 && mouseY >= 400 && mouseY <= 450){
      mode = "D";
      condition =  4;
    }
  }
  
  void write() {
    if(mode == "T"){
      Todo = task_key(Todo);
    }
    if(mode == "D"){
      Done = task_key(Done);
    }
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
    base_print();
  }
  
  void base_print(){
    fill(255);
    rect(1000-200, 0, 200, 50);
    fill(0);
    text("back>>", 900, 40);
    text(day, 30, 40);
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
  
  void mode_reset(){
    mode = "";
  }
  
  boolean todo_done_jugde(){
    if(Todo == Done){
      return true;
    }
    return false;
  }
  
  void delete_task(){
    Todo = "";
    Done = "";
  }
}
