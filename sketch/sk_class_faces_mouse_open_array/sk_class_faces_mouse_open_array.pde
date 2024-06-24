// Faceオブジェクト
Face[] objs = new Face[20];

void setup()
{
  size( 600, 600 );
  
  // オブジェクト生成
  for( int i = 0; i < objs.length; i++ )
  {
    objs[i] = new Face( random( width ), random( height ), random( 0.5, 1.0 ) );
  }
}

void draw()
{
  background( 200, 250, 250 );
    
  // マウスカーソルの位置へ移動
  for( int i = 0; i < objs.length; i++ )
  {
    objs[i].moveToDestination( mouseX, mouseY, random( 2, 10 ) * 10 );
  }
  
  // 偶数秒で口を開ける
  if( second() % 2 == 0 )
  {
    for( int i = 0; i < objs.length; i++ )
    {
      objs[i].mouth( 20 );
    }
  }
  else
  {
    for( int i = 0; i < objs.length; i++ )
    {
      objs[i].mouth( 0 );
    }
  }

  // 奥の山
  noStroke();
  fill( 120, 230, 120 );
  ellipse( 150, 600, 500, 700 );

  // オブジェクト描画
  for( int i = 0; i < objs.length; i++ )
  {
    objs[i].draw();
  }
  
  // 手前の山
  colorMode( BLEND );
  noStroke();
  fill( 100, 220, 100, 240 );
  ellipse( 400, 600, 400, 500 );
  
  // 上層の空
  fill( 200, 250, 250, 150 );
  rect( 0, 0, width, 150 );
}

// マウスボタンがクリックされた時
void mouseClicked()
{
  for( int i = 0; i < objs.length; i++ )
  {
    objs[i].flick();
  }
}
