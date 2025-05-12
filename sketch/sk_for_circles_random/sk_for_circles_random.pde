size( 400, 100 );

int iY = 50;
int iSizeMin = 10;    // 円の大きさの最小値
int iSizeMax = 50;    // 円の大きさの最大値
int iIntervalX = 50;

/**
   iX を 0 で初期化し，繰り返す．
   繰り返しの度に iX に iXInterval を足す．
   iX が 400 より小さければ繰り返しを続け，そうでなければ繰り返しを終わる．
*/
for( int iX = 0; iX < 400; iX += iIntervalX )
{
  circle( iX, iY, random( iSizeMin, iSizeMax ) );
}
