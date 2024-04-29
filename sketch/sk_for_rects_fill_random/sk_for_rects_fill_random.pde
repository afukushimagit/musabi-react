size( 400, 100 );

int iY = 25;
int iWidth = 20;    // 長方形の横幅
int iHeight = 40;   // 長方形の高さ

colorMode( HSB, 360, 1, 100 );

for( int iX = 0; iX < 400; iX += iWidth )
{
  fill( 200, random( 1 ), 90 );
  rect( iX, iY, iWidth, iHeight );
}
