size( 600, 200 );

int iAmpY = 80;      // 円の振幅
int iXInterval = 45; // 円間のX間隔
int iSize = 40;      // 円の大きさ  

translate( 0, 100 );

for( int iX = 0; iX < 600; iX += iXInterval )
{
  circle( iX, iAmpY * sin( radians( iX ) ), iSize );
}
