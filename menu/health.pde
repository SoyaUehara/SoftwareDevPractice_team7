class health{
  int red;
  int yello;
  int green;
  int baceCalorie;
  float playerHeight;
  float requiredCalories;
  void calcNutrition(){
    baceCalorie = red + yello + green;
    requiredCalories = playerHeight * playerHeight * 22;
    int r1 = round(requiredCalories);
    if(baceCalorie <= r1){
      
    }
    if(baceCalorie > r1){
    }
    
    
  }
  
}
