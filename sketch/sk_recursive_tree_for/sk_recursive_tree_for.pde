void setup()
{
  size( 600, 600 );
  noLoop();  // アニメーションしない
}

void draw()
{
  // 40本の樹木を描画する．
  for( int iTree = 0; iTree < 40; iTree++ )
  {
    // 樹木の開始点をランダムに決定する．
    float fBeginX = random( 40, 560 );
    float fBeginY = random( 400, 600 );
    
    // 最初の再帰呼び出し
    drawTree( fBeginX, fBeginY, random( 50, 100 ), -90, 8 );
  }
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
    drawTree( fEndX, fEndY, fLength * 0.65, fRot + 15, iLevel - 1 );
    drawTree( fEndX, fEndY, fLength * 0.65, fRot - 15, iLevel - 1 );
  }
}
