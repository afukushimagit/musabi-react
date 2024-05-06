float[][] fProp = new float[200][7];  // 要素数変更

size( 400, 400 );
background( 30, 90, 80 );
noStroke();

// 配列の初期化
for( int i = 0; i < fProp.length; i++ ) 
{
  fProp[i][0] = random( 400 );                        // X座標
  fProp[i][1] = ( i % 4 ) * 100 + random( 20, 50 );   // Y座標
  fProp[i][2] = random( 10, 40 );                     // 大きさW
  fProp[i][3] = random( 10, 40 );                     // 大きさH
  fProp[i][4] = random( 220, 250 );                   // 色R
  fProp[i][5] = random( 204, 255 );                   // 色G
  fProp[i][6] = random( 170, 200 );                   // 色B
}
  
// 配列の要素数分繰り返して描画する．  
for( int i=0; i < fProp.length; i++ )
{
  // 落ちる影
  fill( 10, 60, 70, 100 );
  rect( fProp[i][0] + random( 0.5, 2 ), fProp[i][1] + random( 0.5, 2 ), fProp[i][2], fProp[i][3] );
  
  // ポストイット
  fill( fProp[i][4], fProp[i][5], fProp[i][4] );
  rect( fProp[i][0], fProp[i][1], fProp[i][2], fProp[i][3] );
}
