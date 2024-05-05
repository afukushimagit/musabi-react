size( 400, 400 );

int iIntervalX = 50;  // 左右の間隔
int iIntervalY = 50;  // 上下の間隔

translate( -50, 0 );  // 全体の位置微調整

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
      // ※半分ではなく正方形１つ分右にずらす．
      translate( iRetsu * iIntervalX + iIntervalX, iGyou * iIntervalY );
    }
    
    // 列で塗分け
    if ( iRetsu % 2 == 0 )
    {
      fill( 0, 124, 96 );
    }
    else
    {
      fill( 0 );
    }
    square( 0, 0, 50 );
    
    popMatrix();
  }
}
