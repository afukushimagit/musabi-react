void setup()
{
  size(400, 400);
  noLoop();  // アニメーションしない
}

void draw()
{
  // 再帰的な雷状の描画を，X軸方向に繰り返す．
  for( float fX = 40; fX < 360; fX += random( 40, 80 ) )
  {
    drawLightning( fX, 0, 60, 90 + random( -20, 20 ), 20 ); // 最初の再帰呼び出し
  }
}

/**
  再帰関数：線を再帰的に短くし，ランダムに回転させながら描画する．
*/
void drawLightning( float fBeginX, float fBeginY, float fLength, float fRot, int iLevel )
{
  if ( iLevel > 0 )  // 再帰の継続条件
  {
    // 線の終点
    float fEndX = fBeginX + cos( radians( fRot ) ) * fLength;
    float fEndY = fBeginY + sin( radians( fRot ) ) * fLength;
    
    strokeWeight( iLevel );
    stroke(0);
    line( fBeginX, fBeginY, fEndX, fEndY ); // 線を描画
    
    // 子の回転
    float fNewRot = fRot + random( -90, 90 );
    
    // 真横に向いたら逆向きに戻す．
    if( fNewRot > 180 )
    {
      fNewRot -= 160;  
    }
    else if( fNewRot < 0 )
    {
      fNewRot += 160;
    }
    
    drawLightning( fEndX, fEndY, fLength * 0.9, fNewRot, iLevel - 1 ); // 再帰呼び出し
  }
}
