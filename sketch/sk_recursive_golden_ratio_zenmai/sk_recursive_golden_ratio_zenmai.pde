void setup()
{
  size( 600, 600 );
  noLoop();  //アニメーションしない
}

void draw()
{
  background( 0, 20, 0 );
  
  // 全体の位置調整
  translate( -10, height + 200 );
  rotate( radians( -80 ) );
  
  // 80本ランダム描画
  for( int iTsuru = 0; iTsuru < 80; iTsuru++ )
  {
    pushMatrix();
    
    // 若干スケール
    scale( random( 0.8, 1.0 ) );
    
    // 最初の再帰呼び出し
    drawGoldenRect( random( -40, 300 ), random( -80, 200 ), random( -4, 4 ), 400, 10 );
    
    popMatrix();
    
    // 奥行を出すための半透明黒
    noStroke();
    fill( 0, 40 );
    rect( 200, -200, 1000, 1000 );
  }
}

/**
  再帰関数：再帰的に黄金比で分割した矩形内に円弧を描画する．
*/
void drawGoldenRect( float fX, float fY, float fDeg, float fRectSize, int iLevel )
{
  pushMatrix();

  // 座標変換
  translate( fX, fY );
  rotate( radians( fDeg ) );

  // 円弧描画
  strokeWeight( 20 );
  noFill();
  stroke( random( 10, 44 ), random( 255, 200 ) - fRectSize/3.0, random( 40, 84 ) );
  arc( fRectSize, fRectSize, 2 * fRectSize, 2 * fRectSize, radians( 180 ), radians( 270 ), OPEN );
  
  if( iLevel > 1 )
  {   
    drawGoldenRect( fRectSize * 1.618, 0, 90, fRectSize * 0.618, iLevel - 1 );
  }
  
  popMatrix();
}
