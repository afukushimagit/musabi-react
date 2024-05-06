size( 400, 400 );

noStroke();

translate( 200, 200 );

// 24回繰り返す．
for( int i = 0; i < 24; i++ )
{
  if( i % 3 == 0 )
  {
    fill( 255 );
  }
  else if( i % 3 == 1 )
  {
    fill( 240 );
  }
  else
  {
    fill( 225 );
  }
  
  ellipse( 95, 0, 160, 20 );
  rotate( radians( 15 ) );
}
