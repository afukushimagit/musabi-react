void setup()
{
  size( 200, 200 );
  frameRate( 8 );
}

void draw()
{
  // 画面のクリア（半透明）
  fill( 204, 40 );
  noStroke();
  rect( 0, 0, width, height );
  
  fill( 255 );
  stroke( 0 );
  circle( random( 200 ), random( 200 ), 20 );
}
