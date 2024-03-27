size(500, 500);      // Window Size
colorMode(RGB, 1.0); // RGB(0.0~1.0)
float fR, fG, fB;      // Window RGB
for (int iX=0; iX<width; iX++)
{
  for (int iY=0; iY<height; iY++)
  {
    /* Example */
    fR = 0.0;
    fG = tan(pow(iX*2, 2))/0.4*tan(pow(iY*2, 2))/0.2;
    fB = sin(pow(iX*2, 2))/0.2*sin(pow(iY*2, 2))/0.4;

    // draw pixel
    stroke(fR, fG, fB);
    point(iX, iY);
  }
}
