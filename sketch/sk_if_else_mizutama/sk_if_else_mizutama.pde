size( 400, 400 );

noStroke();

background( 255 );  // 背景色：白

for( int iY = 0; iY <= 400; iY += 40 )
{
  for( int iX = 0; iX <= 400; iX += 40 )
  {
    if( random( 1 ) < 0.5 )  // 50%の確率で色が分岐
    {
      fill( 42, 66, 254, 200 );   // 濃い青
    }
    else
    {
      fill( 10, 169, 235, 180 );  // 薄い青
    }
    
    circle( iX + random( 18 ), iY + random( 18 ), random( 6, 30 ) );
  }
}
