void setup()
{
  size( 600, 600 );
  noLoop();    // アニメーションしない
}

void draw()
{
  // シェルピンスキーのギャスケットを表状に並べる．
  for( int iY = 120; iY < 700; iY += 175 )
  {
    for( int iX = 100; iX < 600; iX += 200 )
    {
      drawTriangle( iX, iY, 200, 6 );  // 最初の再帰呼び出し
    }
  }
}

void drawTriangle( float fCenterX, float fCenterY, float fWidth, int iLevel )
{
  if( iLevel > 0 )
  {    
    // 三角形の内接円の半径
    float fInCircleRadius = ( fWidth/2.0 ) * tan( radians( 30 ) );
    
    // 三角形の高さ
    float fHeight = fWidth * sin( radians( 60 ) );
    
    // 三角形の描画
    triangle( fCenterX, fCenterY - ( fHeight - fInCircleRadius ),
              fCenterX + fWidth/2.0, fCenterY + fInCircleRadius,
              fCenterX - fWidth/2.0, fCenterY + fInCircleRadius );

    // 再帰呼び出し（上，左下，右下）
    float fDistanceX = fInCircleRadius * cos( radians( 30 ) );
    float fDistanceY = fInCircleRadius * sin( radians( 30 ) );
    drawTriangle( fCenterX, fCenterY - fInCircleRadius, fWidth/2.0, iLevel - 1 );
    drawTriangle( fCenterX + fDistanceX, fCenterY + fDistanceY, fWidth/2.0, iLevel - 1 );
    drawTriangle( fCenterX - fDistanceX, fCenterY + fDistanceY, fWidth/2.0, iLevel - 1 );
  }
}
