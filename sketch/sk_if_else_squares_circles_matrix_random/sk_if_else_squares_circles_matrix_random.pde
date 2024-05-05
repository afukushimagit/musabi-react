size( 400, 400 );

for ( int iY = 5; iY < 400; iY += 50 )
{
  for ( int iX = 5; iX < 400; iX += 50 )
  {
    if( random( 100 ) < 50 )
    {
      square( iX, iY, 40 );
    }
    else
    {
      circle( iX + 20, iY + 20, 40 );
    }
  }
}
