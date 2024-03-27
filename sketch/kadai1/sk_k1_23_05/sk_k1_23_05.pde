size(500, 500);      // Window Size
colorMode(RGB, 1.0); // RGB(0.0~1.0)
float fR, fG, fB;      // Window RGB
for (int iX=0; iX<width; iX++)
{
  for (int iY=0; iY<height; iY++)
  {
    /* Example */
    fR = sin(iX/10.0)/(2.0+0.5)+1;
    fG = sin(iY/3.0+ sin(iY/10.0))*2/2.0+0.5;
    fB = sin((iX + iY)/12.0)+sin(iX / 10.0+iY/3.0)/2.0 + 0.5;
    // draw pixel
    stroke(fR, fG, fB);
    point(iX, iY);
  }
}
