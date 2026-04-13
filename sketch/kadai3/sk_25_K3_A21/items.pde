void picture()
{
  pushMatrix();
  translate(35, 20);
  stroke(150);
  line(50, 40, 70, 30);
  line(90, 40, 70, 30);
  noStroke();
  fill(100);
  square(30, 40, 80);

  int skyColor=0;

  int h = hour();
  if (h >= 6 && h < 15 ) {
    skyColor=200;
  } else if (h >= 15 && h < 18) {
    skyColor=150;
  } else if (h >= 18 && h < 20) {
    skyColor=50;
  } else {
    skyColor=0;
  }
  fill(skyColor);
  square(40, 50, 60);

  int bone= skyColor > 128 ? 0 : 255;

  fill(bone);
  arc(60, 80, 18, 20, HALF_PI, PI + HALF_PI, PIE);
  triangle(83, 80, 89, 73, 89, 87);

  fill(skyColor);
  circle(56, 80, 5);

  noFill();
  stroke(bone);
  strokeWeight(2);
  arc(66, 80, 5, 18, HALF_PI, PI + HALF_PI);
  arc(72, 80, 6, 15, HALF_PI, PI + HALF_PI);
  arc(79, 80, 7, 11, HALF_PI, PI + HALF_PI);

  line(59, 80, 83, 80);
  popMatrix();
}

void desk()
{
  fill(200);
  rect(0, 250, 400, 50);
}

void paws() {
  int currentHour = hour() % 12;
  if (currentHour == 0) currentHour = 12;

  float iAmpY = 11;
  float iXInterval = 33;

  for (int i = 0; i < currentHour; i++)
  {
    pushMatrix();

    float x = i * iXInterval;
    float y = iAmpY * sin(radians(x));

    translate(15 + x, 275 + y);
    
    ///paw start
    int pawHight = 0;
    fill(30);
    circle(10, pawHight, 8);
    circle(6, pawHight - 8, 7);
    circle(6, pawHight + 8, 7);

    pushMatrix();
    rotate(radians(40));
    ellipse(-3, 0, 12, 9);
    rotate(radians(-80));
    ellipse(-3, 0, 12, 9);
    popMatrix();
    ///paw end
    popMatrix();
  }
}
