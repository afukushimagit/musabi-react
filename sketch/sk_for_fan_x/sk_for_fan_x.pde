size( 600, 200 );

strokeWeight( 4 );

/**
   iX を 20 で初期化し，繰り返す．
   繰り返しの度に iX に 140 を足す．
   iX が 600 より小さければ繰り返しを続け，そうでなければ繰り返しを終わる．
*/
for( int iX = 20; iX < 600; iX += 140 )
{
  // １つの扇模様を描画する．
  
  stroke( 255 );
  fill( 0, 204, 255 );
  arc( iX, 150, 200, 200, radians( 225 ), radians( 315 ), PIE );
  arc( iX, 150, 160, 160, radians( 225 ), radians( 315 ), PIE );
  arc( iX, 150, 120, 120, radians( 225 ), radians( 315 ), PIE );
  arc( iX, 150, 80, 80, radians( 225 ), radians( 315 ), PIE );
  
  // 下を背景色で削る．
  noStroke();
  fill( 204 );
  arc( iX, 156, 84, 88, radians( 225 ), radians( 315 ), PIE );
}
