size( 400, 400 );

for( int i = 0; i < 400; i++ )
{
  // 円のXY座標値をランダムに取得する．
  float fX = random( 400 );
  float fY = random( 400 );
  
  // もし円のX座標値が100より大きくかつ300未満だったら
  if( fX > 100 && fX < 300 )
  {
    fill( 100 );
  }
  else
  {
    fill( 255 );
  }
  
  circle( fX, fY, 20 );
}
