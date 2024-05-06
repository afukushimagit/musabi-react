size( 400, 400 );

// ランダムなグレイ値を保存する配列
float[] fGray = new float[8];

// 配列を初期化する
for( int i = 0; i < fGray.length; i++ )
{
  fGray[i] = random( 255 );
}

// 20回繰り返す．
for( int i = 0; i < 20; i++ )
{
  pushMatrix();
  
  // ランダムな位置に平行移動+回転
  translate( random( 400 ), random( 400 ) );
  rotate( random( radians( 360 ) ) );
  
  // 要素数の数だけ繰り返して．正方形を描画する．
  for( int j = 0; j < fGray.length; j++ )
  {
    fill( fGray[j] );
    square( 20 * j, 0, 20 );
  }  
  
  popMatrix();
}
