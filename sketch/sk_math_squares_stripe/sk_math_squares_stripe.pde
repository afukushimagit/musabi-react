size( 400, 100 );

int iX = 0;
int iY = 25;
int iSize = 50;
int iRepeat = 256;  // 剰余算用の変数

fill( iX % iRepeat );
square( iX, iY, iSize );
iX += iSize;

fill( iX % iRepeat );
square( iX, iY, iSize );
iX += iSize;

fill( iX % iRepeat );
square( iX, iY, iSize );
iX += iSize;

fill( iX % iRepeat );
square( iX, iY, iSize );
iX += iSize;

fill( iX % iRepeat );
square( iX, iY, iSize );
iX += iSize;

fill( iX % iRepeat );
square( iX, iY, iSize );
iX += iSize;

fill( iX % iRepeat );
square( iX, iY, iSize );
iX += iSize;

fill( iX % iRepeat );
square( iX, iY, iSize );
