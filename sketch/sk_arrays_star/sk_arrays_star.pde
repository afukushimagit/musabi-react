float[][] fStarsProp = new float[100][4];

size( 400, 400 );
background( 0 );

// 配列の初期化
for( int fStar = 0; fStar < fStarsProp.length; fStar++ ) 
{
  fStarsProp[fStar][0] = random( width );    // X座標
  fStarsProp[fStar][1] = random( height );   // Y座標
  fStarsProp[fStar][2] = random( 1, 6 );     // 大きさ
  fStarsProp[fStar][3] = random( 100, 255 ); // 明るさ
}
  
// 全ての星（正円）を描画する．  
for( int fStar = 0; fStar < fStarsProp.length; fStar++ )
{
  fill( fStarsProp[fStar][3] );
  circle( fStarsProp[fStar][0], fStarsProp[fStar][1], fStarsProp[fStar][2] );
}
