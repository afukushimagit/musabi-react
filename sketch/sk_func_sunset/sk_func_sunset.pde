int iArcAnimDeg = 0;        // アニメーション用円弧の角度

void setup()
{
  size( 200, 200 );
  frameRate( 12 );
}
void draw()
{
  background( 204 );
  
  // 夕日の更新
  updateSunset();
    
  // 夕日の描画
  drawSunset();
}

// 夕日の更新
void updateSunset()
{
  if( iArcAnimDeg < 180 )  // 180°以上変化したらリセット.
  {
    iArcAnimDeg += 4;    // 毎フレームの変化角度
  }
  else
  {
    iArcAnimDeg = 0;    // リセット.
  }
}

// 夕日の描画
void drawSunset()
{
  // 描画のための一時的な値を求める．
  int iArcAnimDegBegin = iArcAnimDeg + 90;     // 円弧の始まりの角度を計算.
  int iArcAnimDegEnd   = 450 - iArcAnimDeg;    // 円弧の終わりの角度を計算.
  
  // 円弧描画
  float fY = 180 - 100 * sin( radians( iArcAnimDegBegin ) )/2;
  fill( 255 );
  arc( width/2, fY, 100, 100, radians(iArcAnimDegBegin), radians(iArcAnimDegEnd), CHORD );
}
