size( 600, 100 );

int iY = 0;
int iWidth = 40;    // 長方形の幅

int iRepeat = 600;        // 剰余算用の変数
int iRepeatOffset = 400;  // 剰余算で割る値に足す値

colorMode( HSB, iRepeat, 1, 1 );  // Hue:iRepeatがMax値

for( int iX = 0; iX < 600; iX += iWidth )
{
  fill( ( iX + iRepeatOffset ) % iRepeat, 1, 1 );
  rect( iX, iY, iWidth, 100 );
}
