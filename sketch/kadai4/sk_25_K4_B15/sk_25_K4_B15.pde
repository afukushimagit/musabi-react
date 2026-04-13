/**************************************************************
 暗いところに漂うクラゲたちを生成した。講義で扱っていた雷のような表現をさせる再起関数を
 ベースにしてクラゲの口腕をつくった。
 クラゲっぽさを出すために胃の部分（頭の模様）やふんわりした触手を追加した。
 クラゲが重なりすぎるとほとんど潰れて見えなくなってしまうのが悲しい。
 **************************************************************/
/**
 デバッグ機能
 実行ウィンドウ内でマウスクリック：再描画
 '1'キー：１枚目のpng出力（~_01.png）
 '2'キー：２枚目のpng出力（~_02.png）
 */
// === 'S'キーを押した時の出力画像名 ===
//  "K4_[クラス][番号]_[苗字]"  ※拡張子(.png)は不要
String pngName = "K4_B15_Fukushima";

// === グローバル変数/定数 ===

int numJellyfish = 12;
float r = 8;   // 楕円半径

// === setupには変更を加えないこと ===
void setup()
{
  size(1000, 1000);    // Window Size
  noLoop();            // draw once.
}

void draw()
{
  // 再描画を行うため，背景色の描画もここに記述する．
  background(30, 30, 50);

  // === 再帰関数の呼び出しやその他の描画命令 ===
  stroke( 230, 230, 250, 100);
  strokeWeight(0.05);



  for (int i = 0; i < numJellyfish; i++) {
    float x = random(0, width - 50);
    float y = random(-50, height-100);
    drawjellyfish(x, y);

    drawLight(650, -20, 100, 20, height, 35);
    drawLight(800, -42, 500, 250, height, 20);
    drawLight(930, -5, 150, 60, height, 3);
  }
}
void drawjellyfish(float baseX, float baseY) {
  pushMatrix();  // 変換を保存
  translate(baseX, baseY);
  rotate(radians(random(25)));
  scale(random(3));

  translate(0, -50);
  drawJellyHead();
  drawFrill();


  drawjellyA(-15, 0, 1.0, 5);
  drawjellyA(0, 0, 1.2, 10);
  drawjellyA(15, 0, 1.0, 3);


  drawjellyB( 5, 0, 90, 90 + random( -10, 20 ), 10 );
  drawjellyB(  - 5, 0, 130, 90 + random( -8, 17 ), 14 );
  drawjellyB(  10, 0, 60, 90 + random( -20, 20 ), 12 );
  drawjellyB(  10, 0, 50, 60 + random( -3, -10 ), 6 );// 最初の再帰呼び出し
  popMatrix();
}

void drawJellyHead() {
  pushMatrix();
  translate(0, -10);
  scale(1.5);
  fill(180, 200, 255, 160);
  noStroke();
  beginShape();
  vertex(-40, 0);
  bezierVertex(-40, -40, 40, -40, 40, 0);
  bezierVertex(30, 20, -30, 20, -40, 0);
  endShape(CLOSE);

  drawClover();
  drawCloverline();

  popMatrix();
}

void drawFrill() {

  pushMatrix();
  translate(0, 13);
  scale(1.7);

  fill(180, 200, 255, 100);
  noStroke();
  beginShape();


  int waveCount = 7;
  float startX = -25;
  float endX = 25;
  float width = endX - startX;
  float waveWidth = width / waveCount;

  vertex(startX, 0);  // 始点

  for (int i = 0; i < waveCount; i++) {
    float x1 = startX + i * waveWidth;
    float x2 = x1 + waveWidth ;
    bezierVertex(x1 + waveWidth * 0.25, 5, x2 - waveWidth * 0.25, 10, x2, 0);
  }

  // 閉じる
  bezierVertex(30, -30, -30, -30, -25, 0);
  endShape(CLOSE);

  popMatrix();
}

void   drawjellyA(float offsetX, float offsetY, float scaleFactor, float twist) {
  pushMatrix();
  translate(offsetX, offsetY);
  scale(scaleFactor);

  noFill();
  stroke(235, 245, 255, 120);
  strokeWeight(0.8);

  beginShape();
  float y = 0;
  for (int i = 0; i < 150; i++) {
    y = i * 1.5;
    float x = sin(radians(i * twist)) * 10;
    vertex(x, y);
  }
  endShape();
  popMatrix();
}

void drawClover() {
  pushMatrix();
  translate(0, -20);
  fill(255, 255, 255, 180);
  noStroke();



  ellipse(-10, 0, r*2, r-2);  // 左
  ellipse(10, 0, r*2, r-2);   // 右
  ellipse(0, -5, r*2, r);  // 上
  ellipse(0, 5, r*2, r);   // 下

  popMatrix();
}

void drawCloverline() {
  pushMatrix();
  translate(0, -20);
  scale(1.2);
  noFill();
  stroke(255, 255, 255, 200);
  strokeWeight(0.5);



  ellipse(-10, 0, r*2, r-2);  // 左
  ellipse(10, 0, r*2, r-2);   // 右
  ellipse(0, -4, r*2, r-2);  // 上
  ellipse(0, 5, r*2, r);   // 下

  popMatrix();
}

void drawLight(float x, float y, float minWidth, float maxWidth, float beamHeight, float angleDeg) {
  pushMatrix();

  translate(x, y);               // 回転の中心へ移動
  rotate(radians(angleDeg));     // 回転（角度は度数で指定）

  noStroke();
  for (int i = 0; i < beamHeight; i++) {
    float ratio = 1 - (float)i / beamHeight;
    float alpha = 40 * ratio/1.5;
    float currentWidth = minWidth + (maxWidth - minWidth) * ratio;  // 幅が下に行くほど広がる
    fill(255, 255, 230, alpha);
    rect(-currentWidth / 2, i, currentWidth, 1);
  }

  popMatrix();
}



// === 再帰関数の定義 ===
void drawjellyB( float fBeginX, float fBeginY, float fLength, float fRot, int iLevel )
{
  if ( iLevel > 0 )  // 再帰の継続条件
  {
    // 線の終点
    float fEndX = fBeginX + cos( radians( fRot ) ) * fLength;
    float fEndY = fBeginY + sin( radians( fRot ) ) * fLength;

    stroke(190, 218, 250, 80);
    strokeWeight( iLevel );
    line( fBeginX, fBeginY, fEndX, fEndY ); // 線を描画

    // 子の回転
    float fNewRot = fRot + 80 * sin( iLevel / 3.0 );

    // 真横に向いたら逆向きに戻す．
    if ( fNewRot > 210 )
    {
      fNewRot -= 200;
    } else if ( fNewRot <30 )
    {
      fNewRot += 80;
    } else if ( fNewRot < -20 )
    {
      fNewRot += -30;
    }


    drawjellyB( fEndX, fEndY, fLength * 0.6, fNewRot+10, iLevel - 1 );
    drawjellyB( fEndX, fEndY, fLength * 0.78, fNewRot, iLevel -3);
    drawjellyB( fEndX, fEndY, fLength * 0.8, fNewRot, iLevel - 6 );// 再帰呼び出し
  }
}
