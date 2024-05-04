size( 600, 200 );

int iAmpY = 80;      // 円の振幅

for( int iX = 0; iX < 600; iX += 10 )
{
  // 円のY座標値
  float fY = 100 + iAmpY * sin( radians( iX ) );
  
  if( fY <= 100 )   // もしfYの値が100以下だったら
  {
    fill( 255 );
  }
  else              // そうでなかったら
  {
    fill( 100 );
  }
  
  circle( iX, fY, 20 );
}
