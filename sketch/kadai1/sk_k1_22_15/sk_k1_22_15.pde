size(500, 500);      // Window Size
colorMode(RGB, 1.0); // RGB(0.0~1.0)
float fR, fG, fB;      // Window RGB
for (int iX=0; iX<width; iX++)
{
  for (int iY=0; iY<height; iY++)
  {
    /* Example */
    fR = sin((pow(iY-250, 2)/iX+pow(iY-250, 2)/iX)/40);
    fG = tan(iX/5.0)*sin(iY/9.2)*cos(iX/1.2);
    fB = cos((pow(iY-5.5, 10)/pow(iY-0.5, 10)*pow(iX*5.5, 1.5))/3.0);

    // draw pixel
    stroke(fR, fG, fB);
    point(iX, iY);
  }
}
