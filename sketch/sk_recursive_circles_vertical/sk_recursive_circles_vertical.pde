void setup()
{
  size( 400, 400 );
  noLoop();  // アニメーションしない
}

void draw()
{
  drawCircle( height/2, 200, 5 );  // 最初の再帰呼び出し
}

/**
  再帰関数：円を再帰的に上下に描画する
*/
void drawCircle( int iY, int iRadius, int iLevel )
{
  ellipseMode( RADIUS );
  circle( width/2, iY, iRadius );
  
  if( iLevel > 0 )
  {
    drawCircle( iY - iRadius/2, iRadius/2, iLevel - 1 );  // 再帰呼び出し：上
    drawCircle( iY + iRadius/2, iRadius/2, iLevel - 1 );  // 再帰呼び出し：下
  }
}
