size( 300, 300 );

int iX = 0;
int iY = 0;

/**
   iSize を 300 で初期化し，繰り返す．
   繰り返しの度に iSize を 2 で割る．
   iSize が 5 より大きければ繰り返しを続け，そうでなければ繰り返しを終わる．
*/
for( int iSize = 300; iSize > 5; iSize /= 2 )
{
  square( iX, iY, iSize );
}
