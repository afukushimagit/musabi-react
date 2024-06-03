void setup()
{
  size( 400, 400 );
  noLoop();  // アニメーションしない
}

void draw()
{
  drawCircle( width/2, height/2, 200, 5 );  // 最初の再帰呼び出し
}

/**
  再帰関数：円を再帰的にランダムに回転しながら描画する．
*/
void drawCircle( float fX, float fY, int iRadius, int iLevel )
{
  int iGray = 50 * iLevel;
  fill( iGray );
  
  ellipseMode( RADIUS );
  circle( fX, fY, iRadius );
  
  if( iLevel > 0 )
  {
    // 子の回転
    float fRotL = random( 180 );
    float fRotR = fRotL + 180;
    
    // 子の半径
    int iNewRadius = iRadius/2;
    
    // 再帰呼び出し
    drawCircle( fX + iNewRadius * cos( radians( fRotL ) ), fY + iNewRadius * sin( radians( fRotL ) ), iNewRadius, iLevel - 1 );
    drawCircle( fX + iNewRadius * cos( radians( fRotR ) ), fY + iNewRadius * sin( radians( fRotR ) ), iNewRadius, iLevel - 1 );
  }
}
