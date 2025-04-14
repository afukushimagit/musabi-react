size(500, 500);      // Window Size
colorMode(RGB, 1.0); // RGB(0.0~1.0)
float fR,fG,fB;      // Window RGB
for(int iX=0; iX<width; iX++)
{
  for(int iY=0; iY<height; iY++)
  {
    
// -----------------------------------
// Edit Here

    fR = sin(radians(iX*iY*90))*sin(radians(iY*200));
    fG = cos(radians(iX+iY))/sin(radians(iY*20));
    fB = sin(radians(iX+iY*90))+tan(radians(iY*iY));
// -----------------------------------

    stroke(fR, fG, fB);
    point(iX,iY);
  }
}

// -----------------------------------
// "K1_[クラス][番号]_[苗字].png"
save("K1_A17_Hara.png");
// -----------------------------------
