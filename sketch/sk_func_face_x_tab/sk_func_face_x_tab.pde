int iX = 0;

void setup()
{
  size( 400, 200 );
  frameRate( 30 );
}

void draw()
{
  background( 204 );
  
  iX += 5;  // 毎フレーム5ピクセル移動
  if( iX > 400 )
  {
    iX = 0;
  }
  
  translate( iX, 100 );  // スクリーン中央へ平行移動
  
  // 顔の描画
  drawFace();
}
