size( 300, 300 );

int iX = 0;
int iY = 0;
float fSizeDiv = 1.8;     // 大きさを割る値

for( int iSize = 280; iSize > 2; iSize /= fSizeDiv )  // 大きさを割っていく
{
  square( iX, iY, iSize );
}
