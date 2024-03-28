size(500, 500);
background(255);
noStroke();
for (int i= 0; i <= width; i+=25)
{
  for (int j = 0; j <= height; j+=25)
  {
    fill(255, 255-i, 255-j, 150);
    ellipse(j, i, 25 -j/10, 25 -j/10);
  }
}
for (int i= 0; i <= width; i+=25)
{
  for (int j = 0; j <= height; j+=25)
  {
    fill(255-i, 255-j, 255, 150);
    ellipse(i, j, 25 -j/10, 25 -j/10);
  }
}
