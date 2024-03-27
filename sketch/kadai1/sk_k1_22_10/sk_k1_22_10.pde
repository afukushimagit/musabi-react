size(500, 500);      // Window Size
colorMode(RGB, 1.0); // RGB(0.0~1.0)
float fR, fG, fB;      // Window RGB
for (int iX=0; iX<width; iX++)
{
  for (int iY=0; iY<height; iY++)
  {
    fR=tan(iX/40.0)*sin(iY/40.0);
    fG=tan(iX/60.0)*sin(iY/60.0);
    fB=tan(iX*120.0)*sin(iY*120.0);
    // draw pixel
    stroke(fR, fG, fB);
    point(iX, iY);
  }
}
