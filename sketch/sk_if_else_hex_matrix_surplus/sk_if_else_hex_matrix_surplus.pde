size( 400, 400 );

int iIntervalX = 50;  // 左右の間隔
int iIntervalY = 46;  // 上下の間隔

for ( int iGyou = 0; iGyou < 10; iGyou++ )
{
  for ( int iRetsu = 0; iRetsu < 9; iRetsu++ )
  {  
    pushMatrix();

    // 偶数行か奇数行かで描画開始位置変更
    if( iGyou % 2 == 0 )
    {
      translate( iRetsu * iIntervalX, iGyou * iIntervalY );
    }
    else
    {
      translate( iRetsu * iIntervalX + iIntervalX / 2, iGyou * iIntervalY );
    }
    
    // 六角形描画
    beginShape();
    for( int iDeg = 0; iDeg < 360; iDeg += 60 )
    {
      float fX = 26 * cos( radians( iDeg ) );
      float fY = 26 * sin( radians( iDeg ) );
      
      vertex( fX, fY );
    }
    endShape( CLOSE );
    
    popMatrix();
  }
}
