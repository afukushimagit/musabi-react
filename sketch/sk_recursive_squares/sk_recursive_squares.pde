void setup()
{
  size( 400, 400 );
  noLoop();  // アニメーションしない
}
void draw()
{
  drawSquare( 0, 0, 400, 5 );  // 最初の再帰呼び出し
}

/**
  再帰関数：正方形を再帰的に左上と右下に描画する．
*/
void drawSquare( float fX, float fY, float fSize, int iLevel )
{
  square( fX, fY, fSize );
  
  if( iLevel > 0 )  // 再帰の継続条件
  {
    float fNewSize = fSize/2;  // 子の大きさ
    drawSquare( fX, fY, fNewSize, iLevel - 1 );                        // 再帰呼び出し：左上
    drawSquare( fX + fNewSize, fY + fNewSize, fNewSize, iLevel - 1 );  // 再帰呼び出し：右下
  }
}
