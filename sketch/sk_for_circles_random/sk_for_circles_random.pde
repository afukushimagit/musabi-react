size( 400, 100 );

int iY = 50;
int iSizeMin = 10;    // 円の大きさの最小値
int iSizeMax = 50;    // 円の大きさの最大値
int iIntervalX = 50;

for( int iX = 0; iX < 400; iX += iIntervalX )
{
  circle( iX, iY, random( iSizeMin, iSizeMax ) );
}
