void setup()
{
  size( 600, 600 );
  noLoop();  // アニメーションしない
}

void draw()
{
  drawTree( width/2, height, 140, -90, 12 );
}

/**
  再帰関数：線を再帰的に短くし，回転させながら２分岐描画する．
*/
void drawTree( float fBeginX, float fBeginY, float fLength, float fRot, int iLevel )
{
  if( iLevel > 0 )
  {
     // 線の終点
    float fEndX = fBeginX + cos( radians( fRot ) ) * fLength;
    float fEndY = fBeginY + sin( radians( fRot ) ) * fLength;
    
    // 線の描画
    line( fBeginX, fBeginY, fEndX, fEndY );
    
    // 再帰呼び出し
    drawTree( fEndX, fEndY, fLength * 0.75, fRot + 10, iLevel - 1 );  // 回転を20から10へ
    drawTree( fEndX, fEndY, fLength * 0.75, fRot - 10, iLevel - 1 );  // 回転を20から10へ
  }
}
