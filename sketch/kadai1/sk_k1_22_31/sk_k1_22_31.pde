size(500, 500);
colorMode(RGB, 1.0);
float fR, fG, fB;
for (int iX=0; iX<width; iX++)
{
  for (int iY=0; iY<height; iY++)
  {
    fR =(sin(iX/10)*tan(iY/10))+((cos(5*iY*iX)/10)+(tan(50*iX*iY)/20))*8+(sin((pow(iX-250, 2)+pow(iY-230, 2))/100))*1.6;
    fG = (1/((pow(iX-250, 2)*pow(iY-230, 2))/100))*100*(tan(iX*iY*10000))*5;
    fB = (tan(iX+10.0)/sin(iY/10))*50-(sin(iX*iY)/cos(iX*iY)/10000);

    stroke(fR, fG, fB);
    point(iX, iY);
  }
}
