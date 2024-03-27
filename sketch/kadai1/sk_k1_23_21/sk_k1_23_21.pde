size(500, 500);      // Window Size
colorMode(RGB, 1.0); // RGB(0.0~1.0)
float fR, fG, fB;      // Window RGB
for (int iX=0; iX<width; iX++)
{
  for (int iY=0; iY<height; iY++)
  {
    /* Example */
    fG = 1*tan(100*sqrt((pow((iX-250), 2)+pow((iY-250), 2))));
    fB = 100*tan(100*sqrt((pow((iX-250), 2)+pow((iY-250), 2))));
    fR = 0.2*tan(100*sqrt((pow((iX-250), 2)+pow((iY-250), 2))));

    // draw pixel
    stroke(fR, fG, fB);
    point(iX, iY);
  }
}
