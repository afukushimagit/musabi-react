int iCircleRot = 0;

void setup()
{
  size( 300, 300 );
}

void draw()
{
  background( 204 );
  
  // 座標変換
  translate( 150, 150 );
  rotate( radians( iCircleRot ) );
  
  // 正円描画
  fill( 255 );
  stroke( 0 );
  circle( 80, 0, 80 );
  
  // 角度の更新
  iCircleRot += 4;
  if( iCircleRot > 360 )
  {
    iCircleRot = 0;
  }
}
