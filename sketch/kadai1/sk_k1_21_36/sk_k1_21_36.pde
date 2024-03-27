size(500, 500);      // Window Size
colorMode(RGB, 1.0); // RGB(0.0~1.0)
float fR, fG, fB;      // Window RGB
for (int iX=0; iX<width; iX++)
{
  for (int iY=0; iY<height; iY++)
  {
    fR=tan((pow(iX-250, 10)+pow(iY-250, 2))/iY+100);
    fG=cos((pow(iX-100, 2)+pow(iY-200, 2))/10);
    fB=tan((pow(iX-100, 10)+pow(iY-250, 2))/150/iY+pow(iY-100, 2)/iY);

    // draw pixel
    stroke(fR, fG, fB);
    point(iX, iY);
  }
}
