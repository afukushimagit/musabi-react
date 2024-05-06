// 3種のアルファ値のリスト
float[] fAlpha = { 1.0, 0.5, 0.2 };

size( 400, 400 );
colorMode( HSB, 360, 1, 1, 1 );
noStroke();

for( int i = 0; i < 100; i++ )
{
  // 3種のアルファ値のいずれかをランダムに使用する．
  int iElem = floor( random( 3 ) ) % 3;  // randamの返り値をint型へ変換
  fill( 200, 1, 1, fAlpha[ iElem ] );
  
  circle( random( 400 ), random( 400 ), 50 );
}
