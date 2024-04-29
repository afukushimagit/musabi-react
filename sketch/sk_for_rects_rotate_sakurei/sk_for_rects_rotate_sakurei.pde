size( 400, 400 );

blendMode( DIFFERENCE );  // 差の絶対値

translate( 200, 200 );

for( int iRect = 0; iRect < 9; iRect++ )  // 9回繰り返し
{
  fill( 200 );
  rotate( radians( 40 ) );  // 40°回転
  rect( 0, -36, 140, 180 );
}
