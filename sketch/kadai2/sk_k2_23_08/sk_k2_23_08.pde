size(500, 500);
colorMode(HSB, 500);
background(300);
strokeWeight(0.5);
noFill();

for (int iX=0; iX<550; iX+=20)
{
  for (int iY=0; iY<550; iY+=50)
  {
    stroke(iX, 500, 500);
    ellipse(iX, iY, 400, 50);
  }
}
