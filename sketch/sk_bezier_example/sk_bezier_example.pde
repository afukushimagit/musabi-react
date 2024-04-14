size( 600, 600 );
background(255);

noFill();

// 薄い直線（ハンドル）
stroke(200);
strokeWeight(4);
line( 100, 100, 450, 200 );
line( 500, 350, 60, 500 );

// ベジェ曲線
stroke(0);
strokeWeight(4);
bezier( 450, 200, 100, 100, 60, 500, 500, 350 );

// 4つの点を赤く描画．
stroke(255,0,0);
strokeWeight(12);
point(100, 100);
point(450, 200);
point(500, 350);
point(60, 500);
