class task {
  String Todo;
  String Done;
  char k;
  boolean isTarget;
  String data;
  int count;
  health h;
  task() {
    Todo = "";
    Done = "";
    isTarget = false;
    data = "";
    count = 0;
  }
  void write() {
    task_key();
  }
  void p() {
    fill(0);
    text(data, width*0.5, height*0.5);
  }
  void task_key() {
    if (keyPressed) {
      if (count >= 5) {
        if (isTarget == false && data.length() <= 50) {
          char keyData = key;
          if (key == BACKSPACE && data.length() > 0) {
            data = data.substring(0, data.length()-1);
          } else {
            data += keyData;
          }
        } else if (key == BACKSPACE && data.length() > 0) {
          data = data.substring(0, data.length()-1);
        }
        count = 0;
      } else {
        count ++;
      }
    }
  }
}
