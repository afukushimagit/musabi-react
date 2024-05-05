size( 400, 400 );

for( int i = 0; i < 100; i++ )
{
  if( random( 1 ) < 0.2 )
  {
    fill( 100 );
  }
  else
  {
    fill( 255 );
  }
  
  circle( random( 400 ), random( 400 ), 20 );
}
