size( 400, 400 );

for( int i = 0; i < 400; i++ )
{
  // 円のXY座標値をランダムに取得する．
  float fX = random( 400 );
  float fY = random( 400 );
  
  // 円のX座標値が170より大きくかつ230未満，もしくは
  // 円のY座標値が170より大きくかつ230未満だったら実行する．
  if( ( fX > 170 && fX < 230 ) ||
      ( fY > 170 && fY < 230 ) )
  {
    fill( 100 );
  }
  else
  {
    fill( 255 );
  }
  
  circle( fX, fY, 20 );
}
