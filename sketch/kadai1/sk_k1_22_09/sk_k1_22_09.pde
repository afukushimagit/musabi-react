size(500, 500);      // Window Size
colorMode(RGB, 1.0); // RGB(0.0~1.0)
float fR, fG, fB;      // Window RGB
for (int iX=0; iX<width; iX++)
{
  for (int iY=0; iY<height; iY++)
  {
    /* Example */
    fR = sin(iY/10.0+cos(iX/20.0))/sin(iX);
    fG = sin(iX/10.0+sin(iY/20.0))/sin(iY);
    fB = sin(iX/10.0*cos(iY/20.0))+sin(iX);
    // draw pixel
    stroke(fR, fG, fB);
    point(iX, iY);
  }
}
