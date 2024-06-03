void setup()
{
  size( 400, 400 );
  noLoop();  // アニメーションしない
}

void draw()
{
  translate( width/2, height/2 );
  
  // 72°ずつ回転しながら繰り返す．
  for( int iRot = 0; iRot < 360; iRot += 72 )
  {
    drawSpiral( 0, 0, 70, 0, 35 ); // 最初の再帰呼び出し
    
    rotate( radians( 72 ) );  // 72°回転
  }
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
    
    stroke(0);
    strokeWeight(2);
    line( fBeginX, fBeginY, fEndX, fEndY ); // 線を描画
    
    drawSpiral( fEndX, fEndY, fLength * 0.9, fRot + 45, iLevel - 1 ); // 再帰呼び出し
  }
}
