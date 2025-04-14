size(500, 500);      // Window Size
colorMode(RGB, 1.0); // RGB(0.0~1.0)
float fR,fG,fB;      // Window RGB
for(int iX=0; iX<width; iX++)
{
  for(int iY=0; iY<height; iY++)
  {
    
// -----------------------------------
// Edit Here

    fR = cos(iY*tan(iY/20)/2)-sin(iX*tan(iY/20)/2);
    fG = sin(iY*tan(iY/20)/2)-cos(iX*tan(iY/20)/2);
    fB = 1;
// -----------------------------------

    stroke(fR, fG, fB);
    point(iX,iY);
  }
}

// -----------------------------------
// "K1_[クラス][番号]_[苗字].png"
save("K1_D03_Okuma.png");
// -----------------------------------
