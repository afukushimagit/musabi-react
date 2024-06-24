// Faceオブジェクト
Face obj1;
Face obj2;

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
  
  // 偶数秒で口を開ける
  if( second() % 2 == 0 )
  {
    /** ここでメソッドを呼び出す
      口を開ける．
    */    
  }
  else
  {
    /** ここでメソッドを呼び出す
      口を閉じる．
    */
  }

  // オブジェクト描画
  obj1.draw();
  obj2.draw();
}

// マウスボタンがクリックされた時
void mouseClicked()
{
  obj1.flick();
  obj2.flick();
}
