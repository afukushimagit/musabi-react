/**************************************************************
Sakuhin Caption...
バイクが街を走る姿。
秒ごとにタイヤが一周し、分ごとに、背景の中に茶色いビルが現れる、時間ごとに空の色、ビルの窓の色が変化する。

 **************************************************************/
/**
  デバッグ機能
    'S'キー：png出力
    'H'キー：時が変わったときのアニメーション再生
    'M'キー：分が変わったときのアニメーション再生
*/
// === 'S'キーを押した時の出力画像名 ===
//  "K3_[クラス][番号]_[苗字].png"
String pngName = "K3_C20_Yanai.png"; // 'S'キーを押した時の出力画像名

// === アニメーション用変数/定数 ===
int[] buildingX = {100, 200, 300, 400, 500}; // 建物の初期位置
float bikeSpeed = 12; // バイクの速度
float angle = 0;
int groundLevel = 220; // 地面の高さ
int hourPrev;
int minutePrev;
int secondPrev;
float millisCurrent;
float millisPrev;
float millisPrevSec;

// === Time Handling ===

int hourCurrent;       // 現在の時（0~23）
int minuteCurrent;     // 現在の分（0~59）
int secondCurrent;     // 現在の秒（0~59）
float deltaTime;       // 前フレームからの経過時間（秒,0~1）
float deltaTimePerSec; // 前回の秒が切り替わってからの経過時間（秒,0~1）
int isHourAnim = 0;    // アニメーションフラグ（1:アニメーション中）
int isMinuteAnim = 0;
int isSecondAnim = 0;



void setup() {
  size(340, 400);
  frameRate(30);  // フレームレートの指定
   // === Time Init ===
  initTime();
}
  
// ============ アニメーションを記述 =============
  // hourCurrent = 1;  // 時 を指定して描画を確認したい場合に一時的に有効化
void drawBuilding(int x, int bottomY, int w, int h, color c) {
  fill(c);
  noStroke();
  rect(x, bottomY - h, w, h); // bottomY - h でビルの上端を計算
}

void drawWindows(int x, int bottomY, int w, int h, int wx, int wy, color c) {
  fill(c);
  noStroke();
  int rows = h / wy;
  int cols = w / wx;
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      rect(x + j * wx + wx * 0.2, bottomY - h + i * wy + wy * 0.2, wx * 0.6, wy * 0.6);
    }
  }
}

void updateCurrentTime() {
  int newSecond = second();
  if (newSecond != secondCurrent) {
    secondCurrent = newSecond;
    deltaTimePerSec = 0;
  } else {
    deltaTimePerSec += deltaTime;
  }
  deltaTime = 1.0 / frameRate;
  hourCurrent = hour();
  minuteCurrent = minute();
}

void drawBackground() {
  updateCurrentTime();
  
  float iB = secondCurrent + 60 * minuteCurrent + 3600 * hourCurrent;
  int bgR, bgG, bgB;

  if (4 <= hourCurrent && hourCurrent < 8) {
    bgR = int((iB - 14400) * 144 / 14400);
    bgG = int((iB - 14400) * 215 / 14400);
    bgB = int(80 + (iB - 14400) * 156 / 14400);
    background(bgR, bgG, bgB);
  } else if (8 <= hourCurrent && hourCurrent < 16) {
    bgR = 144;
    bgG = 215;
    bgB = 236;
    background(bgR, bgG, bgB);
  } else if (16 <= hourCurrent && hourCurrent < 20) {
    bgR = int(144 - (iB - 57600) * 144 / 14400);
    bgG = int(215 - (iB - 57600) * 215 / 14400);
    bgB = int(236 - (iB - 57600) * 156 / 14400);
    background(bgR, bgG, bgB);
  } else {
    bgR = 0;
    bgG = 0;
    bgB = 80;
    background(bgR, bgG, bgB);
  }

  // 窓の色を背景が暗い時に変更
  color windowColor = (hourCurrent < 4 || hourCurrent >= 20) ? color(255, 209, 42) : color(150);

  // 地面
  noStroke();
  fill(60);
  rect(0, 190, 450, 250);

  // 建物を描画
  int[] buildingHeights = {140, 180, 150, 130, 220}; // ビルの高さ
  int[] buildingWidths = {80, 100, 120, 80, 100}; // ビルの幅
  color[] buildingColors = {color(200), color(180), color(220), color(200), color(180)}; // ビルの色
  int[][] windowSizes = {{5, 10}, {6, 10}, {4, 7}, {4, 7}, {6, 10}}; // 窓のサイズを小さく

  // 特別な色のビルのフラグ
  boolean specialBuilding = secondCurrent % 60 == 0;

  // 通常のビルを先に描画
  for (int i = 0; i < buildingX.length; i++) {
    int hIndex = i % buildingHeights.length;
    int wIndex = i % buildingWidths.length;
    int wsIndex = i % windowSizes.length;
    color bColor = buildingColors[wIndex];
    drawBuilding(buildingX[i], groundLevel, buildingWidths[wIndex], buildingHeights[hIndex], bColor);
    drawWindows(buildingX[i], groundLevel, buildingWidths[wIndex], buildingHeights[hIndex], windowSizes[wsIndex][0], windowSizes[wsIndex][1], windowColor);
    buildingX[i] += bikeSpeed; // バイクに合わせてスクロール
    if (buildingX[i] > width) { // 画面外に出たら再配置
      buildingX[i] = -buildingWidths[wIndex];
    }
  }

  // 特別な色のビルを手前に描画
  if (specialBuilding) {
    int i = 0; // 一番手前のビルに特別な色を適用
    int hIndex = i % buildingHeights.length;
    int wIndex = i % buildingWidths.length;
    int wsIndex = i % windowSizes.length;
    color bColor = color(150, 114, 73); // 特別な色のビル
    drawBuilding(buildingX[i], groundLevel, buildingWidths[wIndex], buildingHeights[hIndex], bColor);
    drawWindows(buildingX[i], groundLevel, buildingWidths[wIndex], buildingHeights[hIndex], windowSizes[wsIndex][0], windowSizes[wsIndex][1], windowColor);
  }

  // その他の描画...
  // パイプ類
  strokeWeight(3);
  stroke(0);
  line(180, 200, 220, 180);
  line(220, 180, 240, 80);
  line(200, 100, 260, 190);
  line(260, 190, 290, 190);

  strokeWeight(15);
  line(250, 118, 280, 260);
  line(280, 260, 300, 270);
  line(310, 200, 270, 210);
  line(270, 210, 280, 220);
  line(280, 220, 270, 260);

  strokeWeight(15);
  stroke(60);
  line(285, 60, 340, 70);

  // ハンドル
  fill(60);
  ellipse(310, 20, 8, 15);

  strokeWeight(7);
  stroke(200);
  line(250, 80, 280, 60);

  strokeWeight(4);
  line(280, 60, 290, 40);
  line(290, 40, 300, 30);

  stroke(80);
  line(250, 80, 260, 76);

  stroke(200);
  line(280, 60, 320, 70);

  noStroke();
  fill(30);
  circle(280, 60, 20);

  // ボディ
  noStroke();
  fill(30);
  rect(294, 230, 130, 64);

  fill(130);
  quad(320, 180, 320, 250, 390, 250, 400, 180);

  fill(100);
  quad(320, 180, 320, 250, 340, 130, 300, 190);

  fill(130);
  circle(350, 280, 60);

  fill(234, 232, 218);
  ellipse(123, 250, 160, 120);
  triangle(40, 220, 35, 260, 90, 195);

  stroke(100);
  line(320, 200, 280, 240);
  line(280, 240, 290, 290);
  line(290, 290, 400, 270);

  // タイヤ
  noStroke();
  fill(0);
  circle(120, 280, 160);
  fill(200);
  circle(120, 280, 130);
  fill(180);
  circle(120, 280, 120);

  fill(60);
  circle(120, 280, 115);
 
  fill(200);
  circle(120, 280, 50);
  fill(210);
  circle(120, 280, 40);

  float fRadiusS = 10;
  float fRadiusL = 73;

  pushMatrix(); // マトリックスを保存
  translate(120, 280);
  rotate(radians(angle)); // 回転角度を適用
  beginShape();
  for (int iDeg = 0; iDeg < 360; iDeg += 15) {
    float fSX = fRadiusS * cos(radians(iDeg));
    float fSY = fRadiusS * sin(radians(iDeg));

    float fLX = fRadiusL * cos(radians(iDeg + 5));
    float fLY = fRadiusL * sin(radians(iDeg + 5));

    vertex(fSX, fSY);
    vertex(fLX, fLY);
  }
  endShape(CLOSE);
  popMatrix(); // マトリックスを復元

  fill(20);
  quad(200, 100, 194, 138, 220, 130, 220, 90);
}

void draw() {  
  // === Time Update ===
  updateTimePre();
  
  // hourCurrent = 1;  // 時 を指定して描画を確認したい場合に一時的に有効化

  drawBackground();

  // 回転角度を更新
  angle -= 1; // 1度ずつ回転
  if (angle >= 360) {
    angle = 0;
  }

  // 他の描画はそのまま
  fill(190);
  noStroke();
  circle(120, 280, 30);

  // フロントフォーク
  stroke(160);
  strokeWeight(15);
  strokeCap(ROUND);
  line(120, 280, 230, 120);

  strokeWeight(17);
  stroke(210);
  line(127, 270, 230, 120);

  strokeWeight(6);
  stroke(90);
  line(132, 270, 235, 120);

  strokeWeight(3);
  stroke(255);
  line(125, 270, 230, 118);

  noStroke();
  fill(60);
  arc(155, 230, 25, 25, radians(190), radians(410), CHORD);
  arc(195, 170, 25, 25, radians(190), radians(410), CHORD);

  fill(190);
  noStroke();
  circle(120, 280, 30);

  // ヘッド
  fill(20);
  rect(234, 117, 30, 40);
  quad(200, 50, 194, 118, 260, 130, 270, 90);

  fill(60);
  quad(200, 50, 194, 118, 230, 118, 270, 50);
  quad(190, 60, 190, 108, 230, 118, 270, 50);

  fill(230);
  quad(180, 65, 180, 103, 190, 108, 190, 60);

  fill(180);
  quad(180, 85, 180, 103, 190, 108, 190, 90);

  fill(20);
  quad(190, 90, 190, 108, 200, 118, 200, 90);
  quad(190, 80, 190, 108, 260, 118, 270, 90);

  fill(247, 193, 71);
  circle(200, 100, 20);

  fill(255, 154, 0);
  circle(201, 100, 16);

  fill(230);
  rect(190, 117, 22, 12);

  fill(180);
  rect(204, 117, 10, 12);

  // 燃タン
  fill(40);
  rect(284, 177, 130, 20);

  fill(232, 228, 206);
  rect(274, 107, 130, 80);
  quad(254, 117, 254, 149, 274, 187, 274, 107);
  quad(294, 97, 274, 107, 400, 107, 371, 97);

  fill(153, 144, 94);
  quad(267, 177, 274, 187, 391, 187, 400, 187);
  quad(257, 137, 274, 187, 271, 187, 291, 187);

  fill(248, 247, 241);
  quad(267, 117, 257, 137, 271, 130, 285, 104);
  rect(278, 107, 97, 10);

  fill(81, 126, 78);
  quad(330, 117, 287, 117, 400, 167, 400, 144);
  quad(330, 97, 287, 97, 287, 107, 330, 107);

  fill(191, 224, 118);
  quad(330, 107, 287, 107, 287, 117, 330, 117);

  strokeWeight(3);
  stroke(0);
  fill(255);
  rect(284, 150, 80, 24);

  fill(0);
  PFont myFont = loadFont("Avenir-BlackOblique-48.vlw");
  textFont(myFont);
  textSize(21);
  text("ZEROS", 290, 170);

//=======================================================================
 




  // 秒が変化した時のアニメーション
  if (secondCurrent != secondPrev) {
    isSecondAnim = 1;  // アニメーション開始
    
    // アニメーション初期化
  }
  if (isSecondAnim == 1) {  // アニメーション中
    // アニメーション中の処理を記述
    isSecondAnim = 0;  // アニメーション終了
  }
  
  // 分が変化した時のアニメーション
  if (minuteCurrent != minutePrev) {
    isMinuteAnim = 1;  // アニメーション開始
    
    // アニメーション初期化
  }
  if (isMinuteAnim == 1) {  // アニメーション中
    // アニメーション中の処理を記述
    isMinuteAnim = 0;  // アニメーション終了
  }
  
  // 時が変化した時のアニメーション
  if (hourCurrent != hourPrev) {
    isHourAnim = 1;  // アニメーションの開始
    
    // アニメーション初期化
  }
  if (isHourAnim == 1) {
    // アニメーション中の処理を記述
    isHourAnim = 0;  // アニメーション終了
  }
  
  // 時間をデバッグ表示（ 提出前に非表示にすること．）
  /*
  fill(0);
  textSize(20);
  text(hourCurrent + ":" + minuteCurrent + ":" + secondCurrent, 10, 20);
  text("deltaTimePerSec: " + deltaTimePerSec, 10, 40);
  text("deltaTime: " + deltaTime, 10, 60);
  */
  // === Time Update ===
  updateTimePost();
}

// === Time Handling Functions===
void initTime() {
  hourCurrent = hour();
  minuteCurrent = minute();
  secondCurrent = second();
  millisCurrent = millis();
  
  hourPrev = hour();
  minutePrev = minute();
  secondPrev = second();
  millisPrev = millis();
  
  millisPrevSec = millis();
}

void updateTimePre() { 
  if (hourPrev != hour()) hourCurrent = hour();
  if (minutePrev != minute()) minuteCurrent = minute();
  secondCurrent = second();
  millisCurrent = millis();
  
  deltaTime = (millisCurrent - millisPrev) / 1000;
  
  if (secondCurrent != secondPrev) {
    millisPrevSec = millis();
  }
  
  deltaTimePerSec = (millisCurrent - millisPrevSec) / 1000;
}

void updateTimePost() { 
  hourPrev = hourCurrent;
  minutePrev = minuteCurrent;
  secondPrev = secondCurrent;
  millisPrev = millisCurrent;
}

void keyPressed() {
  if (key == 's') {
    save(pngName);
  } else if (key == 'h') {
    hourPrev = -1;
  } else if (key == 'm') {
    minutePrev = -1;
  }
}
