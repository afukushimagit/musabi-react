/* 作品概要 */
/*
 サイン関数による時計である。主な特徴は以下の通り。
 (i) 秒はサイン曲線と直線の動きによって連続的に表現している。秒数が切り替わるとき、曲線と直線がちょうど交わるように設計した。1山1秒。
 (ii) 分はサイン曲線と面によって表した。面は少しずつ増加していき、1山あたり10分かけて描く。60分経つとはじめに戻る。曲線は固定。
 (iii) 時間は背面の矩形の幅と対応している。1分ずつ横幅が増加し、24時間で切り替わる。
 
 (iv) 矩形の色は空の色味に合わせた。また矩形の背景は、昼に明るく、夜に暗くなるよう調整した。参考にしたこよみは2023/06/05である。
 (v) (ii)の描画色は背景色とおおよそ色が反転するようにした。たとえば、深夜1時ならば(ii)のグラフは白く描かれるが、背景色は暗い。午前10時なら(ii)が暗い色、背景色は白に近い色となる。
 
 (vi) 1時間ごとに時報イベントが発生する。
 (a) dBoyWave(): デ情くんたちが波のように現れる。発生確率40%。
 (b) dBoyBoss(): 大きなデ情くんがこちらを見つめて流れていく。発生確率40%。
 (c) dBoySpiral(): 七色に明滅する1000のデ情くんたちが螺旋を描いては去っていく。発生確率20%。
 */


float x[];
float ySec[];
float yMin[];
float lenSec;
float lenMin;
float lenHour;
int getSec;
float getMill;
float brightHour;
color[] cHours = {
  #09235c, #0a2561, #0b2a70, #1f4b99, #f5c462, #f56949,
  #5ab6e0, #60c7f0, #41a9d9, #73c7e6, #2eb5e6, #45abe6,
  #46bceb, #17afeb, #45b0e6, #4dc4ff, #f56e62, #f55249,
  #4983f5, #19448e, #0b2a73, #0a2561, #17184b, #17174a
};

int plot = 4;
float plotR = 1.5;

color backCol = color(255);
color diCol = color(0);

int dNum = 10;
float[] dBoy_x = new float[dNum];
float[] dBoy_y = new float[dNum];
float off;
float thetaWav;

float dBoss_x;

float thetaRot;
float thetaSpi;

float rarity;

void setup() {
  size(960, 480);

  getSec = second();
  getMill = millis();
  lenSec = 0;
  lenMin = 0;
  lenHour = 0;
  brightHour = 0;

  x = new float[width*plot];
  ySec = new float[width*plot];
  yMin = new float[width*plot];

  float theta = 0;
  for (int i=0; i<width*plot; i++) {
    x[i] = i/plot;
    ySec[i] = sin(theta)*30;
    yMin[i] = sin(PI+0.1*theta)*180;
    theta += PI/64;
  }

  for (int i=0; i<10; i++) {
    dBoy_x[i] = width;
    dBoy_y[i] = 0;
  }
  off = 0;
  thetaWav = 0;

  dBoss_x = 1.4*width;

  thetaRot = 0;
  thetaSpi = 20;

  rarity = 0;
}

void draw() {

  /* 時計本体の描画 */
  drawHours();
  drawRules();
  drawMin();
  drawSec();

  /* 時報イベント */
  eventHour();

  /* 変数の確認用 */
  // checkVars();
}



/* 時間の描画 */
void drawHours() {

  /* 背景 */
  brightHour = abs(sin((hour())*PI/24))*255;
  background(brightHour);

  /* 時間の矩形 */
  lenHour = hour()*40+minute()*40/60;
  noStroke();
  fill(cHours[hour()]);
  rect(0, 0, lenHour, height);
}

/* 分の描画 */
void drawMin() {

  lenMin = 16*minute()+16*second()/60;

  /* 分の面 */
  strokeWeight(1);
  stroke(45+(255-brightHour)/2);
  for (int i=0; i<lenMin*plot; i++) {
    line(x[i], height/2, x[i], yMin[i]+height/2);
  }

  /* 分の線 */
  for (int i=0; i<width*plot; i++) {
    ellipse(x[i], yMin[i]+height/2, plotR, plotR);
  }
}


/* 秒の描画 */
void drawSec() {

  /* グラフが秒の切り替わりから何ミリ秒経過したかを取得する */
  if (abs(second()-getSec)>0) {
    getSec = second();
    getMill = millis();
  }

  /* 秒の経過を距離に変換する */
  lenSec = 16*second()+16*(millis()-getMill)/1000;

  /* 秒の曲線 */
  noStroke();
  fill(175);
  for (int i=0; i<lenSec*plot; i++) {
    ellipse(x[i], ySec[i]+height/2, plotR, plotR);
  }

  /* 秒の直線 */
  stroke(175, 175);
  strokeWeight(2);
  line(0, height/2, lenSec, height/2);
}


/* 罫線の描画(10分幅) */
void drawRules() {
  stroke(125, 125);
  strokeWeight(0.5);
  for (int i=1; i<6; i++) {
    line(i*160, 0, i*160, height);
  }
}


/* 変数の値を確認するための関数 */
void checkVars() {
  fill(175);
  textSize(15);
  text(hour()+":"+minute()+":"+second(), 10, 20);
  text(frameRate+" fps", 10, 40);
  text(frameCount+" frames", 10, 60);
  text(millis()+" ms", 10, 80);
  text(lenMin/16+" min.", 10, 100);
  text(second()+" sec.", lenSec, height/2-20);
}


void eventHour() {

  /* イベント発生3秒前のカウントを描画する */
  if (minute() == 59 && second() > 56) {
    fill(255, 255*(millis()-getMill)/1000);
    rect(0, 0, width, height);

    /* 時報イベントに用いる変数を初期化する */

    // dBoyWave()
    for (int i=0; i<10; i++) {
      dBoy_x[i] = width;
      dBoy_y[i] = 0;
    }

    // dBoyBoss()
    dBoss_x = 1.4*width;

    // dBoySpiral()
    thetaRot = 0;
    thetaSpi = 20;

    /* 時報イベントの確率 */
    rarity = random(5);
  }


  if (minute() >= 0 && minute() <= 3) {
    if (rarity < 2) {
      dBoyWave();
    } else if (rarity < 4) {
      dBoyBoss();
    } else {
      dBoySpiral();
    }
  }
}

/* 時報イベントa */
void dBoyWave() {
  diCol = color(0);
  backCol = color(255);

  for (int i=0; i<10; i++) {
    dBoy_x[i] -= noise(off)*2*(i+10);
    dBoy_y[i] = sin(thetaWav+i*PI/8)*70+50*(i+1);
  }

  for (int i=0; i<10; i++) {
    pushMatrix();
    translate(dBoy_x[i], dBoy_y[i]);
    rotate(thetaWav);

    dBoy(0, 0, 50);
    popMatrix();
  }

  thetaWav += 0.1;
  off += 0.01;
}

/* 時報イベントb */
void dBoyBoss() {
  diCol = color(0);
  backCol = color(255);
  dBoy(dBoss_x, height*3/7, width*0.8);
  dBoss_x -= 5;
}

/* 時報イベントc */
void dBoySpiral() {
  pushMatrix();
  translate(width/2, height/2);
  rotate(-thetaRot);

  for (int i=0; i<1000; i++) {
    diCol = color(random(255), random(255), random(255));
    backCol = color(random(255), random(255), random(255));
    dBoy((i+1)*pow(thetaSpi, 2)*cos(thetaSpi-i*10), (i+1)*pow(thetaSpi, 2)*sin(thetaSpi-i*10), 50);
  }
  popMatrix();

  thetaSpi -= 0.05;
  thetaRot += 0.07;
}


/* デ情くんを描画する */
void dBoy(float x, float y, float size) {

  fill(diCol);
  noStroke();

  // しっぽ
  fill(diCol);
  beginShape();
  vertex(x+size*0.11, y-size*0.2);
  bezierVertex(x+size*0.5, y-size*0.05, x-size*0.1, y-size*0.5, x+size*0.4, y-size*0.51);
  bezierVertex(x+size*0.35, y-size*0.5, x+size*0.35, y-size*0.175, x+size*0.4, y-size*0.2);
  endShape(CLOSE);

  // からだ
  fill(diCol);
  ellipse(x, y, size*1, size*0.75);

  //えがお
  fill(backCol);
  ellipse(x, y-size*0.02, size*0.4, size*0.55);

  // ひとつめ
  fill(diCol);
  ellipse(x, y-size*0.2, size*0.2, size*0.2);
  fill(diCol);
  ellipse(x, y-size*0.07, size*0.6, size*0.45);
  fill(backCol);
  ellipse(x, y-size*0.05, size*0.3, size*0.2);
}
