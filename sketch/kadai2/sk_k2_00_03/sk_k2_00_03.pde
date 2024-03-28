size(500, 500);
colorMode(RGB, 256, 256, 256, 0.1);
background(66, 20, 33);
int a = 25; //正方形の大きさを指定
float b = a/3*2;//3分の2の辺
float c  =a/3; //3分の1の辺
float r = a*sin(120); //三角形の高さ
translate (-a, a+r*0.3);//入れ子のズレ

for (int pt=0; pt<3; pt++)  //2つの図柄を３回繰り返す
{
  //図柄1
  for (int y=0; y<2; y++)       //縦に2繰り返し
  {
    for (int x=0; x<10; x++)      //横に10繰り返し
    {
      translate(a*2, 0);

      for (int i=0; i<4; i++)   //1ブロックを4回繰り返し
      {
        noStroke();
        rotate(PI/2);//角度を90度変える
        //色、大きさの違う三段の三角形を作成
        //配色1
        fill(235, 212, 134); //クリーム
        triangle(0, 0, 0, a, a, a);
        fill(66, 20, 33); //焦茶
        triangle(0, 0, 0, b, b, b);
        fill(235, 212, 134);//クリーム
        triangle(0, 0, 0, c, c, c);
        //配色2
        fill(132, 54, 26); //茶
        triangle(0, 0, a, 0, a, a);
        fill(217, 152, 67); //ベージュ
        triangle(0, 0, b, 0, b, b);
        fill(132, 54, 26);//茶
        triangle(0, 0, c, 0, c, c);
      }
    }
    translate(-500, 0); //X座標を左端に戻す
    translate(0, 50); //Y座標を一段下げる
  }

  translate(a, r*0.6);//図柄と図柄の感覚を開ける

  //図柄2
  for (int y=0; y<2; y++)//縦に2個
  {
    for (int x=0; x<21; x++)//横に10個複製
    {
      for (int tri = 0; tri<3; tri++)//正三角形を三分割する
      {
        stroke(66, 20, 33);
        fill(217, random(150, 165), 67);
        triangle(0, 0, -a, r, a, r);
        rotate(radians(120));
      }
      scale(1, -1);  //複製するごとに上下を反転する
      translate(a, r); //横に移動、反転時の上下のズレ
    }
    translate(-525, 0);
    translate(0, -50+(r/2));
  }
  translate(-a, 100-r*0.9);
}
