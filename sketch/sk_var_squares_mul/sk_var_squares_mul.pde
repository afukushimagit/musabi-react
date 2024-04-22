size( 400, 200 );

int iX = 0;
int iY = 0;
int iSize = 50;
int iInterval = iSize;
float fSizeScale = 1.2;   // 大きさにかけるスケール値

square( iX, iY, iSize );
iX += iInterval;
iSize *= fSizeScale;      // スケーリングする．        

square( iX, iY, iSize );
iX += iInterval;
iSize *= fSizeScale;

square( iX, iY, iSize );
iX += iInterval;
iSize *= fSizeScale;

square( iX, iY, iSize );
iX += iInterval;
iSize *= fSizeScale;

square( iX, iY, iSize );
iX += iInterval;
iSize *= fSizeScale;

square( iX, iY, iSize );
iX += iInterval;
iSize *= fSizeScale;

square( iX, iY, iSize );
iX += iInterval;
iSize *= fSizeScale;

square( iX, iY, iSize );
