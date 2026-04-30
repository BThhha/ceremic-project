//set variables
float baseAlpha = 220;     
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
  
  void update() {
    x += speed; 
  }
  
  void display() {
    drawCloud(x, y, scale);
  }
  
  boolean isOffscreen() {
    return x > width + 400;  
  }
}

ArrayList<Cloud> clouds = new ArrayList<Cloud>();
int lastGenTime = 0;  
int genInterval = 4000;  

void setup() {
  size(800, 600);
  frameRate(60);
  

  lastGenTime = millis();
  generateTwoClouds();
}

void draw() {
  background(255);
  

  int currentTime = millis();
  if (currentTime - lastGenTime >= genInterval) {
    generateTwoClouds();
    lastGenTime = currentTime;
  }
  

  for (int i = clouds.size() - 1; i >= 0; i--) {
    Cloud c = clouds.get(i);
    c.update();
    c.display();
    

    if (c.isOffscreen()) {
      clouds.remove(i);
    }
  }
}

void generateTwoClouds() {

  for (int i = 0; i < 2; i++) {
    float y = random(80, height - 100);  //
    float scale = calculateScaleByY(y);   //
    float speed = random(1, 5.1);        // 

    float x = random(-200, -50);
    
    clouds.add(new Cloud(x, y, scale, speed));
  }
}


float calculateScaleByY(float y) {
  // (y=80) scale  0.35
  // (y=500) scale  1.15
  float minScale = 0.35;
  float maxScale = 1.15;
  float minY = 80;
  float maxY = 500;
  

  y = constrain(y, minY, maxY);
  

  float t = (y - minY) / (maxY - minY);
  return minScale + t * (maxScale - minScale);
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
  
 
  drawSwirl(-40, 20, 1);
  drawSwirl(60, 10, 0.8);
  

  stroke(strokeCol);
  strokeWeight(strokeW);
  noFill();
  curve(-230, 0, -180, -10, -100, 0, 0, -20);
  curve(0, -20, 100, 0, 180, -10, 230, 0);
  curve(230, 0, 180, 10, 100, 20, 0, 30);
  curve(0, 30, -100, 20, -180, 10, -230, 0);
  
  popMatrix();
}

void drawSwirl(float x, float y, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);
  
  stroke(strokeCol);
  strokeWeight(strokeW);
  noFill();
  
  arc(0, 0, 30, 30, 0, PI + HALF_PI);
  arc(5, -5, 20, 20, PI, TWO_PI - HALF_PI);
  
  popMatrix();
}
