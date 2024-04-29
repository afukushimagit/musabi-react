size( 300, 300 );

for ( int iSize = 300; iSize > 0; iSize -= 20 )
{
  fill( iSize, 0, 0 );  // R値にiSizeをそのまま使用
  circle( 150, 150, iSize );
}
