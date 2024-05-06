size( 400, 400 );

// 配列の宣言文
float[] fX = new float[20];


// 下地の線
line( 200, 0, 200, 400 );

// 配列の要素数分繰り返して正円を描画する．
for( int i = 0; i < fX.length; i++ )
{
  circle( fX[i], i * 20, 18 );
}
