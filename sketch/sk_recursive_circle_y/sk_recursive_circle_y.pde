void setup()
{
  size( 400, 400 );
  noLoop();  // アニメーションしない
}

void draw()
{
  drawCircle( 40, 20 );  // 最初の再帰呼び出し
}

/**
  再帰関数：正円を再帰的に下に移動しながら描画する．
*/
void drawCircle( float fY, int iLevel )
{
  if( iLevel > 0 )  // 再帰の継続条件
  {
    // 正円描画
    circle( 200, fY, 80 );
    
    drawCircle( fY + iLevel, iLevel - 1 );  // 再帰呼び出し
  }
}
