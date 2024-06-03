void setup()
{
  size( 400, 400 );
  noLoop();  // アニメーションしない
}

void draw()
{
  drawCircle( width/2, 200, 5 );  // 最初の再帰呼び出し
}

/**
  再帰関数：円を再帰的に左右に描画する
*/
void drawCircle( int iX, int iRadius, int iLevel )
{
  ellipseMode( RADIUS );
  circle( iX, height/2, iRadius );
  
  if( iLevel > 0 )
  {
    drawCircle( iX - iRadius/2, iRadius/2, iLevel - 1 );  // 再帰呼び出し：左
    drawCircle( iX + iRadius/2, iRadius/2, iLevel - 1 );  // 再帰呼び出し：右
  }
}
