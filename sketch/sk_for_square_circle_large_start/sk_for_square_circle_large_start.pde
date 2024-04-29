size( 600, 100 );

for ( int iX = 0; iX < 600; iX += 50 )
{
  fill( 255 );
  square( iX, 25, 50 );
  
  fill( 204 );
  circle( iX + 25, 50, 30 );  // 25ピクセル右にずらす
}
