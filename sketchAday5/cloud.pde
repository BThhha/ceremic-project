//cloud variables
class Cloud {
  float x, y;
  float scale;       
  float speed;       

  //variable relations
  Cloud(float x, float y, float scale, float speed) {
    this.x = x;
    this.y = y;
    this.scale = scale;
    this.speed = speed;
  }
  
  //change x
  void update() {
    x += speed; 
  }
  //display clouds
  void display() {
    drawCloud(x, y, scale);
  }
  //return
  boolean isOffscreen() {
    return x > width + 400;  
  }
}
