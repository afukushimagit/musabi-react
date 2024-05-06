size( 400, 400 );

for( int i = 0; i < 400; i++ )
{
  // 円のXY座標値をランダムに取得する．
  float fX = random( 400 );
  float fY = random( 400 );
  
  // 100ピクセル毎に，半分の領域をグレーにする．
  if( fX % 100 > 50 )
  {
    fill( 100 );
  }
  else
  {
    fill( 255 );
  }
  
  circle( fX, fY, 20 );
}
