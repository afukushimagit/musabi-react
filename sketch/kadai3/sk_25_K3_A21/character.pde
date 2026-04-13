int eyeHight=17;
int eyelashR=13;
int eyelashL=-35;
int eyelashY=-20;
int eyeballY=-3;


void character()
{
  body();
  face();
}

void face()
{
  backHair();
  skin();
  eyes();
  frontHair();
}

void tail()
{
  noFill();
  stroke(#666058);
  strokeWeight(8);
  bezier(100, -5, -40, -40, 150, 160, 0, 130);
  noStroke();
}

void body()
{
  fill(#FFE6DB);
  rect(-10, 15, 20, 30);

  fill(#ab9e7f);
  quad(23, 40, 47, 90, -47, 90, -23, 40);
  rect(-47, 88, 94, 50);

  fill(#936d5f);
  rect(-15, 33, 30, 10);
  stroke(#826154);
  strokeWeight(1.9);
  triangle(0, 43, 7, 60, -7, 60);
  noStroke();
}

void backHair()
{
  fill(#817a70);
  ellipse(0, -35, 116, 100);
}

void rightEar()
{
  fill(#817a70);
  pushMatrix();
  rotate(radians(25));
  ellipse(-5, -90, 30, 60);
  popMatrix();

  pushMatrix();
  rotate(radians(-7));
  ellipse(57, -75, 20, 60);
  popMatrix();
}

void leftEar()
{
  fill(#817a70);
  pushMatrix();
  rotate(radians(-25));
  ellipse(5, -90, 30, 60);
  popMatrix();

  pushMatrix();
  rotate(radians(7));
  ellipse(-57, -75, 20, 60);
  popMatrix();
}

void skin()
{
  fill(#FFFFFF);
  ellipse(0, -2, 100, 60);
  noStroke();
  ellipse(0, -25, 100, 50);

  fill(#FFE6DB);
  circle(-30, 6, 24);
  circle(30, 6, 24);
}

void eyes()
{
  if (eyelashY < -10) {
    fill(#98b8af);
    circle(24, eyeballY, -16);

    fill(#98b8af);
    circle(-24, eyeballY, 16);
  }

  fill(#35342d);
  rect(32, eyelashY, -16, eyeHight);
  rect(eyelashR, eyelashY, 22, 5);

  rect(-32, eyelashY, 16, eyeHight);
  rect(eyelashL, eyelashY, 22, 5);
}

void frontHair()
{
  fill(#817a70);
  quad(42, -30, 60, -30, 60, 5, 42, 5);
  quad(-42, -30, -60, -30, -60, 5, -42, 5);
  
  ellipse(51, 3, 18, 35);
  ellipse(-51, 3, 18, 35);
  rect(-30, -70, 60, 20);

  pushMatrix();
  rotate(radians(45));
  ellipse(-55, 0, 40, 60);
  ellipse(-35, -23, 30, 50);
  popMatrix();

  pushMatrix();
  rotate(radians(-35));
  ellipse(55, -10, 40, 60);
  popMatrix();

  pushMatrix();
  rotate(radians(30));
  ellipse(-60, 17, 10, 25);
  rotate(radians(-60));
  ellipse(60, 17, 10, 25);
  popMatrix();
}

void hands()
{
  fill(#817a70);
  ellipse(30, 90, 15, 20);
  ellipse(40, 90, 15, 20);
  ellipse(50, 90, 15, 20);

  ellipse(-30, 90, 15, 20);
  ellipse(-40, 90, 15, 20);
  ellipse(-50, 90, 15, 20);
}
