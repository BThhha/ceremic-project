float cloudScale = 1.0;  
float baseAlpha = 220;     
color fillCol = color(240, 248, 255);  
color strokeCol = color(70, 90, 110); 
color innerCol = color(160, 200, 220); 
float strokeW = 1.5;     

void setup() {
  size(800, 600);
  background(255);
  noLoop();
}

void draw() {
  drawCloud(250, 400, cloudScale);
  drawCloud(500, 200, cloudScale * 0.7);
}


void drawCloud(float cx, float cy, float s) {
  pushMatrix();
  translate(cx, cy);
  scale(s);
  
  noStroke();
  fill(fillCol, baseAlpha);
  

  ellipse(-100, 0, 100, 60);   
  ellipse(0, -20, 120, 80);    
  ellipse(100, 0, 100, 60);    
  ellipse(50, 30, 80, 50);     
  

  ellipse(-180, -10, 40, 20);
  ellipse(-220, 0, 30, 15);
  ellipse(180, -10, 40, 20);
  ellipse(220, 0, 30, 15);
  

  stroke(innerCol, baseAlpha - 60);
  strokeWeight(2);
  noFill();
  curve(-120, -30, -60, 0, 0, -20, 60, 0);
  curve(60, 0, 120, -10, 180, 0, 220, 10);
  

  //drawSwirl(-40, 20, 1);
  //drawSwirl(60, 10, 0.8);
}
