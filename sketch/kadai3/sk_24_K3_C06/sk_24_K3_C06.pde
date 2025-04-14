/**************************************************************
 電子軌道や超弦理論とかをイメージしながら作りました。
 定常波を円形に変えたもので、波の数を見て時間を読むことができます。
 左から時・分・秒、内側の波は時間の一桁目・外側の波は二桁目を表しています。
 コードは全部自分が作成したので、雑になっていると思います。
 **************************************************************/
/**
 デバッグ機能
 'S'キー：png出力
 'H'キー：時が変わったときのアニメーション再生
 'M'キー：分が変わったときのアニメーション再生
 */
// === 'S'キーを押した時の出力画像名 ===
//  "K3_[クラス][番号]_[苗字].png"
String pngName = "K3_A12_fukushima.png";

// === アニメーション用変数/定数 ===



// === Time Handling ===

int hourCurrent;       // 現在の時（0~23）
int minuteCurrent;     // 現在の分（0~59）
int secondCurrent;     // 現在の秒（0~59）
float deltaTime;       // 前フレームからの経過時間（秒,0~1）
float deltaTimePerSec; // 前回の秒が切り替わってからの経過時間（秒,0~1）
int isHourAnim = 0;    // アニメーションフラグ（1:アニメーション中）
int isMinuteAnim = 0;
int isSecondAnim = 0;

float ms;  //deltaTimePerSecの変数名が長すぎて短縮 (0~1000)
float [] hours = new float[800];

void setup()
{
  size( 1000, 500 );
  frameRate( 30 );  // フレームレートの指定
  colorMode(HSB, 360, 100, 100);

  // === Time Init ===
  initTime();
}

void draw()
{
  // === Time Update ===
  updateTimePre();

  fill(0, 220);
  rect(-10, -10, width+20, height+20);
  noFill();
  strokeWeight(3);
  
  // === アニメーションを記述 ===

  //tens digit of second
  pushMatrix();
  translate(800, 250);
  shearY(-sin(2*radians(ms*360/1000))/50);  //振動数が0の時にも若干動くようにする
  scale(0.5, 0.5);
  rotate(radians(millis()*20/1000));  // かける数字 = degree per sec
  circularWave(25, (second() - second()%10) / 10, 250);
  popMatrix();

  //ones digit of second
  pushMatrix();
  translate(800, 250);
  shearY(sin(3*radians(ms*360/1000))/100);
  scale(0.5, 0.5);
  rotate(radians(millis()*40/1000));  //30degrees per sec
  circularWave(25, second()%10, 150);
  popMatrix();

  //tens digit of minute
  pushMatrix();
  translate(500, 250);
  shearY(-sin(2*radians(ms*360/1000))/50);
  scale(0.5, 0.5);
  rotate(radians(millis()*10/1000));  //10degrees per sec
  circularWave(25, (minute() - minute()%10) / 10, 250);
  popMatrix();

  //ones digit of minute
  pushMatrix();
  translate(500, 250);
  shearY(sin(3*radians(ms*360/1000))/100);
  scale(0.5, 0.5);
  rotate(radians(millis()*20/1000));  //15degrees per sec
  circularWave(25, minute()%10, 150);
  popMatrix();

  //tens digit of hour
  pushMatrix();
  translate(200, 250);
  shearY(-sin(1*radians(ms*360/1000))/50);
  scale(0.5, 0.5);
  rotate(radians(millis()*5/1000));  //5degrees per sec
  circularWave(25, (hour() - hour()%10) / 10, 250);
  popMatrix();

  //ones digit of hour
  pushMatrix();
  translate(200, 250);
  shearY(sin(2*radians(ms*360/1000))/100);
  scale(0.5, 0.5);
  rotate(radians(millis()*10/1000));  //10degrees per sec
  circularWave(25, hour()%10, 150);
  popMatrix();

  // === Time Update ===
  updateTimePost();
}



//CUSTOM FUNCTIONS

void circularWave(float a, float b, float r) {  //a: 振幅 b: 振動数 r: 半径
  pushMatrix();
  scale(1.9, 1.9);
  for (int s = 20; s >= 0; s--) {  //同心円を描く
    stroke(210, 40+sqrt(s)*30, 100-s*3, 255 - sqrt(s)*57);  //外側を青く、内側を白く
    scale(0.97, 0.97);

    float c = a * sin(radians(ms - 500) * 180 / (500));  //波が揺れるようにする(-1 < c < +1)

    beginShape();
    for (int i = 0; i < 360; i++) {
      float p = c * sin(radians(i*b)) + r;  //波の数＝時間
      vertex(cos(radians(i))*p, sin(radians(i))*p);  //サイン波を円形に変換
    }
    endShape(CLOSE);
  }
  popMatrix();
}
/*
  線形の定常波も入れようと思いましたが
 原因のわからないバグがあって諦めました
 
 void linearWave(float a) {  //a: 振幅 b: 振動数
 float b = (hour() - hour()%10) / 10;  //tens digit
 float c = a * sin(radians((second() * 1000 + ms) - 500) * 180 / 2 / 500);
 
 float b1 = hour()%10 + 5;  //ones digit
 float c1 = 15 * sin(radians((second() * 1000 + ms) - 500) * 180 / 500);
 
 beginShape();
 for (int i = 0; i < 800; i++) {
 float p = c * sin(radians(i*b*180/800));
 hours[i] = p;
 vertex(i, hours[i] - hours[200]);
 }
 endShape();
 
 beginShape();
 for (int i = 0; i < 800; i++) {
 float p = c1 * sin(radians(i*b1*180/800));
 vertex(i, p + 2 * hours[200]);
 }
 endShape();
 
 }
 */
