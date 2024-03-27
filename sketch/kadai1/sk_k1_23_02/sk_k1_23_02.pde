size(500, 500);
colorMode(RGB, 1.0);
float fR, fG, fB;
for (int iX=0; iX<width; iX++)
{
  for (int iY=0; iY<height; iY++)
  {
    fR = sin(random(200))-cos(iY/50.0);
    fG = tan(iX*iY);
    fB = cos(pow(iX+200, 2)+pow(iY-1, 1));

    // draw pixel
    stroke(fR, fG, fB);
    point(iX, iY);
  }
}
