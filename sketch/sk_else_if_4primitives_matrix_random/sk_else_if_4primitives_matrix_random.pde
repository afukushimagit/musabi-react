size( 400, 400 );

for ( int iY = 5; iY < 400; iY += 50 )
{
  for ( int iX = 5; iX < 400; iX += 50 )
  {
    float fRand = random( 1 );
    
    if( fRand < 0.25 )
    {
      square( iX, iY, 40 );
    }
    else if( fRand < 0.5 )
    {
      triangle( iX + 20, iY, iX + 40, iY + 40, iX, iY + 40 );
    }
    else if( fRand < 0.75 )
    {
      rect( iX, iY + 15, 40, 10 );
    }
    else 
    {
      circle( iX + 20, iY + 20, 40 );
    }
  }
}
