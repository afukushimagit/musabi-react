size( 600, 600 );

blendMode( DIFFERENCE );

for( int i = 0; i < 300; i++ )
{
  fill( 200 );
  circle( random( 600 ), random( 600 ), random( 40, 150 ) );
}
