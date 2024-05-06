size( 400, 200 );

colorMode( HSB, 360, 1, 1 );  // 色相最大値:360

// 8回繰り返す．
for ( int i = 0; i < 8; i++ )
{
  fill( 0, 1, 1 );
  rect( i * 50, 0, 50, 200 );
}
