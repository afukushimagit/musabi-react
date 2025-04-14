/**************************************************************
曼荼羅をモチーフにして作りました。
仏を3種類くらいにしようと思ってたけど描くのがありえないほど面倒で無理でした。
後ろの円と仏の色が一緒にならないようにしています。
味気なかったので課題１のやつを背景に持ってきて色合いをサイケデリックにしました。
5%くらいで見た目がバグります。
 **************************************************************/
/**
  デバッグ機能
    '1'キー：１枚目のpng出力（~_01.png）
    '2'キー：２枚目のpng出力（~_02.png）
*/
// === 'S'キーを押した時の出力画像名 ===
String pngName = "K4_A12_fukushima";
// === グローバル変数/定数 ===
int [][] cr = {{10,2,2},//color
               {10,5,1},
               {10,8,3},
               {10,10,2},
               {1,10,4},
               {2,10,7},
               {6,9,10},
               {2,7,10},
               {5,1,8},
               {7,2,10},
               {8,1,5},
               {9,2,5}};
float ww;//チビ仏の大きさ調整用関
float bug ;//ランダムなバグ要素

// === setupには変更を加えないこと ===
void setup() {
  colorMode(RGB, 10);
  size(1000, 1000);    // Window Size
  noLoop();            // draw once.
}

void draw() { 
  // 再描画を行うため，背景色の描画もここに記述する．
  background(0);
  rectMode(CENTER);
  bug = random(0,10);
  
  // === 再帰関数の呼び出しやその他の描画命令 ===
  haikei();
  drawGOD();//中心の仏の作画
  drawgod(500, 500, 1000, 1000, 4);  // 最初の再帰呼び出し
  
  keyPressed();
}

// === 再帰関数の定義 ===
void drawgod(float X, float Y, float fWidth, float fHeight, int iLevel) {  
  if (iLevel > 0) {
    // 中央に描画する矩形の大きさ
    float fRectW = fWidth / 3;
    float fRectH = fHeight / 3;
    ww = (1 + (4 - iLevel)) / 2.27;
    strokeWeight(2-0.6*(4-iLevel));
    

    // 中央以外の矩形描画
    if (iLevel != 4) {  // 最初の呼び出しレベルで中央を描画しないためのチェック
    pushMatrix();
    translate(X, Y);
     int x = int(random(0,11));
 //noStroke();
 fill(cr[x][0],cr[x][1],cr[x][2]);
    
      ellipse(0,0, fRectW * ww, fRectH * ww);
      // 五角形描画
      hotoke1(fRectW, fRectH,x);
      popMatrix();
    }
    
    // 再帰呼び出し (中央を除く8つの矩形)
    drawgod(X - fRectW, Y - fRectH, fRectW, fRectH, iLevel - 1);
    drawgod(X, Y - fRectH, fRectW, fRectH, iLevel - 1);
    drawgod(X + fRectW, Y - fRectH, fRectW, fRectH, iLevel - 1);
    drawgod(X - fRectW, Y, fRectW, fRectH, iLevel - 1);
    drawgod(X + fRectW, Y, fRectW, fRectH, iLevel - 1);
    drawgod(X - fRectW, Y + fRectH, fRectW, fRectH, iLevel - 1);
    drawgod(X, Y + fRectH, fRectW, fRectH, iLevel - 1);
    drawgod(X + fRectW, Y + fRectH, fRectW, fRectH, iLevel - 1);
  }
}
