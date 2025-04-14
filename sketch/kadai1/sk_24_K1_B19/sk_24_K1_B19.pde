size(500, 500);      // Window Size
colorMode(RGB, 1.0); // RGB(0.0~1.0)
float fR,fG,fB;      // Window RGB
for(int iX=0; iX<width; iX++)
{
  for(int iY=0; iY<height; iY++)
  {
    
// -----------------------------------
// Edit Here

    fR = sin(iX + 20.0 / (10.0 * 5.0)) / 20 + tan(iY / 50.0 );
    fG = cos((iX / 20.0) / 6.5 + 5.0) * tan(iY / 10.0) / 2.0 / sin(iX  / 10.0);
    fB = sin((iX / 10.0) / 10.0 + 0.5 ) * 2/3 / cos(iY * 2.0);
// -----------------------------------

    stroke(fR, fG, fB);
    point(iX,iY);
  }
}

// -----------------------------------
// "K1_[クラス][番号]_[苗字].png"
save("K1_B19_Fujishiro.png");
// -----------------------------------
