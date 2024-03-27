size(500, 500);      // Window Size
colorMode(RGB, 1.0); // RGB(0.0~1.0)
float fR, fG, fB;      // Window RGB
for (int iX=0; iX<width; iX++)
{
  for (int iY=0; iY<height; iY++)
  {
    fR=tan(iY+10)*tan(iX+10);
    fG=0.1/((pow(iX-250, 2)/iY+pow(iY+250, 1))+sin(radians(iY*100)))+(sin(iX+iX))+cos(iY/10.0)+cos(iX/10.0)+tan(iY/50.0);
    fB=sin(iY/10.0)+sin(iX/10.0)+(pow(iX-250, 2)+pow(iY+250, 2));

    stroke(fR, fG, fB);
    point(iX, iY);
  }
}
