/**************************************************************
架空のチェック模様を生成した。
主に縦と横の線が強く見えるように濃さを調整し、透明感のあるチェック模様を意識した。

 **************************************************************/
size(500, 500);      // Window Size

// -----------------------------------
// Edit Here

background(0);

blendMode(SCREEN);//横線の大きな流れの部分

for (int ix=0; ix<500; ix+=40)
{
  for (int iy=0; iy<500; iy+=40)
  {
    strokeWeight(1.5);  
    
    stroke(random(30, 255), random(50, 255), random(50, 255));
    line(ix, iy, ix+80, iy+10);
    line(ix+40, iy, ix, iy+10);  
  }
}

blendMode(SCREEN);//背景の網目

for (int ix=-20; ix<500; ix+=15)
{
  for (int iy=-20; iy<500; iy+=30)
  {
    strokeWeight(0.4);  
    
    stroke(random(30, 255), random(50, 255), random(50, 255));
    line(ix, iy, ix+80, iy+40);
    line(ix+40, iy, ix, iy+40);  
  }
}

blendMode(ADD);//手前の縦線

strokeWeight( 50 );
for ( int iX = -90; iX < 1200; iX += 100 )
{
  stroke( 40, 50, 90 );
  line( iX+142, 0, iX+142, 500 );
}

// -----------------------------------


// -----------------------------------
// "K2_[クラス][番号]_[苗字].png"
save("K2_A12_fukushima.png");
// -----------------------------------
