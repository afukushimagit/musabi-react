size( 400, 400 );
noStroke();

translate( 200, 200 );  // スクリーン中心へ平行移動
rotate( radians( 45 ) );// 回転

/**
  以下，座標のX値とY値を-200変更済み．
*/

// finger
fill( 0 );
ellipse( 98, -50, 103, 132 );

// finger mask
fill( 204 );
ellipse( 168, -68, 155, 190 );

// daen
fill( 0 );
ellipse( 0, 30, 253, 200 );

// mouth mask
fill( 204 );
ellipse( -2, 2, 116, 186 );

// ue daen
fill( 0 );
ellipse( -2, -4, 200, 134 );

// daen mask
fill( 204 );
ellipse( -2, 4, 89, 58 );
