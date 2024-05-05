size( 400, 400 );

for ( int iY = 5; iY < 400; iY += 50 )
{
  for ( int iX = 5; iX < 400; iX += 50 )
  {
    float fRand = random( 100 );
    
    if( fRand < 33 )
    {
      square( iX, iY, 40 );
    }
    else if( fRand < 66 )
    {
      triangle( iX + 20, iY, iX + 40, iY + 40, iX, iY + 40 );
    }
    else 
    {
      circle( iX + 20, iY + 20, 40 );
    }
  }
}
