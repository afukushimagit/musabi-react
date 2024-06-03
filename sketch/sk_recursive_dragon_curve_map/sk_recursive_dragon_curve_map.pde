void setup()
{
  size( 600, 600 );
  noLoop();  //アニメーションしない
}

void draw()
{
  background( 20, 40, 200 );
  
  // 8個のドラゴンカーブ
  for( int iDragonCurve = 0; iDragonCurve < 8; iDragonCurve++ )
  {
    drawDragonCurve( width/5.0, random( height/2 ), width, random( height ), 10 );
  }
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
    // 再帰の終了時に描画する．
    
    // 開始点から終了点への距離
    float fLength = sqrt( pow( fEndX - fBeginX, 2 ) + pow( fEndY - fBeginY, 2 ) );
  
    // 線の代わりに円描画
    float fCenterX = ( fBeginX + fEndX ) / 2.0;
    float fCenterY = ( fBeginY + fEndY ) / 2.0;
    noStroke();
    fill( random( 80, 160 ), random( 100, 255 ), random( 10, 30 ), 180 );
    circle( fCenterX, fCenterY, fLength/2.0  );
    //line( fBeginX, fBeginY, fEndX, fEndY );
  }
}
