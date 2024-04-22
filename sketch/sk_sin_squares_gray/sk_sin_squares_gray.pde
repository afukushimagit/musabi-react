size( 400, 100 );

int iX = 0;
int iY = 25;
int iSize = 40;

colorMode( RGB, 2 );  // 最大値を2へ

// sin()は-1～1を返すので，1を足すと0～2の範囲になる．
fill( 1 + sin( radians( iX ) ) );
square( iX, iY, iSize );
iX += iSize;

fill( 1 + sin( radians( iX ) ) );
square( iX, iY, iSize );
iX += iSize;

fill( 1 + sin( radians( iX ) ) );
square( iX, iY, iSize );
iX += iSize;

fill( 1 + sin( radians( iX ) ) );
square( iX, iY, iSize );
iX += iSize;

fill( 1 + sin( radians( iX ) ) );
square( iX, iY, iSize );
iX += iSize;

fill( 1 + sin( radians( iX ) ) );
square( iX, iY, iSize );
iX += iSize;

fill( 1 + sin( radians( iX ) ) );
square( iX, iY, iSize );
iX += iSize;

fill( 1 + sin( radians( iX ) ) );
square( iX, iY, iSize );
iX += iSize;

fill( 1 + sin( radians( iX ) ) );
square( iX, iY, iSize );
iX += iSize;

fill( 1 + sin( radians( iX ) ) );
square( iX, iY, iSize );
