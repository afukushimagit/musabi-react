size( 400, 400 );

int iIntervalX = 50;  // 左右の間隔
int iIntervalY = 50;  // 上下の間隔

translate( -20, 5 );  // 全体の位置微調整

for ( int iGyou = 0; iGyou < 10; iGyou++ )
{
  for ( int iRetsu = 0; iRetsu < 9; iRetsu++ )
  {  
    pushMatrix();

    // 偶数行か奇数行かで描画開始位置変更
    if ( iGyou % 2 == 0 )
    {
      translate( iRetsu * iIntervalX, iGyou * iIntervalY );
    }
    else
    {
      translate( iRetsu * iIntervalX + iIntervalX / 2, iGyou * iIntervalY );
    }
    
    square( 0, 0, 40 );
    
    popMatrix();
  }
}
