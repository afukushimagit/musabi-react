void setup()
{
  size( 200, 200 );
  frameRate( 8 );
}

void draw()
{
  // 画面のクリア
  background( 204 );
  
  circle( random( 200 ), random( 200 ), 20 );
}
