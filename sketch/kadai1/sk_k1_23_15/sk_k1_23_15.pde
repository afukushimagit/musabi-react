size(500, 500);      // Window Size
colorMode(RGB, 1.0); // RGB(0.0~1.0)
float fR, fG, fB;      // Window RGB
for (int iX=0; iX<width; iX++)
{
  for (int iY=0; iY<height; iY++)
  {
    /* Example */
    fR = sin(iX+10/30.0)*cos(iY/10.0);
    fG = cos(iX/30.0)*cos(iY+10/10.0);
    fB = tan(iX+20/40.0)*tan(iY+10/40.0);

    // draw pixel
    stroke(fR, fG, fB);
    point(iX, iY);
  }
}
