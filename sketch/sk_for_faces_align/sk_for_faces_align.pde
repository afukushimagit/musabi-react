size( 600, 600 );

for ( int iY = 50; iY < 600; iY += 100 )
{
  for ( int iX = 50; iX < 600; iX += 100 )
  {
    pushMatrix();    // 座標系を保存

    translate( iX, iY );  // 顔を描画する中心点に座標系を移動
    
    /**
      以後，顔の描画
    */
    
    strokeWeight( 2 );
    
    // 顔輪郭と耳
    fill( 255 );
    ellipse( 0, 0, 80, 70 );
    arc( -23, -27, 14, 20, radians( -220 ), radians( -10 ) );
    arc(  23, -27, 14, 20, radians( -170 ), radians( 40 ) );
    
    // 目
    fill( 0 );
    circle( -13, -2, 9 );
    circle(  13, -2, 9 );
    
    // 眉
    line( -18, -12, -10, -13 );
    line(  18, -12, 10, -13 );
    
    // 目のハイライト
    fill( 255 );
    noStroke();
    ellipse( -13, -4, 6, 5 );
    ellipse(  13, -4, 6, 5 );
    
    // 口
    stroke( 0 );
    arc( -3, 10, 6, 6, radians( 0 ), radians( 180 ) );
    arc(  3, 10, 6, 6, radians( 0 ), radians( 180 ) );

    popMatrix();    // 座標系をリセット
  }
}
