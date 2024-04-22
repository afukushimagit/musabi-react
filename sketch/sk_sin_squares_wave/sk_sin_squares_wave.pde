size( 400, 100 );

int iX = 0;
int iAmpY = 25;  // 振幅 Amplitude 
int iSize = 50;

translate( 0, 25 );  // 上下の振動の中心

square( iX, iAmpY * sin( radians( iX ) ), iSize );
iX += iSize;

square( iX, iAmpY * sin( radians( iX ) ), iSize );
iX += iSize;

square( iX, iAmpY * sin( radians( iX ) ), iSize );
iX += iSize;

square( iX, iAmpY * sin( radians( iX ) ), iSize );
iX += iSize;

square( iX, iAmpY * sin( radians( iX ) ), iSize );
iX += iSize;

square( iX, iAmpY * sin( radians( iX ) ), iSize );
iX += iSize;

square( iX, iAmpY * sin( radians( iX ) ), iSize );
iX += iSize;

square( iX, iAmpY * sin( radians( iX ) ), iSize );
