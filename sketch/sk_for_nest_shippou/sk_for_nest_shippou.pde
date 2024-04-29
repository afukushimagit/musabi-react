size( 400, 400 );
blendMode( DIFFERENCE );
background( 255, 0, 0 );  // 色指定
fill( 0, 255, 255 );      // 色指定

// 下地の円
for( int iY = 50; iY < 400; iY += 100 )
{
  for( int iX = 50; iX < 400; iX += 100 )
  {
    circle( iX, iY, 100 );
  }
}

// 上から重ねる円
for( int iY = 0; iY <= 400; iY += 100 )
{
  for( int iX = 0; iX <= 400; iX += 100 )
  {
    circle( iX, iY, 100 );
  }
}
