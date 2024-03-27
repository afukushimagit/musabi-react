size(500, 500);      // Window Size
colorMode(RGB, 1.0); // RGB(0.0~1.0)
float fR, fG, fB;      // Window RGB
for (int iX=0; iX<width; iX++)
{
  for (int iY=0; iY<height; iY++)
  {
    /* Example */
    fR = cos((iX/50.0)*sin(iY/130.0)-tan(iX/4.0));
    fG = sin((iX/55.0)*sin(iY/80.0)-tan(iX/4.0));
    fB = (pow(iX-130, 2.5)+pow(iY+200, 1.8))/(10.0*iY*iX);

    // draw pixel
    stroke(fR, fG, fB);
    point(iX, iY);
  }
}
