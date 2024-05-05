size( 400, 400 );

for ( int iY = 0; iY < 400; iY += 20 )
{
  for ( int iX = 0; iX < 400; iX += 20 )
  {
    if( random( 1 ) < 0.5 )
    {
      fill( 100 );
    }
    else
    {
      fill( 255 );
    }
    
    square( iX, iY, 20 );
  }
}
