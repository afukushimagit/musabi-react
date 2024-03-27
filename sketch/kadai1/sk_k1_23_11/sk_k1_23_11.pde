size(500, 500);      // Window Size
colorMode(RGB, 1.0); // RGB(0.0~1.0)
float fR, fG, fB;      // Window RGB
for (int iX=0; iX<width; iX++)
{
  for (int iY=0; iY<height; iY++)
  {
    fR = sin(iX/0.75)*sin(iY/78.5);
    fG = (tan(iX/0.80+0.41)-sin(iY/7.22*0.5))/tan(iX/0.80+0.41);
    fB = sin(iX/1.0)/1.0+5.0;
    // draw pixel
    stroke(fR, fG, fB);
    point(iX, iY);
  }
}
