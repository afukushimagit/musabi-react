size( 300, 300 );

int iX = 0;
int iY = 0;
int iSize = 280;
float fSizeDiv = 1.4;     // 大きさを割る値
int iRepeat = 256;        // 剰余算用の変数

fill( iSize % iRepeat );
square( iX, iY, iSize );
iSize /= fSizeDiv;        // 大きさを割る       

fill( iSize % iRepeat );
square( iX, iY, iSize );
iSize /= fSizeDiv;

fill( iSize % iRepeat );
square( iX, iY, iSize );
iSize /= fSizeDiv;

fill( iSize % iRepeat );
square( iX, iY, iSize );
iSize /= fSizeDiv;

fill( iSize % iRepeat );
square( iX, iY, iSize );
iSize /= fSizeDiv;

fill( iSize % iRepeat );
square( iX, iY, iSize );
iSize /= fSizeDiv;

fill( iSize % iRepeat );
square( iX, iY, iSize );
iSize /= fSizeDiv;

fill( iSize % iRepeat );
square( iX, iY, iSize );
