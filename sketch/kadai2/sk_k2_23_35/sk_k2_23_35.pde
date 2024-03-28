//ウィンドウの幅と高さを500 x 500に設定
size( 500, 500 );

//バックグラウンド色を白に設定
background( 0 );
//カラームードをHBSに設定
colorMode( HSB, 300 );
//ブレンドムードを設定
blendMode( DIFFERENCE );
//輪郭線を引かない
noStroke();
//中心の座標と矩形の幅と高さを指定
rectMode( CENTER );

//縦の間隔を63に設定
for ( int iY = 25; iY < 500; iY += 63 )
{
  //横の間隔を63に設定
  for ( int iX = 25; iX < 500; iX += 63 )
  {
    for ( int iDeg = 0; iDeg < 360; iDeg += 63 )
    {
      pushMatrix();
      translate( iX, iY );

      //中心部の円の大きさをランダムに設定
      circle( 0, 0, random( 0, 10 ) );
      //外部の円の大きさをランダムに設定
      circle( 0, 0, random( 30, 100 ) );


      popMatrix();
    }
  }
}
