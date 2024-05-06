size( 400, 400 );

for ( int iY = 5; iY < 400; iY += 50 )
{
  for ( int iX = 5; iX < 400; iX += 50 )
  {
    float fRand = random( 1 );
    
    if( fRand < 0.33 )
    {
      fill( 255 );
    }
    else if( fRand < 0.66 )
    {
      fill( 100 );
    }
    else
    {
      fill( 0 );
    }
    
    square( iX, iY, 40 );
  }
}
