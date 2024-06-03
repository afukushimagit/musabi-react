void setup()
{
  size( 600, 400 );
  noLoop();  // アニメーションしない
}

void draw()
{
  drawKochCurve( 0, height/2, width, height/2, 4 );  // 最初の再帰呼び出し
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
    line( fBeginX, fBeginY, fEndX, fEndY );
  }
}
