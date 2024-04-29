size( 600, 100 );
background( 60, 90, 100 );  // 背景色

for ( int iX = 0; iX < 600; iX += 50 )
{
  fill( 210, 60, 80 );
  stroke( 201, 164, 10 );
  strokeWeight( 4 );
  square( iX, 25, 50 );
  
  fill( 215, 185, 195 );
  stroke( 90, 60, 50 );
  strokeWeight( 4 );
  circle( iX + 25, 50, 30 );  // 25ピクセル右にずらす
}
