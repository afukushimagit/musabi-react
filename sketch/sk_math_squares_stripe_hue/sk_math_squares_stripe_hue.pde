size( 400, 100 );

int iX = 0;
int iY = 25;
int iSize = 50;
int iRepeat = 256;  // 剰余算用の変数

colorMode( HSB, iRepeat, 1, 1 );  // Hue:iRepeatがMax値

fill( iX % iRepeat, 1, 1 );
square( iX, iY, iSize );
iX += iSize;

fill( iX % iRepeat, 1, 1 );
square( iX, iY, iSize );
iX += iSize;

fill( iX % iRepeat, 1, 1 );
square( iX, iY, iSize );
iX += iSize;

fill( iX % iRepeat, 1, 1 );
square( iX, iY, iSize );
iX += iSize;

fill( iX % iRepeat, 1, 1 );
square( iX, iY, iSize );
iX += iSize;

fill( iX % iRepeat, 1, 1 );
square( iX, iY, iSize );
iX += iSize;

fill( iX % iRepeat, 1, 1 );
square( iX, iY, iSize );
iX += iSize;

fill( iX % iRepeat, 1, 1 );
square( iX, iY, iSize );
