size(500, 500);      // Window Size
colorMode(RGB, 1.0); // RGB(0.0~1.0)
float fR,fG,fB;      // Window RGB
for(int iX=0; iX<width; iX++)
{
  for(int iY=0; iY<height; iY++)
  {

// -----------------------------------
// Edit Here

    fR = sin(iX/10.0)/2.0+0.5;
    fG = sin(iX/10.0)/2.0+0.5;
    fB = sin(iX/10.0)/2.0+0.5;
// -----------------------------------

    stroke(fR, fG, fB);
    point(iX,iY);
  }
}

// -----------------------------------
// "K1[クラス][番号][苗字].png"
save("K1_A13_Takinami.png");
// -----------------------------------
