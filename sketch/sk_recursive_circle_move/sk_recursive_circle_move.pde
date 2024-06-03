void setup()
{
  size( 400, 400 );
  noLoop();  // アニメーションしない
}

void draw()
{
  drawCircle( 200, 200, 200, random( -4, 4 ), 10 );  // 最初の再帰呼び出し
}

/**
  再帰関数：正円を再帰的に小さくし，fYMove分移動しながら描画する．
*/
void drawCircle( float fX, float fY, float fSize, float fYMove, int iLevel )
{
  if( iLevel > 0 )  // 再帰の継続条件
  {
    // 正円描画
    circle( fX, fY, fSize );
    
    drawCircle( fX + fYMove, fY + fYMove, fSize * 0.8, fYMove, iLevel - 1 );  // 再帰呼び出し
  }
}
