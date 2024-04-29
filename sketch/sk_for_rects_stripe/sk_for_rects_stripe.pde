size( 400, 100 );

for ( int iRect = 0; iRect < 20; iRect++ )
{
  fill( 255 * ( iRect % 2 ) );  // iRectが奇数：白，偶数：黒
  rect( iRect * 20, 25, 20, 50 );
}
