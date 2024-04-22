size( 400, 100 );

int iX = 0;
int iY = 25;
int iSize = 50;
int iInterval = iSize + 5;
int iSizeInterval = 3;  // 大きさのインターバル

square( iX, iY, iSize );
iX += iInterval;
iSize -= iSizeInterval; // 大きさのインターバル分小さくする．

square( iX, iY, iSize );
iX += iInterval;
iSize -= iSizeInterval;

square( iX, iY, iSize );
iX += iInterval;
iSize -= iSizeInterval;

square( iX, iY, iSize );
iX += iInterval;
iSize -= iSizeInterval;

square( iX, iY, iSize );
iX += iInterval;
iSize -= iSizeInterval;

square( iX, iY, iSize );
iX += iInterval;
iSize -= iSizeInterval;

square( iX, iY, iSize );
iX += iInterval;
iSize -= iSizeInterval;

square( iX, iY, iSize );
