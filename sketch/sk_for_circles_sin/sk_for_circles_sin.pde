size( 600, 200 );

int iAmpY = 80;      // 円の振幅
int iXInterval = 45; // 円間のX間隔
int iSize = 40;      // 円の大きさ  

translate( 0, 100 );

/**
   iX を 0 で初期化し，繰り返す．
   繰り返しの度に iX に iXInterval を足す．
   iX が 600 より小さければ繰り返しを続け，そうでなければ繰り返しを終わる．
*/
for( int iX = 0; iX < 600; iX += iXInterval )
{
  circle( iX, iAmpY * sin( radians( iX ) ), iSize );
}
