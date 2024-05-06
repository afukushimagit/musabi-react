size( 400, 400 );

noStroke();

background( 255 );  // 背景色：白

for( int iY = 0; iY <= 400; iY += 40 )
{
  for( int iX = 0; iX <= 400; iX += 40 )
  {
    float fRand = random( 1 );
    
    if( fRand < 0.5 )       // 50%の確率で色が分岐
    {
      fill( 42, 66, 254, 200 );   // 濃い青
    }
    else if( fRand < 0.8 )  // 30%の確率で色が分岐
    {
      fill( 10, 169, 235, 180 );  // 薄い青
    }
    else                    // 残り20%の確率
    {
      fill( 80, 245, 205, 120 );  // 薄い緑
    }
    
    circle( iX + random( 18 ), iY + random( 18 ), random( 6, 30 ) );
  }
}
