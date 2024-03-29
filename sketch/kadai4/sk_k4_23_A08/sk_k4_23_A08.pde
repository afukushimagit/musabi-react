void setup()
{
  size( 1000, 1000 );
  background(0);
  blendMode(SCREEN);
  dragonRoll(500,500);
  dragonRoll(500,-400);
  dragonRoll(500,1400);
  dragonRoll(-400,50);
  dragonRoll(-400,950);
  dragonRoll(1400,50);
  dragonRoll(1400,950);
  save("sk_k4_23_A08.png");
}
void dragonRoll(int startX, int startY )
{
  pushMatrix();
  translate(startX,startY);
  for(int iR=0; iR<360; iR+=90)
  {
  pushMatrix();
  rotate(radians(iR));
  stroke(iR+random(50),iR-random(30),200);
  drawDragonCurve( 0, 0, 450, 450 );
  popMatrix();
  }
  popMatrix();
}
void drawDragonCurve( float fBeginX, float fBeginY, float fEndX, float fEndY )
{
  // 開始点から終了点への距離
  float fLength = sqrt( pow( fEndX - fBeginX, 2 ) + pow( fEndY - fBeginY, 2 ) );
  
  if( fLength > 10 )
  {
    // 直角三角形のX軸方向の大きさ
    float fTriangleX = ( fEndX - fBeginX ) / 2.0;
    
    // 直角三角形のY軸方向の大きさ
    float fTriangleY = ( fBeginY - fEndY ) /2.0;  // fBeginY方向へ向かうのが正
    
    float fBeginToNewX = fTriangleX + fTriangleY;
    float fEndToNewY = fTriangleX + fTriangleY;
    
    // 新たに生成される点のXY座標値
    float fNewX = fBeginX + fBeginToNewX;
    float fNewY = fEndY + fEndToNewY; 
    
    // 二つの線に再帰的に分割
    drawDragonCurve( fBeginX, fBeginY, fNewX, fNewY );
    drawDragonCurve( fEndX, fEndY, fNewX, fNewY );
  }
  else
  {
    line( fBeginX, fBeginY, fEndX, fEndY );
  }
}
