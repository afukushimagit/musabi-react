size( 200, 200 );

translate( 100, 100 );  // スクリーン中央へ平行移動

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
