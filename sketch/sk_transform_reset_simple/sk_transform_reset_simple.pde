size( 400, 300 );

pushMatrix();  // 初期座標系を保存しておく

// ３つの円

translate( 100, 150 );

circle( 40, 0, 30 );
rotate( radians( 120 ) );

circle( 40, 0, 30 );
rotate( radians( 120 ) );

circle( 40, 0, 30 );
rotate( radians( 120 ) );

popMatrix();  // 座標系を戻す．

// 3つの正方形

translate( 300, 80 );

square( 0, 0, 40 );
square( 0, 50, 40 );
square( 0, 100, 40 );
