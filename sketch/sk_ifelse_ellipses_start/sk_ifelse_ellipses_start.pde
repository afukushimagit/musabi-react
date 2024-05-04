size( 400, 400 );

translate( 200, 200 );
rotate( radians( 10 ) );

// 18回繰り返す
// iの値: 0, 1, 2...16,17
for( int i = 0; i < 18; i++ )
{
  ellipse( 105, 0, 160, 20 ); 
  
  rotate( radians( 20 ) );  // 20°回転
}
