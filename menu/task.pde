class task {
  String Todo;
  String Done;
  StringBuilder sb;
  char k;
  task() {
    Todo = "";
    Done = "";
    sb = new StringBuilder();
  }
  void write() {
    if (keyPressed) {
      if (key == BACKSPACE) {
        if (sb.length() != 0) {
          sb.delete(sb.length()-1, sb.length());
        }
      } else if (k!=key) {
        sb.append(key);
        k = key;
      }
    }
    fill(0);
    textAlign(LEFT, LEFT);
    text(sb.toString(), width*0.5, height*0.5);
  }
}
