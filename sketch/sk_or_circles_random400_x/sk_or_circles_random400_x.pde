size( 400, 400 );

for( int i = 0; i < 400; i++ )
{
  // 円のXY座標値をランダムに取得する．
  float fX = random( 400 );
  float fY = random( 400 );
  
  // 円のX座標値が100未満かつ300より大きい数値だったら実行する．
  if( fX < 100 || fX > 300 )
  {
    fill( 100 );
  }
  else
  {
    fill( 255 );
  }
  
  circle( fX, fY, 20 );
}
