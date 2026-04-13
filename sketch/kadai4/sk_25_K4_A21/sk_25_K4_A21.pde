/**************************************************************
  合わせ鏡に映るお人形さんです。
 髪の長さと帯の色がランダムに変わります。
 マウスクリックには対応できませんでした。
 小さい方から順に描画するのが難しかったです。
 **************************************************************/
/**
 デバッグ機能
 実行ウィンドウ内でマウスクリック：再描画
 '1'キー：１枚目のpng出力（~_01.png）
 '2'キー：２枚目のpng出力（~_02.png）
 */
// === 'S'キーを押した時の出力画像名 ===
//  "K4_[クラス][番号]_[苗字]"  ※拡張子(.png)は不要
String pngName = "K4_A21_Fukushima";

// === グローバル変数/定数 ===


// === setupには変更を加えないこと ===
void setup()
{
  size(1000, 1000);    // Window Size
  noLoop();            // draw once.
}

void draw()
{
  // 再描画を行うため，背景色の描画もここに記述する．
  background(90);

  // === 再帰関数の呼び出しやその他の描画命令 ===
  colorMode(HSB, 360, 100, 100);
  noStroke();
  translate(600, 500);
  mirror(700, 500, 1.0, 15);
}

// === 再帰関数の定義 ===
void mirror(float fCenterX, float fCenterY, float fScale, int iLevel)
{
  if (iLevel <= 0)
  {
    return;
  }

  mirror(fCenterX, fCenterY, fScale * 0.7, iLevel - 1);

  pushMatrix();
  scale(fScale);

  stroke(#9D6D51);
  strokeWeight(60);
  noFill();
  square(-450, -400, 770);
  stroke(#C1B473);
  strokeWeight(10);
  square(-450, -400, 770);
  noStroke();

  // ふすま
  pushMatrix();
  fill(0, 30, 42);
  rect(1000-320-600, 0 - 500, 400, 1000);
  for (int y = 0; y < 10; y++)
  {
    for (int x = 0; x < 4; x++)
    {
      fill(#F0F0F0);
      square(700 + x * 90 - 600, 70 + y * 90 - 500, 80);
    }
  }
  popMatrix();

  //後ろ姿
  pushMatrix();
  translate(-660, -500);
  dollBack();
  popMatrix();

  //だんだん暗く
  pushMatrix();
  translate(-600, -500);
  float dark = 20;
  float black = (dark - iLevel) * (255.0 / dark);
  fill(0, black);
  square(0, 0, 1000);
  popMatrix();

  //鏡
  fill(#89817C);
  rect(0 - 600, 0 - 500, 150, 1000);
  rect(1000 - 90 - 600, 0 - 500, 200, 1000);
  rect(0 - 600, 0 - 500, 1000, 100);
  rect(0 - 600, 1000 - 100 - 500, 1000, 100);
  stroke(#9D6D51);
  strokeWeight(60);
  noFill();
  square(-450, -400, 770);
  stroke(#C1B473);
  strokeWeight(10);
  square(-450, -400, 770);
  noStroke();

  //お人形さん
  pushMatrix();
  translate(-660, -500);
  doll();
  popMatrix();

  popMatrix();
}

float hair=random(150, 450);
float obi=random(0, 70);

void doll()
{
  //後ろ髪
  fill(70);
  circle(230, 500, 200);
  rect(130, 500, 200, hair);

  //胴体
  fill(#A03535);
  ellipse(230, 750, 170, 400);
  rect(155, 750, 150, 300);
  stroke(#902A2A);
  strokeWeight(4);
  fill(#AD6363);
  triangle(190, 520+30, 230, 600+30, 270, 520+30);
  fill(180);
  triangle(190, 520, 230, 600, 270, 520);
  noStroke();

  //帯
  fill(10+obi, 50, 80);
  quad(190, 690, 210, 730, 250, 730, 270, 690);

  //手
  fill(#FFFFFF);
  circle(215, 750, 50);
  circle(245, 750, 50);

  //顔
  fill(#FFFFFF);
  ellipse(230, 500, 170, 150);
  fill(#FAD6D1);
  ellipse(175, 530, 30, 25);
  ellipse(285, 530, 30, 25);

  //目
  fill(10);
  rect(160, 520, 50, 10);
  rect(250, 520, 50, 10);

  //前髪
  fill(90);
  rect(135, 500, 40, 50+hair/5);
  rect(285, 500, 40, 50+hair/5);
  arc(230, 500+4, 190, 190, PI, TWO_PI);
  stroke(255);
  strokeWeight(3);
  strokeCap( PROJECT );
  line(176, 480, 176, 502);
  line(283, 480, 283, 502);
  strokeCap( ROUND );
  noStroke();
}

void dollBack()
{
  pushMatrix();
  scale(0.8);
  translate(140, 120);

  //胴体
  fill(#892F2F);
  ellipse(230, 750, 170, 400);
  rect(155, 750, 150, 300);

  //髪
  fill(70);
  circle(230, 500, 200);
  rect(130, 500, 200, hair);
  popMatrix();
}
