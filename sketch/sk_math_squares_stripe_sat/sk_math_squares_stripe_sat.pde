size( 400, 100 );

int iX = 0;
int iY = 25;
int iSize = 50;
int iRepeat = 150;  // 剰余算用の変数

colorMode( HSB, 1, iRepeat, 1 );    // 彩度:iRepeatがMax値

fill( 1, iX % iRepeat, 1 );
square( iX, iY, iSize );
iX += iSize;

fill( 1, iX % iRepeat, 1 );
square( iX, iY, iSize );
iX += iSize;

fill( 1, iX % iRepeat, 1 );
square( iX, iY, iSize );
iX += iSize;

fill( 1, iX % iRepeat, 1 );
square( iX, iY, iSize );
iX += iSize;

fill( 1, iX % iRepeat, 1 );
square( iX, iY, iSize );
iX += iSize;

fill( 1, iX % iRepeat, 1 );
square( iX, iY, iSize );
iX += iSize;

fill( 1, iX % iRepeat, 1 );
square( iX, iY, iSize );
iX += iSize;

fill( 1, iX % iRepeat, 1 );
square( iX, iY, iSize );
