size(500, 500);
colorMode(RGB, 500, 500, 500);
background(500, 0, 0);
strokeWeight(2.5);
stroke(500, 500, 500);
for (int x=0; x<600; x=x+50)
{
  for (int y=0; y<600; y=y+100)
  {
    quad(x+0, -20+y,
      x+0, y+30,
      x+10, y+50,
      x+10, y);
    quad(x+15, y+50,
      x+15, y,
      x+25, -20+y,
      x+25, y+30);
    quad(x+25, y+30,
      x+25, y+80,
      x+35, y+100,
      x+35, y+50);
    quad(x+40, y+100,
      x+40, y+50,
      x+50, y+30,
      x+50, y+80);
  }
}
for (int x=0; x<600; x=x+50)
{
  for (int y=0; y<600; y=y+100)
  {
    line(x+12, y+55, x+12, y+100);
    line(x+37, y+0, x+37, y+50);
  }
}
