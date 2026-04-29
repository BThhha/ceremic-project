//set variables
float cloudScale = 1.0;    
float baseA= 220;     
color fillCol = color(240, 248, 255);  
color strokeCol = color(70, 90, 110); 
color innerCol = color(160, 200, 220); 
float strokeW = 1.5;     


class Cloud {
  float x, y;
  float scale;       
  float speed;       
  
  Cloud(float x, float y, float scale, float speed) {
    this.x = x;
    this.y = y;
    this.scale = scale;
    this.speed = speed;
  }


//cloud x variables
float cloud1X = 200;
float cloud2X = 300;
//set up
void setup() {
  size(800, 600);
  background(255);

}

void draw() {
  background(255);  
  
  //cloud move right
  cloud1X = cloud1X + 1;
  cloud2X = cloud2X + 1;
  
  //cloud comeback after disappearing
  if (cloud1X > width + 300) {
    cloud1X = -300;
  }
  if (cloud2X > width + 300) {
    cloud2X = -300;
  }
  
  //draw cloud
  drawCloud(cloud1X, 450, cloudScale);
  drawCloud(cloud2X, 200, cloudScale * 0.7);
}

void drawCloud(float cx, float cy, float s) {
  pushMatrix();
  translate(cx, cy);
  scale(s);
  noStroke();
  fill(fillCol, baseA);
  
  //cloud
  ellipse(-100, 0, 100, 60);   
  ellipse(0, -20, 120, 80);    
  ellipse(100, 0, 100, 60);    
  ellipse(50, 30, 80, 50);     
  

  ellipse(-180, -10, 40, 20);
  ellipse(-220, 0, 30, 15);
  ellipse(180, -10, 40, 20);
  ellipse(220, 0, 30, 15);
  

  stroke(innerCol, baseA - 60);
  strokeWeight(2);
  noFill();
  //blue curve on the edge
  curve(-120, -30, -60, 0, 0, -20, 60, 0);
  curve(60, 0, 120, -10, 180, 0, 220, 10);
  

  drawSwirl(-40, 20, 1);
  drawSwirl(60, 10, 0.8);
  

  stroke(strokeCol);
  strokeWeight(strokeW);
  noFill();
  //black edge of curves
  curve(-230, 0, -180, -10, -100, 0, 0, -20);
  curve(0, -20, 100, 0, 180, -10, 230, 0);
  curve(230, 0, 180, 10, 100, 20, 0, 30);
  curve(0, 30, -100, 20, -180, 10, -230, 0);
  popMatrix();
}
//swirl setup
void drawSwirl(float x, float y, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);
  
  stroke(strokeCol);
  strokeWeight(strokeW);
  noFill();
  //arcs on the cloud(swirl)
  arc(0, 0, 30, 30, 0, PI+HALF_PI);
  arc(5, -5, 20, 20, PI, TWO_PI-HALF_PI);
  
  popMatrix();
}
