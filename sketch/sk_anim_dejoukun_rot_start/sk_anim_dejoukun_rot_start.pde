void setup()
{
  size( 400, 400 );
  frameRate( 30 );
}

void draw()
{
  background( 204 );
  
  translate( 200, 200 );  // 画面中心に平行移動
  
  // デ情くん描画
  
  noStroke();
  
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
}
