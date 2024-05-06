float[][] fProp = new float[100][4];

size( 400, 400 );

// 配列の初期化
for( int i = 0; i < fProp.length; i++ ) 
{
  fProp[i][0] = random( 400 );      // X座標
  fProp[i][1] = random( 400 );      // Y座標
  fProp[i][2] = random( 10, 40 );   // 大きさ
  fProp[i][3] = random( 0, 255 );   // 色
}
  
// 配列の要素数分繰り返して描画する．  
for( int i=0; i < fProp.length; i++ )
{
  fill( fProp[i][3] );
  circle( fProp[i][0], fProp[i][1], fProp[i][2] );
}
