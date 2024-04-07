size( 400, 400 );

translate( 100, 60 );

pushMatrix();  // 座標系保存
rotate( radians(20) );
ellipse( 0, 0, 100, 20 );
popMatrix();   // 座標系を戻す

translate( 40, 80 );

pushMatrix();  // 座標系保存
rotate( radians(60) );
ellipse( 0, 0, 100, 20 );
popMatrix();   // 座標系を戻す

translate( 40, 110 );

pushMatrix();  // 座標系保存
rotate( radians(40) );
ellipse( 0, 0, 100, 20 );
popMatrix();   // 座標系を戻す

translate( 80, 80 );

pushMatrix();  // 座標系保存
rotate( radians(4) );
ellipse( 0, 0, 100, 20 );
popMatrix();   // 座標系を戻す
