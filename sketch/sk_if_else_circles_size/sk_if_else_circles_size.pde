size( 400, 100 );

int iY = 50;
int iSizeMin = 10;    // 円の大きさの最小値
int iSizeMax = 30;    // 円の大きさの最大値
int iIntervalX = 30;

for( int iX = 0; iX < 400; iX += iIntervalX )
{
  // ランダムな大きさの値を保存する．
  float fSize = random( iSizeMin, iSizeMax );
  
  if( fSize > 20 )
  {
    fill( 255 );
  }
  else
  {
    fill( 100 );
  }
  
  circle( iX, iY, fSize );
}
