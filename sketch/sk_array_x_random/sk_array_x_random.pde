size( 400, 200 );

// 配列の宣言
float[] fX = new float[10];

// 配列の初期化
for( int i = 0; i < fX.length; i++ )
{
  fX[i] = random( 400 );
}

// 配列の要素数文繰り返す．
for( int i = 0; i < fX.length; i++ )
{
  line( 0, 20 * i, 400, 20 * i );  // スクリーンを横切る線
  circle( fX[i], 20 * i, 16 );
}
