size( 400, 400 );

for ( int iY = 5; iY < 400; iY += 50 )
{
  for ( int iX = 5; iX < 400; iX += 50 )
  {
    // 色の分岐
    if( iX < 200 )
    {
      fill( 255 );
    }
    else
    {
      fill( 100 );
    }
    
    // 形の分岐
    if( iY < 200 )
    {
      square( iX, iY, 40 );
    }
    else
    {
      circle( iX + 20, iY + 20, 40 );
    }
  }
}
