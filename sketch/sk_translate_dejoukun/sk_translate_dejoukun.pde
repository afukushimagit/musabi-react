size( 400, 400 );
noStroke();

translate( 50, 50 );  // 平行移動

/**
  以下のプログラムには一切変更を加えなくてもよい．
*/

// finger
fill( 0 );
ellipse( 298, 150, 103, 132 );

// finger mask
fill( 204 );
ellipse( 368, 132, 155, 190 );

// daen
fill( 0 );
ellipse( 200, 230, 253, 200 );

// mouth mask
fill( 204 );
ellipse( 198, 202, 116, 186 );

// ue daen
fill( 0 );
ellipse( 198, 196, 200, 134 );

// daen mask
fill( 204 );
ellipse( 198, 204, 89, 58 );

save("sk_translate_dejoukun.png");
