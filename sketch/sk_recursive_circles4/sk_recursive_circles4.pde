void setup()
{
  size( 400, 400 );
  noLoop();  // アニメーションしない
}

void draw()
{
  drawCircle( width/2, height/2, 200, 5 );  // 最初の再帰呼び出し
}

/**
  再帰関数：円を再帰的に上下左右に描画する
*/
void drawCircle( float fX, float fY, float fRadius, int iLevel )
{
  ellipseMode( RADIUS );
  circle( fX, fY, fRadius );
  
  if( iLevel > 0 )
  {
    float fDistance = fRadius * 0.585;  // 中心から子まで距離
    float fNewRadius = fRadius * 0.41; // 子の半径
    drawCircle( fX - fDistance, fY, fNewRadius, iLevel - 1 );  // 再帰呼び出し：左
    drawCircle( fX + fDistance, fY, fNewRadius, iLevel - 1 );  // 再帰呼び出し：右
    drawCircle( fX, fY - fDistance, fNewRadius, iLevel - 1 );  // 再帰呼び出し：上
    drawCircle( fX, fY + fDistance, fNewRadius, iLevel - 1 );  // 再帰呼び出し：下
  }
}
