void setup() {
  size(1000, 1000);
  //frameRate(30);
  colorMode(HSB, 360, 100, 100, 255);//set hsb color mode
  noFill();
  stroke(255);
  strokeWeight(2);
  blendMode(ADD);
  drawShape();
}
void draw() {
}
void mousePressed() {  
  drawShape();
}
void drawShape() { 
  stroke(color(random(0, 360), random(60, 100), 50, 190) );//pick the color randomly
  background(0);
  translate(width*0.5, height*0.5);

  int maxI=12;//set the times of drawing the spiral shape

  for (int i=0; i<maxI; i++) {  
    float x, y, leng, va, a, t;
    x=random(-500, 500);
    y=random(-500, 500);
    leng=random(5, 20);
    va=random(50, 270);
    a= random(-500, 500);
    t= random(1, 40);
    //all the parameters are set randomly
    drawLine(x, y, leng, va, a, t);
    rotate(radians(360/maxI));//rotate the coordinate everytime when finishs drawing spirals ( 360/maxI is one circle )
  }
}
void drawLine(float x, float y, float leng, float vangle, float angle, float t) {
  rotate(radians(angle));// rotate random angel everytime to separate the whole pattern 
  beginShape();
  for (float a=0; a<3600; a+=max(1, vangle)) {
    float r=map(a, 0, 360, leng*0.1, leng);//when the degree increase, the radius increase too so this makes to draw sprial patterns
    float vx=r*sin(radians(a))+x;
    float vy=r*cos(radians(a))+y;
    //using polar coordinates to calculate a coordinate system and plus the value of x,y
    vertex(vx, vy);
  }  
  endShape();
  //connect every points to draw sprial pattern 
  if (t>0) {
    float vx=leng*sin(radians(angle))+x;
    float vy=leng*cos(radians(angle))+y;
    drawLine(vx, vy, leng*0.9, vangle, angle, t-1);
    //achieve recursion from reducing the leng in order to create smaller sprial patterns  
  }
}
