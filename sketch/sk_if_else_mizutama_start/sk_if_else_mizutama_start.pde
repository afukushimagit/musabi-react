size( 400, 400 );

noStroke();

for( int iY = 0; iY <= 400; iY += 40 )
{
  for( int iX = 0; iX <= 400; iX += 40 )
  {
    circle( iX + random( 18 ), iY + random( 18 ), random( 6, 28 ) );
  }
}
