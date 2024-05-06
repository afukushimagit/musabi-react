size( 400, 200 );

for( int i= 0; i < 50; i++ )  // 50回繰り返し
{
  switch( i % 4 )
  {
    case 0:
      fill( 235, 50, 50 );      // R
      break;
    case 1:
      fill( 50, 235, 50 );      // G
      break;
    case 2:
      fill( 50, 50, 235 );      // b
      break;
    case 3:
      fill( 235, 235, 235 );  // White
      break;
    default:
  }
  
  rect( i * 8, 0, 8, 200 );
}
