size( 600, 600 );
background(255);

noFill();

// 濃い黒の曲線
stroke(0);
strokeWeight(4);
curve( 100, 100, 450, 200, 500, 350, 60, 500 );

// 薄い曲線
stroke(200);
strokeWeight(4);
curve( 450, 200, 500, 350, 60, 500, 100, 100 );
curve( 500, 350, 60, 500, 100, 100, 450, 200 );
curve( 60, 500, 100, 100, 450, 200, 500, 350 );

// 4つの点を赤く描画．
stroke(255,0,0);
strokeWeight(12);
point(100, 100);
point(450, 200);
point(500, 350);
point(60, 500);
