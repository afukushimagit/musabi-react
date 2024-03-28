size(500, 500);
colorMode(HSB, 100);//カラーモード（HSB、100段階）
noStroke();//枠線なし
float a, b; //変数（a=外円の直径、b=内円の直径）
for (int i=0; i<500; i=i+50)
{//10回繰り返し
  for (int j=0; j<500; j=j+50)
  {//10回繰り返し
    fill(random(70, 80), 50, 80);//紫っぽい色に設定
    a=random(30, 50);//30〜50の間の乱数を求める
    ellipse(i+25, j+25, a, a);//外側の円の描画
    fill(random(10, 30), 50, 80);//黄色〜黄緑
    b=random(0, 20);//0〜20の間の乱数を求める
    ellipse(i+25, j+25, b, b);//内側の円の描画
  }
}
