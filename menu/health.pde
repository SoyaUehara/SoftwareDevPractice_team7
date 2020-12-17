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
      println("もっと食べましょう");
    }
    if(baceCalorie > r1){
      println("食べ過ぎには気をつけましょう");
    }
  }
  float bike = 5.3;
  float walkFast = 5;
  float climbStairs = 6.4;
  float skippingRope = 10;
  float bathng = 2.9;
  float cleanUp = 3.3;
  float moveTimeMinutes = 0;
  int caloriesBurned;
  int targetCalories = 300;
  void motion(){
    int bike_r = round(bike * moveTimeMinutes);
    int walkFast_r = round(walkFast * moveTimeMinutes);
    int climbStairs_r = round(climbStairs * moveTimeMinutes);
    int skippingRope_r = round(skippingRope * moveTimeMinutes);
    int bathng_r = round(bathng * moveTimeMinutes);
    int cleanUp_r = round(cleanUp * moveTimeMinutes);
    caloriesBurned = bike_r + walkFast_r + climbStairs_r + skippingRope_r + bathng_r + cleanUp_r;
    if(targetCalories <= caloriesBurned){
      println("よくできました");
    }
  if(targetCalories > caloriesBurned){
      println("もっと頑張りましょう");
    }
  }
}
