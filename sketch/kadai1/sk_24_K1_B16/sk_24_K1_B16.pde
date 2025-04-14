size(500, 500);      // Window Size
colorMode(RGB, 1.0); // RGB(0.0~1.0)
float fR,fG,fB;      // Window RGB
for(int iX=0; iX<width; iX++)
{
  for(int iY=0; iY<height; iY++)
  {
    
// -----------------------------------
// Edit Here

    fR = 60%tan(pow(cos(iY/400.10),sin(iX/30.0)));
    fG = 20%tan(pow(cos(iY/500.10),cos(iX/20.0)));
    fB = 30%tan(pow(cos(iY/500.10),cos(iX/50.0)));
    
// -----------------------------------

    stroke(fR, fG, fB);
    point(iX,iY);
  }
}

// -----------------------------------
// "K1_[クラス][番号]_[苗字].png"
save("K1_B16_Nishi.png");
// -----------------------------------
