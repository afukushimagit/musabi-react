void setup()
{
  size( 600, 600 );
  noLoop();  //アニメーションしない
}

void draw()
{
  drawDragonCurve( 200, 100, 500, 500, 13 );  // 最初の再帰呼び出し
}

/**
  再帰関数：ドラゴン曲線
*/
void drawDragonCurve( float fBeginX, float fBeginY, float fEndX, float fEndY, int iLevel )
{  
  if( iLevel > 0 )
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
    drawDragonCurve( fBeginX, fBeginY, fNewX, fNewY, iLevel - 1 );
    drawDragonCurve( fEndX, fEndY, fNewX, fNewY, iLevel - 1 );
  }
  else
  {
    // 再帰の終了時に線を描画する．
    line( fBeginX, fBeginY, fEndX, fEndY );
  }
}
