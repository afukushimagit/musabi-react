size( 400, 100 );

int iY = 25;
int iSize = 50;
int iIntervalX = iSize;
int iRepeat = 256;  // 剰余算用の変数

/**
   iX を 0 で初期化し，繰り返す．
   繰り返しの度に iX に iIntervalX を足す．
   iX が 400 より小さければ繰り返しを続け，そうでなければ繰り返しを終わる．
*/
for( int iX = 0; iX < 400; iX += iIntervalX )
{
  fill( iX % iRepeat );
  square( iX, iY, iSize );
}
