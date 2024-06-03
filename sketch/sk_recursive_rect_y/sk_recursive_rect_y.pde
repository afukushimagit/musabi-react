void setup()
{
  size( 400, 400 );
  noLoop();  // アニメーションしない
}

void draw()
{
  drawRect( 400, 1, 19 );  // 最初の再帰呼び出し
}

/**
  再帰関数：矩形を再帰的に小さくし，上に移動しながらグレー色で描画する．
*/
void drawRect( float fY, float fScale, int iLevel )
{
  if( iLevel > 0 )  // 再帰の継続条件
  {
    // 矩形描画
    rectMode(CENTER);
    fill( 255 - iLevel * 10 );
    rect( 200, fY, 400 * fScale, 80 * fScale );
    
    drawRect( fY - iLevel * 2, fScale * 0.9, iLevel - 1 );  // 再帰呼び出し
  }
}
