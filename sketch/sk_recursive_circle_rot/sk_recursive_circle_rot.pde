void setup()
{
  size( 400, 400 );
  noLoop();  // アニメーションしない
}

void draw()
{
  drawCircle( 40, 20 );  // 最初の再帰呼び出し
}

/**
  再帰関数：正円を再帰的に回転しながらグレー色で描画する．
*/
void drawCircle( float fRot, int iLevel )
{
  if( iLevel > 0 )  // 再帰の継続条件
  {
    // 回転後の座標
    float fX = 200 + 100 * cos( radians( fRot ) );
    float fY = 200 + 100 * sin( radians( fRot ) );
    
    // 正円描画
    fill( 63 * ( iLevel % 5 ) );
    circle( fX, fY, 80 );
        
    drawCircle( fRot + 20, iLevel - 1 );  // 再帰呼び出し
  }
}
