// Faceオブジェクト
Face obj1;
Face obj2;  // 2つ目のオブジェクト

void setup()
{
  size( 600, 600 );
  
  // オブジェクト生成
  obj1 = new Face( 300, 300 );
}

void draw()
{
  background( 204 );
  
  // マウスカーソルの位置へ移動
  obj1.moveToDestination( mouseX, mouseY, 40 );

  // オブジェクト描画
  obj1.draw();
}
