size( 400, 400 );

for ( int iSize = 400; iSize > 0; iSize -= 50 )
{
  if( iSize <= 200 )
  {
    fill( 100 );
  }
  
  circle( 200, 200, iSize );
}
