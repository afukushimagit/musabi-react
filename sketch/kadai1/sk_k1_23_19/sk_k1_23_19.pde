size(500, 500);      // Window Size
colorMode(RGB, 1.0); // RGB(0.0~1.0)
float fR, fG, fB;      // Window RGB
for (int iX=0; iX<width; iX++)
{
  for (int iY=0; iY<height; iY++)
  {
    /* Example */
    fR = sin(iY*110/330)*68;
    fG = tan(iX/5)/iY*iX;
    fB = tan(iY*300)*sin(10+30*iX);

    // draw pixel
    stroke(fR, fG, fB);
    point(iX, iY);
  }
}
