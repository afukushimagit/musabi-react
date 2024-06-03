void setup()
{
  size( 800, 800 );
  noLoop();    // アニメーションしない
}

void draw()
{
  translate( width/2, height/2 );
  
  drawTriangle( -232, 267, 464, 7 );  // 左下
  drawTriangle( -464, -133, 464, 7 ); // 左上
  drawTriangle( 0, -133, 464, 7 );    // 上
  drawTriangle( 464, -133, 464, 7 );  // 右上
  drawTriangle( 232, 267, 464, 7 );   // 右下
  
  rotate( radians( 180 ) );

  // 逆さ
  drawTriangle( -232, 267, 464, 7 );  // 左上
  drawTriangle( -464, -133, 464, 7 ); // 左下
  drawTriangle( 0, -133, 464, 7 );    // 上
  drawTriangle( 464, -133, 464, 7 );  // 右下
  drawTriangle( 232, 267, 464, 7 );   // 右上
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
    fill( random( 200, 255 ), random( 10, 65 ), random( 8, 30 ) );
    strokeWeight( 0.5 );
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
