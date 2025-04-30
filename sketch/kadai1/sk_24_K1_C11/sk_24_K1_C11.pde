size(500, 500);      // Window Size
colorMode(RGB, 1.0); // RGB(0.0~1.0)
float fR,fG,fB;      // Window RGB
for(int iX=0; iX<width; iX++)
{
  for(int iY=0; iY<height; iY++)
  {
    
// -----------------------------------
// Edit Here

    fR = tan(iX-10.0)-cos(iY/10.0);
    fG = sin(iX/5.0)+cos(iY/1.0)*tan(iY/50.0);
    fB = 1.0;
// -----------------------------------

    stroke(fR, fG, fB);
    point(iX,iY);
  }
}

// -----------------------------------
// "K1_[クラス][番号]_[苗字].png"
save("K1_A12_Fukushima.png");
// -----------------------------------　
