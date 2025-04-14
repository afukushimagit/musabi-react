/**************************************************************
 再帰のレベルごとの境界が見えづらく、引かれた線が繋がるようパターンを敷き詰めた。
 powとfor文で線を引き、tlansrateとrotateで線と全体の位置を調節した。
 strokeWeightやstrokeCapを調整して粗が目立たないようにした。
 **************************************************************/
/**
 デバッグ機能
 実行ウィンドウ内でマウスクリック：再描画
 '1'キー：１枚目のpng出力（~_01.png）
 '2'キー：２枚目のpng出力（~_02.png）
 */
// === 'S'キーを押した時の出力画像名 ===
//  "K4_[クラス][番号]_[苗字]"  ※拡張子(.png)は不要
String pngName = "K4_A12_fukushima";

// === グローバル変数/定数 ===
int r = 90; //複雑さ

// === setupには変更を加えないこと ===
void setup()
{
  size(1024, 1024);    // Window Size
  noLoop();            // draw once.
}

void draw()
{
  // 再描画を行うため，背景色の描画もここに記述する．
  background( 204 );

  // === 再帰関数の呼び出しやその他の描画命令 ===
  translate(width/2, -height/2);
  scale(1.4);
  rotate(PI/4);
  drawSquare(0, 0, 1024, 7);
}

// === 再帰関数の定義 ===

void drawSquare(int iX, int iY, int iSide, int iLevel)
{
  rectMode(CORNERS);
  translate(iX, iY);
  noStroke();
  rect(0, 0, iSide, iSide);
  stroke(0);
  strokeCap(PROJECT);
  strokeWeight(2);
  
  if (iLevel%2==0) {
    translate(iSide, 0);
    rotate(HALF_PI);
  }
  for (int iLine=0; iLine <= pow(2, iLevel); iLine ++) {
    line(iLine*8, 0, 0, iLine*8);
    line(pow(2, iLevel)*8, iLine*8, iLine*8, pow(2, iLevel)*8);
  }
  if (iLevel%2==0) {
    rotate(-HALF_PI);
    translate(-iSide, 0);
  }
  translate(-iX, -iY);

  if (iLevel > 0) {
    if (random(0, 100) < r) {
      drawSquare(iX, iY, iSide/2, iLevel-1);
    }
    if (random(0, 100) < r) {
      drawSquare(iX+iSide/2, iY, iSide/2, iLevel-1);
    }
    if (random(0, 100) < r) {
      drawSquare(iX+iSide/2, iY+iSide/2, iSide/2, iLevel-1);
    }
    if (random(0, 100) < r) {
      drawSquare(iX, iY+iSide/2, iSide/2, iLevel-1);
    }
  }
}
