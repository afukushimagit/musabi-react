size( 400, 400 );

int iIntervalX = 50;  // 左右の間隔
int iIntervalY = 50;  // 上下の間隔

translate( -20, 5 );  // 全体の位置微調整

for ( int iGyou = 0; iGyou < 10; iGyou++ )
{
  for ( int iRetsu = 0; iRetsu < 9; iRetsu++ )
  {  
    pushMatrix();

    // 行番号を3で割った余りで分岐
    switch ( iGyou % 3 )
    {
      case 0:
        fill( 255 );
        translate( iRetsu * iIntervalX, iGyou * iIntervalY );
        break;
      case 1:
        fill( 120 );
        translate( iRetsu * iIntervalX + iIntervalX / 3, iGyou * iIntervalY );
        break;
      default:
        fill( 0 );
        translate( iRetsu * iIntervalX + 2 * iIntervalX / 3, iGyou * iIntervalY );
    }
    
    square( 0, 0, 40 );
    
    popMatrix();
  }
}
