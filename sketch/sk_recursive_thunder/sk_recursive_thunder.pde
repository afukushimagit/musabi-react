void setup()
{
  size(400, 400);
  noLoop();  // アニメーションしない
}

void draw()
{
  stroke(0);
  strokeWeight(2);
  drawLightning( 200, 0, 60, 90 + random( -20, 20 ), 14 ); // 最初の再帰呼び出し
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
    
    // 再帰呼び出し
    drawLightning( fEndX, fEndY, fLength * 0.9, fNewRot, iLevel - 1 );
    
    // ランダムに再帰呼び出しを行う．
    if( random(1) < 0.2 )  // 20%
    {
      drawLightning( fEndX, fEndY, fLength * 0.8, fNewRot + random( -40, 40 ), iLevel - 1 );
    }
  }
}
