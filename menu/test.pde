
//https://gakupass.univ.coop/popup/popup03.html

class test{
  int red;
  int yello;
  int green;
  int calorie;
  int targetRed;
  int targetYellow;
  int targetGrenn;
  int targetCalorie;
  
  String filename = "database/test.csv";
  
  void getData(){
    String[] lines = loadStrings(filename);
    println("there are " + lines.length + " lines");
    for (int i = 0 ; i < lines.length; i++) {
     println(lines[i] + "(by loadStrings)");
   }
 } 
}
