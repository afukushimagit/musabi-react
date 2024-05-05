size( 400, 400 );

int iIntervalX = 140;  // 左右の間隔
int iIntervalY = 120;  // 上下の間隔

fill( 235, 184, 184 );
stroke( 255 );
strokeWeight( 2 );
strokeJoin( BEVEL );

for ( int iGyou = 0; iGyou < 4; iGyou++ )
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

    // 麻の葉描画
    for( int iDeg = 0; iDeg < 360; iDeg += 60 )
    {
      beginShape( TRIANGLE_STRIP );
      vertex( 0, 0 );
      vertex( 69, 40 );
      vertex( 23, 40 );
      vertex( 0, 80 );
      vertex( 0, 0 );
      endShape();
      
      rotate( radians( 60 ) );
    }
    
    popMatrix();
  }
}
