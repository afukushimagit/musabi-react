size(500, 500);
background(0);
noStroke();
fill(255, 255, 0);
float c;
for (int a = 25; a <= 500; a += 50)
{
  for (int b = 25; b <= 500; b += 50)
  {
    c = random(0, 360);
    arc(a, b, 40, 40, radians(c), radians(c+300));
  }
}
