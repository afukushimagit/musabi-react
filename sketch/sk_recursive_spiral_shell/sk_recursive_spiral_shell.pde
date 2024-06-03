void setup()
{
  size(400, 400);
  noLoop();  // アニメーションしない
}

void draw()
{
  stroke(0);
  strokeWeight(2);
  drawSpiral( 300, 300, 100, 160, 60 ); // 最初の再帰呼び出し
}

/**
  再帰関数：線を再帰的に短くし，回転させながら描画する．
*/
void drawSpiral( float fBeginX, float fBeginY, float fLength, float fRot, int iLevel )
{
  if ( iLevel > 0 )  // 再帰の継続条件
  {
    // 線の終点
    float fEndX = fBeginX + cos( radians( fRot ) ) * fLength;
    float fEndY = fBeginY + sin( radians( fRot ) ) * fLength;
    
    line( fBeginX, fBeginY, fEndX, fEndY ); // 線を描画
    
    drawSpiral( fEndX, fEndY, fLength * 0.95, fRot + 35, iLevel - 1 ); // 再帰呼び出し
  }
}
