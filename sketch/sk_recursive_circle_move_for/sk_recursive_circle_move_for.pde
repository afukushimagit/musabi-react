void setup()
{
  size( 400, 400 );
  noLoop();  // アニメーションしない
}

void draw()
{
  for( float fY = 50; fY < 400; fY += 100 )
  {
    for( float fX = 50; fX < 400; fX += 100 )
    {
      drawCircle( fX, fY, 100, random( -2, 2 ), 22 );  // 最初の再帰呼び出し
    }
  }
}

/**
  再帰関数：正円を再帰的に小さくし，fYMove分移動しながら描画する．
*/
void drawCircle( float fX, float fY, float fSize, float fYMove, int iLevel )
{
  if( iLevel > 0 )  // 再帰の継続条件
  {
    // 正円描画
    fill( 34 * ( iLevel % 8 ) );
    circle( fX, fY, fSize );
    
    drawCircle( fX + fYMove, fY + fYMove, fSize * 0.92, fYMove, iLevel - 1 );  // 再帰呼び出し
  }
}
