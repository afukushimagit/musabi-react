size( 400, 400 );

for ( int iSize = 400; iSize > 0; iSize -= 20 )
{
  if( iSize > 200 && iSize < 300 )
  {
    fill( 100 );
  }
  else
  {
    fill( 255 );
  }
  
  circle( 200, 200, iSize );
}
