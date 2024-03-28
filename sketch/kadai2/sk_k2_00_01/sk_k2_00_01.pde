size(500, 500);
background(50);
colorMode(RGB, 100);
stroke(200);

float fx=0;
float fy=20;

for (int ix=0; ix<500; ix+=40)
{
  for (int iy=0; iy<500; iy+=40)
  {
    noFill();
    stroke(random(0, 100), random(0, 100), random(0, 100));//枠線色
    triangle(fx+ix, fy+iy, fx+10+ix, fy-20+iy, fx+ix+20, fy+iy);//上向きの三角形
    triangle(fx+ix+5, fy+iy+10, fx+10+ix, fy+iy, fx+ix+15, fy+iy+10);//内側の三角形
    triangle(fx+iy, fy+ix, fx+10+iy, fy+20+ix, fx+iy+20, fy+ix);//下向きの三角形
    triangle(fx+iy+5, fy+ix-10, fx+10+iy, fy+ix, fx+iy+15, fy+ix-10);//内側の三角形
  }
}
