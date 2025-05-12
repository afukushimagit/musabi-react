size( 400, 200 );

int iSize = 50;
int iInterval = iSize;
float fSizeScale = 1.2;   // 大きさにかけるスケール値

/**
   iX を 0 で初期化し，繰り返す．
   繰り返しの度に iX に iXInterval を足す．
   iX が 400 より小さければ繰り返しを続け，そうでなければ繰り返しを終わる．
*/
for( int iX = 0; iX < 400; iX += iInterval )
{
  square( iX, 0, iSize );
  iSize *= fSizeScale;      // スケーリングする． 
}
