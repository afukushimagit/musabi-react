void setup()
{
  size( 400, 400 );
  noLoop();  // アニメーションしない
}

void draw()
{
  drawSquare( 200, 10 );  // 最初の再帰呼び出し
}

/**
  再帰関数：正方形を再帰的に小さくしながら描画する．
*/
void drawSquare( float fSize, int iLevel )
{
  if( iLevel > 0 )  // 再帰の継続条件
  {
    // 正方形描画
    square( 100, 100, fSize );
    
    drawSquare( fSize * 0.8, iLevel - 1 );  // 再帰呼び出し
  }
}
