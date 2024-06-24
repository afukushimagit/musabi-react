// Faceオブジェクト
Face obj1;
Face obj2;  // 2つ目のオブジェクト

void setup()
{
  size( 600, 600 );
  
  // オブジェクト生成
  obj1 = new Face( 300, 300 );
  obj2 = new Face( 300, 300 );
}

void draw()
{
  background( 204 );
  
  // マウスカーソルの位置へ移動
  obj1.moveToDestination( mouseX, mouseY, 40 );
  obj2.moveToDestination( mouseX, mouseY, 20 );
  
  // マウスカーソルが下半分なら逆さにする．
  if( mouseY > height / 2 )
  {
    obj1.flip( 180 );
    obj2.flip( 180 );
  }
  else
  {
    obj1.flip( 0 );
    obj2.flip( 0 );
  }

  // オブジェクト描画
  obj1.draw();
  obj2.draw();
}
