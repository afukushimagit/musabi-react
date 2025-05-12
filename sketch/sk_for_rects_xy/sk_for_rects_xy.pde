size( 400, 200 );

int iY = 0;
int iSize = 50;
int iIntervalX = iSize;
int iIntervalY = iSize / 2;

/**
   iX を 0 で初期化し，繰り返す．
   繰り返しの度に iX に iXIntervalX を足す．
   iX が 400 より小さければ繰り返しを続け，そうでなければ繰り返しを終わる．
*/
for( int iX = 0; iX < 400; iX += iIntervalX )
{
  square( iX, iY, iSize );
  iY += iIntervalY;  // Y座標値を増やす
}
