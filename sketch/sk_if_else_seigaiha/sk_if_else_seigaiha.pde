size( 400, 400 );

int iIntervalX = 204; // 左右の間隔
int iIntervalY = 44;  // 上下の間隔

stroke( 70, 160, 200 );
fill( 255 );
strokeWeight( 14 );

translate( -105, -95 );  // 全体の位置微調整

for ( int iGyou = 0; iGyou < 10; iGyou++ )
{
  for ( int iRetsu = 0; iRetsu < 4; iRetsu++ )
  {
    pushMatrix();

    // 偶数行か奇数行かで描画開始位置変更
    if ( iGyou % 2 == 0 )
    {
      translate( iRetsu * iIntervalX, iGyou * iIntervalY );
    } else
    {
      translate( iRetsu * iIntervalX + iIntervalX / 2, iGyou * iIntervalY );
    }

    // 扇描画
    arc( 100, 150, 200, 200, radians( 215 ), radians( 325 ), PIE );    
    arc( 100, 150, 145, 145, radians( 215 ), radians( 325 ), PIE );
    arc( 100, 150, 90, 90, radians( 215 ), radians( 325 ), PIE );

    popMatrix();
  }
}
