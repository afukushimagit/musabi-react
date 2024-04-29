size( 600, 100 );
background( 60, 90, 100 );

for ( int iX = 0; iX < 600; iX += 50 )
{
  fill( iX, 60, 80 );
  stroke( iX, 164, 10 );
  strokeWeight( 4 );
  square( iX, 25, 50 );
  
  fill( iX / 2, 185, 195 );
  stroke( iX / 3, 60, 50 );
  strokeWeight( 4 );
  circle( iX + 25, 50, 30 );
}
