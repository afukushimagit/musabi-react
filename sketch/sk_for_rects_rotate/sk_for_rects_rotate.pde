size( 400, 400 );

translate( 200, 200 );

for( int iRect = 0; iRect < 6; iRect++ )  // 6回繰り返し
{
  rotate( radians( 60 ) );  // 60°回転
  rect( 0, 0, 60, 120 );
}
