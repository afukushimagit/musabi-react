void setup()
{
  size( 800, 500 );
  noLoop();  // アニメーションしない
}

void draw()
{
  // 最初の再帰呼び出し
  drawGoldenRect( 70, 40, 0, 400, 10 );
}

/**
  再帰関数：再帰的に黄金比で分割した矩形内に円弧を描画する．
*/
void drawGoldenRect( float fX, float fY, int iDeg, float fRectSize, int iLevel )
{
  pushMatrix();

  // 座標変換
  translate( fX, fY );
  rotate( radians( iDeg ) );
  
  // 正方形
  stroke( 0, 0, 0 );
  rect( 0, 0, fRectSize, fRectSize );

  // 円弧描画
  // 中心点は矩形の右下の頂点
  stroke( 0, 0, 255 );
  arc( fRectSize, fRectSize, 2 * fRectSize, 2 * fRectSize, radians( 180 ), radians( 270 ), OPEN );
  
  if( iLevel > 1 )
  {   
    drawGoldenRect( fRectSize * 1.618, 0, 90, fRectSize * 0.618, iLevel - 1 );
  }
  
  popMatrix();
}
