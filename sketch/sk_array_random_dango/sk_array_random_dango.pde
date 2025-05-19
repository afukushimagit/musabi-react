size( 400, 400 );

// ランダムなRGB値を保存する配列
float[] fR = new float[4];
float[] fG = new float[4];
float[] fB = new float[4];

// 配列を初期化する
for( int i = 0; i < 4; i++ )
{
  fR[i] = random( 255 );
  fG[i] = random( 255 );
  fB[i] = random( 255 );
}

// 20回繰り返す．
for( int i = 0; i < 20; i++ )
{
  pushMatrix();
  
  // ランダムな位置に平行移動
  translate( random( 400 ), random( 400 ) );
  
  // 線
  strokeWeight( 2 );
  line( 0, 0, 80, 0 );
  
  // ４回繰り返して．円を描画する．
  strokeWeight( 1 );
  for( int j = 0; j < 4; j++ )
  {
    fill( fR[j], fG[j], fB[j] );
    circle( 20 * j, 0, 20 );
  }  
  
  popMatrix();
}
