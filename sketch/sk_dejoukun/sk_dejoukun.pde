void setup()
{
  size( 1000, 1000 );
  drawTree( width/2, height, 200, -90, 16 );
}

void drawTree( float fBeginX, float fBeginY, float fLength, float fDegree, int iLevel )
{
  pushMatrix();
  
  // 始点に座標系移動
  translate( fBeginX, fBeginY );
  
  rotate( radians( fDegree ) );
  
  // 終端のXY座標値
  float fEndX = fLength;
  float fEndY = 0;
    
  // 線の描画
  line( 0, 0, fEndX, fEndY );
    
  if( iLevel > 1 )
  {
    drawTree( fEndX, fEndY, fLength * 0.75, 20, iLevel - 1 );
    drawTree( fEndX, fEndY, fLength * 0.75, - 20, iLevel - 1 );
  }
  
  popMatrix();
}
