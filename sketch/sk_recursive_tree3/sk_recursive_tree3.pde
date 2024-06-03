void setup()
{
  size( 600, 600 );
  noLoop();  // アニメーションしない
}

void draw()
{
  drawTree( width/2, height, 120, -90, 9 );
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
    strokeWeight( iLevel / 9.0 );  // 線を細くしていく
    line( fBeginX, fBeginY, fEndX, fEndY );
    
    // 再帰呼び出し（３分岐）
    // 枝の角度ランダム
    drawTree( fEndX, fEndY, fLength * 0.80, fRot + random( 20, 40 ), iLevel - 1 );
    drawTree( fEndX, fEndY, fLength * 0.80, fRot + random( -20, 20 ), iLevel - 1 );
    drawTree( fEndX, fEndY, fLength * 0.80, fRot - random( 20, 40 ), iLevel - 1 );
  }
}
