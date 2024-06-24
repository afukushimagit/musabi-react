// Faceオブジェクト配列
Face[] objs = new Face[10];

void setup()
{
  size( 600, 600 );
  
  // オブジェクト生成
  for( int i = 0; i < objs.length; i++ )
  {
    objs[i] = new Face( random( width ), random( height ) );
  }
}

void draw()
{
  background( 204 );
  
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

  // オブジェクト描画
  for( int i = 0; i < objs.length; i++ )
  {
    objs[i].draw();
  }
}

// マウスボタンがクリックされた時
void mouseClicked()
{
  for( int i = 0; i < objs.length; i++ )
  {
    objs[i].flick();
  }
}
