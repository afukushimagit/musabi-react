size( 400, 100 );

int iX = 0;
int iY = 25;
int iSize = 50;
int iRepeat = 100;    // 剰余算用の変数
float fGrayScale = 5; // 剰余算後にかける値

fill( ( iX % iRepeat ) * fGrayScale );  // 剰余算後の値をスケーリングする．
square( iX, iY, iSize );
iX += iSize;

fill( ( iX % iRepeat ) * fGrayScale );
square( iX, iY, iSize );
iX += iSize;

fill( ( iX % iRepeat ) * fGrayScale );
square( iX, iY, iSize );
iX += iSize;

fill( ( iX % iRepeat ) * fGrayScale );
square( iX, iY, iSize );
iX += iSize;

fill( ( iX % iRepeat ) * fGrayScale );
square( iX, iY, iSize );
iX += iSize;

fill( ( iX % iRepeat ) * fGrayScale );
square( iX, iY, iSize );
iX += iSize;

fill( ( iX % iRepeat ) * fGrayScale );
square( iX, iY, iSize );
iX += iSize;

fill( ( iX % iRepeat ) * fGrayScale );
square( iX, iY, iSize );
