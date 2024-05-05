size( 400, 400 );
rectMode( CENTER );

for ( int iSize = 380; iSize > 0; iSize -= 20 )
{
  if( random( 1 ) < 0.5 )
  {
    circle( 200, 200, iSize );
  }
  else
  {
    square( 200, 200, iSize * 0.75 );
  }
}
