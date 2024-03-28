size(500, 500);
background(255);

stroke(200);
blendMode(SUBTRACT);

for (int ix=10; ix<500; ix+=40)
{
  for (int iy=10; iy<500; iy+=40)
  {
    strokeWeight(20);  //円（黒い部分）の隙間

    stroke(random(0, 100), random(0, 120), random(0, 80));
    circle(ix, iy, 45); //黒い部分
  }
}
blendMode(SCREEN);

for (int ix=20; ix<500; ix+=40)
{
  for (int iy=20; iy<500; iy+=40)
  {
    strokeWeight(1);  //円の隙間

    stroke(random(50, 255), random(50, 255), random(50, 255));
    line(ix, iy, ix+20, iy+20);
    line(ix+20, iy, ix, iy+20);  //バツ印
    circle(ix+20, iy, 2);
    circle(ix, iy+20, 2);
    circle(ix+20, iy+20, 2);
    circle(ix, iy, 2); //罰の周りの点
  }
}
