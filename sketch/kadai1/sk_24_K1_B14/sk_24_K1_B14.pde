size(500, 500);      // Window Size
colorMode(RGB, 1.0); // RGB(0.0~1.0)
float fR,fG,fB;      // Window RGB
for(int iX=0; iX<width; iX++)
{
  for(int iY=0; iY<height; iY++)
  {
    
// -----------------------------------
// Edit Here

    fR = tan(iX / 9.0) + 4500 * sin(iX / 30.0) / cos(iY / 20.0) * 0.5 ;
    fG = tan(iX * 3.0) * sin(iY / 15.0) /0.3;
    fB = tan(iX / 10.0 + iY / 20.0) * cos(iY / 10.0) * 0.5 / sin(iY / 2.0);

// -----------------------------------

    stroke(fR, fG, fB);
    point(iX,iY);
  }
}

// -----------------------------------
// "K1_[クラス][番号]_[苗字].png"
save("K1_A12_fukushima.png");
// -----------------------------------
