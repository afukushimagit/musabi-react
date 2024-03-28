size(500, 500);
background(255);

int a=20;

noStroke();
fill (255, 20, 147, 50);
for (int f=0; f<60; f++)
{
  for (int e=0; e<60; e++)
  {
    circle  (20+60*f, 10+60*e, 10);
    circle(-10+60*e, -20+60*f, 10);
  }
}

pushMatrix();
translate(-a*2, -a*2);
for (int x=0; x<=600; x=x+60)
{
  for (int y=0; y<=600; y=y+60)
  {
    fill (random (60, 100), random (120, 255), random(150, 200), 170);
    noStroke();
    stroke(0, random (150, 200), 255, 50);

    quad(x+0, y+0, x+50, y+50, x+ 0, y+100, -50+x, y+50);
  }
}
popMatrix();
for (int x=0; x<=600; x=x+200)
{
  for (int y=0; y<=600; y=y+200)
  {
    fill (255, 20);
    strokeWeight(3);
  }
}

for (int c=0; c<500; c++)
{
  for (int d=0; d<500; d++)
  {
    circle (20+60*d, 10+60*c, 60);
    circle(-10+60*c, -20+60*d, 60);
    stroke(random (100, 255), random (120, 200), random(200, 220));
  }
}
