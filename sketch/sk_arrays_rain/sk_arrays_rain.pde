// 100個の雨粒の情報
// [雨番号][0]:X座標値，[雨番号][1]:Y座標値
float[][] fAmeXYS = new float[100][2];

size( 400, 400 );
background( 204 );
fill( 0 );

// 雨粒の初期化
for( int iAmeIdx=0; iAmeIdx < fAmeXYS.length; iAmeIdx++ )
{
  fAmeXYS[iAmeIdx][0] = random( width );     // X座標値
  fAmeXYS[iAmeIdx][1] = random( height );    // Y座標値
}
  
// 100個の雨粒の描画  
rotate( radians( 10 ) );  // 雨の角度
translate( 30, -50 );     // 調整
for( int iAmeIdx=0; iAmeIdx < fAmeXYS.length; iAmeIdx++ )
{
  // 雨粒の描画
  line( fAmeXYS[iAmeIdx][0], fAmeXYS[iAmeIdx][1], fAmeXYS[iAmeIdx][0], fAmeXYS[iAmeIdx][1] + 40 );
}
