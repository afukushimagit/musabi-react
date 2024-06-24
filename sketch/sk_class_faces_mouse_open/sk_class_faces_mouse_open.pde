// Faceオブジェクト
Face obj1;
Face obj2;
Face obj3;

void setup()
{
  size( 600, 600 );
  
  // オブジェクト生成
  obj1 = new Face( 300, 0 );
  obj2 = new Face( 0, 600 );
  obj3 = new Face( 600, 600 );
}

void draw()
{
  background( 200, 250, 250 );
    
  // マウスカーソルの位置へ移動
  obj1.moveToDestination( mouseX, mouseY, 40 );
  obj2.moveToDestination( mouseX, mouseY, 20 );
  obj3.moveToDestination( mouseX, mouseY, 60 );

  // 奥の山
  noStroke();
  fill( 120, 230, 120 );
  ellipse( 150, 600, 500, 700 );

  // オブジェクト描画
  obj1.draw();
  obj2.draw();
  obj3.draw();
  
  // 手前の山
  colorMode( BLEND );
  noStroke();
  fill( 100, 220, 100, 240 );
  ellipse( 400, 600, 400, 500 );
  
  // 上層の空
  fill( 200, 250, 250, 150 );
  rect( 0, 0, width, 150 );
}
