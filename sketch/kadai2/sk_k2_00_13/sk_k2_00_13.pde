size(500, 500);
float sx=0, sy=0; //変数の宣言（正方形の左上X、Y座標）
float px, py; //変数の宣言（正方形の中心のズレX,Y座標）
for (int i=0; i<10; i++)
{
  sx=i*50; //正方形の開始地点のX座標を計算
  for (int j=0; j<10; j++)
  {
    sy=j*50; //正方形の開始地点のY座標を計算
    px=random(5);//乱数でズレを求める
    py=random(5);
    for (int k=0; k<10; k++)
    {
      rect(sx+px*k, sy+py*k, 50-(k*5), 50-(k*5));
    }
  }
}
