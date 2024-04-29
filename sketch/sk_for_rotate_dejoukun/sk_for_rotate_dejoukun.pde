size( 400, 400 );
noStroke();

translate( 200, 200 );

for( int iAngle = 0; iAngle < 360; iAngle += 60 )
{
  pushMatrix();  // 座標系の保存
  
  scale( 0.5 );                 // スケールで大きさ調整
  rotate( radians( iAngle ) );  // 回転
  translate( 250, 0 );          // 中心からずらす
  
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
  
  popMatrix();  // 座標系のリセット
}
