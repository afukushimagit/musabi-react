size(500, 500);      // Window Size
colorMode(RGB, 1.0); // RGB(0.0~1.0)
float fR, fG, fB;      // Window RGB
for (int iX=0; iX<width; iX++)
{
  for (int iY=0; iY<height; iY++)
  {
    /* Example */
    fR =  1.0/((pow(iX-250, 2)/iY+pow(iY-100, 2)/iY)/50.0)+0.5 - (90+pow(1.1, iY*0.1)*cos(radians(10*iY))*8)/125;
    fG =  1.0/((pow(iX-250, 2)/iY+pow(iY-100, 2)/iY)/50.0)+0.5 - (90+pow(1.1, iY*0.1)*cos(radians(10*iY))*8)/125;
    fB =  sin(random(100));

    // draw pixel
    stroke(fR, fG, fB);
    point(iX, iY);
  }
}
