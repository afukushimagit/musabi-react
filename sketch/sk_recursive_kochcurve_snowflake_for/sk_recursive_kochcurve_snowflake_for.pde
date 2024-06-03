void setup()
{
  size( 800, 800 );
  noLoop();  // アニメーションしない
}

void draw()
{
  background( 230, 235, 245 );
  
  // 100個の氷の結晶
  for( int iSnouCrystal = 0; iSnouCrystal < 120; iSnouCrystal++ )
  {
    float fSize = random( 60, 160 );
    drawSnowCrystal( random( width ), random( height ), fSize, fSize );
  }
}

/**
  １つの結晶を描画する
*/
void drawSnowCrystal( float fX, float fY, float fWidth, float fHeight )
{
  pushMatrix();
  
  translate( fX, fY );
  
  // 縮小しながら6つ描画
  for( int iKochCurve = 0; iKochCurve < 6; iKochCurve++ )
  {
    scale( 0.8 );
    drawKochCurve( 0, - fHeight / 2.0, fWidth / 2.0, fHeight * 0.33, 4 );
    drawKochCurve( fWidth / 2.0, fHeight * 0.33, -fWidth / 2.0, fHeight * 0.33, 4 );
    drawKochCurve( -fWidth / 2.0, fHeight * 0.33, 0, - fHeight / 2.0, 4 );
  }

  popMatrix();
}

/**
  再帰関数：コッホ曲線
*/
void drawKochCurve( float fBeginX, float fBeginY, float fEndX, float fEndY, int iLevel )
{
  if( iLevel > 0 )
  {
    // 新たに生成される三つの点のXY座標値
    float[][] fPointXY = new float[3][2];
    
    // 三等分する二つの点の座標
    fPointXY[0][0] = fBeginX + ( fEndX - fBeginX ) / 3.0;
    fPointXY[0][1] = fBeginY + ( fEndY - fBeginY ) / 3.0;
    fPointXY[2][0] = fBeginX + 2 * ( fEndX - fBeginX ) / 3.0;
    fPointXY[2][1] = fBeginY + 2 * ( fEndY - fBeginY ) / 3.0;
    
    float fLength = sqrt( pow( fEndX - fBeginX, 2 ) + pow( fEndY - fBeginY, 2 ) );
    float fNewLength = fLength / 3.0;
    float fCosO = ( fPointXY[2][0] - fPointXY[0][0] ) / fNewLength;
    float fSinO = ( fPointXY[2][1] - fPointXY[0][1] ) / fNewLength;
    float fCos1 = cos( radians( - 60 ) );
    float fSin1 = sin( radians( - 60 ) );
    
    // 正三角形の３つ目の飛び出た点の座標を求める．
    // 加法定理
    //   cos( a + b ) = cos(a) * cos(b) - sin(a) + sin(b)
    //   sin( a + b ) = sin(a) * cos(b) + cos(a) * sin(b)
    fPointXY[1][0] = fPointXY[0][0] + fNewLength * ( fCosO * fCos1 - fSinO * fSin1 );
    fPointXY[1][1] = fPointXY[0][1] + fNewLength * ( fSinO * fCos1 + fCosO * fSin1 );
    
    drawKochCurve( fBeginX, fBeginY, fPointXY[0][0], fPointXY[0][1], iLevel - 1 );
    drawKochCurve( fPointXY[0][0], fPointXY[0][1], fPointXY[1][0], fPointXY[1][1], iLevel - 1 );
    drawKochCurve( fPointXY[1][0], fPointXY[1][1], fPointXY[2][0], fPointXY[2][1], iLevel - 1 );
    drawKochCurve( fPointXY[2][0], fPointXY[2][1], fEndX, fEndY, iLevel - 1 );
  }
  else
  {
    // 再帰呼び出し終了時に描画
    strokeWeight( 2 );
    stroke( random( 40, 80 ), random( 60, 100 ), random( 140, 220 ), 200 );
    line( fBeginX, fBeginY, fEndX, fEndY );
  }
}
