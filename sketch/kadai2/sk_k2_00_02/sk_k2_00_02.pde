size(500, 500);
background(0);

float x=0;
float y=0;

for (int iX=0; iX<100 && iX<100; iX++)
{
  x=x+6;
  y=y+5;
  stroke(10, x+100, y+200, 150);
  noFill();
  ellipse(x, y, x-400, y+50);
}

x=0;
y=100;
for (int iY=0; iY<100 && iY<100; iY++)
{
  x=x+4;
  y=y+6;
  stroke(10, x+100, y+200, 150);
  noFill();
  ellipse(x, y, x+180, y-200);
}
