/**************************************************************
Sakuhin Caption...
//ここにはコンセプト、雑に書くと先生が評価しずらいからちゃんと書く

波の線を回転させて、花びらのような模様を表現しました。
色や位相のちがうsin波を複数本回転させています。

 **************************************************************/
size(500, 500);      // Window Size

// -----------------------------------
// Edit Here

colorMode(RGB,255,255,255);

for ( int iX = 0 ; iX < 500 ; iX += 1 ) //背景グラデーション
{
  for ( int iY = 0 ; iY < 500 ; iY += 1 )
  {
    stroke(iX / 1.7, 0, iY*1.1);
    point(iX,iY);
  }
}


translate( 250, 250 ); //座標をアートボードの中心へ移動


for( int iR = 0; iR < 60; iR++ ) //黒い周波
{
  for ( float iZ = -400; iZ < 400; iZ += 0.1)
  {
    strokeWeight( 3 );
    
    blendMode(MULTIPLY);
    stroke( 0, 1 );
    point( iZ, sin( radians(iZ) ) * 50 );
    
    rotate( radians( iR*27 ) );
  }
}


for( int iR = 0; iR < 100; iR++ ) //白い周波
{
  for ( float iZ = -400; iZ < 400; iZ += 0.1)
  {
    strokeWeight( 1 );
    
    blendMode(SCREEN); //周波１
    stroke( 255, 20 );
    point( iZ, -sin( radians(iZ) ) * 50 );
    
    blendMode(SCREEN); //周波２
    stroke( 255, 10 );
    point( iZ, sin( radians(iZ) ) * 50 );
    
    rotate( radians( iR*27 ) );
  }
}

// -----------------------------------


// -----------------------------------
// "K2_[クラス][番号]_[苗字].png"
save("K2_A12_Fukushima.png");
// -----------------------------------
