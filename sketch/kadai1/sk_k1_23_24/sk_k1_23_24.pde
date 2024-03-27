size(500, 500);      // Window Size
colorMode(RGB, 1.0); // RGB(0.0~1.0)
float fR, fG, fB;      // Window RGB
for (int iX=0; iX<width; iX++)
{
  for (int iY=0; iY<height; iY++)
  {
    fR = pow(sin(iX/20.0), 2) * cos(iY/20.0) * 0.5 + 0.5;
    fG = pow(sin(iX/15.0), 2) * cos(iY/15.0) * 0.5 + 0.5;
    fB = pow(sin(iX/10.0 + iY/20.0), 2) * cos(iY/10.0) * 0.5 + 0.5;

    // draw pixel
    stroke(fR, fG, fB);
    point(iX, iY);
  }
}
