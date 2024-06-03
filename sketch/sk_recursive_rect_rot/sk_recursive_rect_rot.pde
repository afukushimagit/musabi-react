void setup()
{
  size( 400, 400 );
  noLoop();  // アニメーションしない
}
void draw()
{
  drawRect( 0, 150, 12 );  // 最初の再帰呼び出し
}

/**
  再帰関数：矩形（長方形）をを再帰的に時計回りor反時計回りに回転しながら描画する．
*/
void drawRect( float fRot, float fHeight, int iLevel )
{
  if( iLevel > 0 )  // 再帰の継続条件
  {
    // 矩形描画
    pushMatrix();
    translate( 200, 200 );
    rotate( radians( fRot ) );
    
    fill( 250 - iLevel * 10 );
    rect( -8, 10, 16, fHeight );
    popMatrix();
    
    drawRect( fRot + 18, fHeight * 0.95, iLevel - 1 );  // 再帰呼び出し：時計回り
    drawRect( fRot - 16, fHeight * 0.95, iLevel - 1 );  // 再帰呼び出し：反時計回り
  }
}
