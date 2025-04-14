/**************************************************************
 パソコン画面をイメージした時計。
 背景色は時間帯によって変化。こちらのプログラムは授業内のサンプルプログラムを参考にした。
 Now Loading please wait...〇と書かれたウインドウが一秒おきに増える。
 〇内の数字は現在の秒数。
 このウィンドウはランダムな位置から画面左下に向かって重なって表示され、
 端に来るとまたランダムな位置から左下に向かう描画がされる。
 分が変わると４０４エラーメッセージのウィンドウが表示される。メッセージ最下部の数字は現在の分。
 時が変わるとおめでとうメッセージ。現在の時刻で何人目の訪問者か変わる。
 10％の確率で背景が虹色になる。
 分、時刻が変化した際に表示されるウィンドウの色はランダム。
 
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
float winX;
float winY;
float winHeight;
float winWidth;
float winm;
float batsuXL;
float batsuXR;

float winXQ;
float winYQ;
float winHeightQ;
float winWidthQ;
float winmQ;
float batsuXLQ;
float batsuXRQ;

float mousex;
float mousey;

int iY = 0;
int iWidth = 40;
int iRepeat = 400;

int iBackGroundRGB[][]
  = {
  { 239, 219, 0 }, // 朝
  { 3, 199, 255 }, // 昼
  { 205, 53, 0 }, // 夕
  {  27, 13, 230 } };  // 夜


// === Time Handling ===

int hourCurrent;       // 現在の時（0~23）
int minuteCurrent;     // 現在の分（0~59）
int secondCurrent;     // 現在の秒（0~59）
float deltaTime;       // 前フレームからの経過時間（秒,0~1）
float deltaTimePerSec; // 前回の秒が切り替わってからの経過時間（秒,0~1）
int isHourAnim = 0;    // アニメーションフラグ（1:アニメーション中）
int isMinuteAnim = 0;
int isSecondAnim = 0;

void setup()
{
  colorMode(RGB);
  size( 600, 600 );
  frameRate( 4);  // フレームレートの指定




  // アニメーション初期化
  winX = random(500);
  winY = random(600);
  winWidth = random(100, 120);
  winHeight = random(80, 90);
  winm = winHeight / 8;
  batsuXL = winX + winWidth - 8;
  batsuXR = winX + winWidth - 2;

  mousex=random(300);
  mousey=random(600);

  // === Time Init ===
  initTime();
}

void draw()
{
  // === Time Update ===
  updateTimePre();

  //hourCurrent = 1;  // 時 を指定して描画を確認したい場合に一時的に有効化

  // 背景色の設定
  int iHour = hour();
  int iHourElem = 0;
  if ( iHour >= 5 && iHour <= 10 )  // 朝
  {
    iHourElem = 0;
  } else if ( iHour >= 11 && iHour <= 16 )  // 昼
  {
    iHourElem = 1;
  } else if ( iHour >= 17 && iHour <= 19 )  // 夕
  {
    iHourElem = 2;
  } else  // 夜
  {
    iHourElem = 3;
  }
  noStroke();
  fill( iBackGroundRGB[iHourElem][0], iBackGroundRGB[iHourElem][1], iBackGroundRGB[iHourElem][2], 2);
  rect( 0, 0, width, height );


  // 既定の描画カラーに戻す．
  stroke( 0 );
  strokeWeight(1);

  //背景の不透明ウィンドウ
  blendMode( MULTIPLY );
  winXQ = random(600);
  winYQ = random(600);
  winHeightQ = random(40, 60);
  winWidthQ = random(80, 90);
  winmQ = winHeightQ / 8;
  batsuXLQ = winXQ + winWidthQ - 8;
  batsuXRQ = winXQ + winWidthQ - 2;

  // //ウィンドウ全体
  stroke(0, 50);
  fill(random(255), random(0, 50), random(0, 50), 50);
  rect(winXQ, winYQ, winWidthQ, winHeightQ);
  // ウィンドウ上部
  fill(255, 50);
  rect(winXQ, winYQ, winWidthQ, winmQ);
  //ウィンドウ内部
  rect(winXQ + 4, winYQ + winmQ + 4, winWidthQ - 8, winHeightQ - winmQ - 8);
  // バツ印の枠
  fill(255, 0, 0, 50);
  rect(winXQ + winWidthQ - 10, winYQ, 10, winmQ);
  // バツ印
  stroke(255, 50);
  line(batsuXLQ, winYQ + 2, batsuXRQ, winYQ + 5);
  line(batsuXLQ, winYQ + 5, batsuXRQ, winYQ + 2);
  //文字
  fill(0, 50);
  textSize(10);
  text("Error!", winXQ + winWidthQ / 2.6, winYQ + winHeightQ / 1.8);
  text("Error!", winXQ + winWidthQ / 2.6, winYQ + winHeightQ / 1.6);
  text("Error!", winXQ + winWidthQ / 2.6, winYQ + winHeightQ / 1.4);

  blendMode(BLEND);

  // === アニメーションを記述 ===

  // 秒が変化した時のアニメーション
  if ( secondCurrent != secondPrev )
  {
    isSecondAnim = 1;  // アニメーション開始

    //ウィンドウを左下に向かって描画させる
    winX += random(-30, -10);
    winY += random(5, 6);


    //ウィンドウが画面端に触れた際に位置をリセット
    if (winX<0)
    {

      winX=random(460);
    }
    if (winY >510)
    {
      winY=random(510);
    }

    // 変数の更新
    winWidth = random(130, 160);
    winHeight = random(60, 100);
    winm = winHeight / 8;
    batsuXL = winX + winWidth - 8;
    batsuXR = winX + winWidth - 2;
  }

  if ( isSecondAnim == 1 )  // アニメーション中
  {

    // アニメーション中の処理を記述

    stroke(0);
    //ウィンドウ全体
    fill( 100, 150, 250 );
    rect( winX, winY, winWidth, winHeight );
    //ウィンドウ上部
    fill(255);
    rect(winX, winY, winWidth, winm);
    //ウィンドウ内部
    rect(winX+4, winY+winm+4, winWidth-8, winHeight-winm-8);
    //バツ印の枠
    fill(255, 0, 0);
    rect(winX+winWidth-10, winY, 10, winm);
    //バツ印
    stroke(255);
    line(batsuXL, winY+2, batsuXR, winY+5);
    line(batsuXL, winY+5, batsuXR, winY+2);

    //ウィンドウ内の文字
    textSize( 13 );
    fill(random(255), random(255), random(255));
    text( "Now Loading...", winX+winWidth/10, winY+winHeight/2.5);
    textSize( 15);
    fill(0);
    text( "Please wait...", winX+winWidth/6.4, winY+winHeight/1.4);
    textSize( 25);
    text( second(), winX+winWidth/1.4, winY+winHeight/1.4);

    //マウスポインター
    pushMatrix();
    rotate( radians( 340 ) );

    //マウスポインターを左下に向かって描画させる
    mousex+= random(-9, -5);
    mousey += random(2, 1);

    //マウスポインターが画面端に触れた際に位置をリセット
    if (mousex<0)
    {

      mousex=random(300);
    }
    if (mousey >600)
    {
      mousey=random(600);
    }

    strokeWeight(0.8);
    stroke(0);
    fill(255);
    beginShape();
    vertex( mousex, mousey );
    vertex( mousex-8, mousey+18 );
    vertex( mousex-2, mousey+16 );
    vertex( mousex-2, mousey+24 );
    vertex( mousex+2, mousey+24 );
    vertex( mousex+2, mousey+16 );
    vertex( mousex+8, mousey+18 );
    endShape(CLOSE);
    popMatrix();


    isSecondAnim = 0;  // アニメーション終了
  }


  // 分が変化した時のアニメーション
  if ( minuteCurrent != minutePrev )
  {
    isMinuteAnim = 1;  // アニメーション開始

    // アニメーション初期化
    winX = random(60, 120);
    winY = random(80, 160);
    winWidth = random(300, 500);
    winHeight = random(200, 300);
    winm = winHeight / 14;
    batsuXL = winX + winWidth - 14;
    batsuXR = winX + winWidth - 4;
  }

  if ( isMinuteAnim == 1 )  // アニメーション中
  {
    // アニメーション中の処理を記述
    stroke(0);
    //ウィンドウ全体
    fill( random(255), random(255), random(255));
    rect( winX, winY, winWidth, winHeight );
    //ウィンドウ上部
    fill(255);
    rect(winX, winY, winWidth, winm);
    //ウィンドウ内部
    rect(winX+6, winY+winm+8, winWidth-12, winHeight-winm-12);
    //バツ印の枠
    fill(255, 0, 0);
    rect(winX+winWidth-18, winY, 18, winm);
    //バツ印
    stroke(255);
    strokeWeight(2);
    line(batsuXL, winY+4, batsuXR, winY+13);
    line(batsuXL, winY+13, batsuXR, winY+4);

    //ウィンドウ内の文字
    //404
    fill(220, 0, 0);
    textSize(80);
    text("404", winX+winWidth/3, winY+winHeight/2.5);
    //not found
    fill(0);
    textSize(50);
    text("not found", winX+winWidth/4.5, winY+winHeight/1.7);

    fill(0);
    textSize(10);
    text("The requested URL was not found on this server.", winX+winWidth/4.3, winY+winHeight/1.5);
    text("processing/k_3_b14_tanaka.com/", winX+winWidth/3.5, winY+winHeight/1.4);

    fill(0);
    textSize(10);
    text(minute(), winX+winWidth/2, winY+winHeight/1.3);


    isMinuteAnim = 0;  // アニメーション終了
  }


  // 時が変化した時のアニメーション
  if ( hourCurrent != hourPrev )
  {
    isHourAnim = 1;  // アニメーションの開始

    // アニメーション初期化
    winX = 50;
    winY = 100;
    winWidth = 500;
    winHeight = random( 300, 400);
    winm = winHeight / 14;
    batsuXL = winX + winWidth - 14;
    batsuXR = winX + winWidth - 4;
  }

  if ( isHourAnim == 1 )
  {
    // アニメーション中の処理を記述
    /*１０％の確率で背景が虹色になります。授業内のサンプルプログラムを参考にしてます。
     本当は一時間のみ色をおかしくしたかったのですが、
     RGBモードに戻しても一度背景が虹色になると以降ずっと色がおかしいままで原因が分からなかったので仕方なくそのままにしてます。
     */
    if ( random( 100 ) < 10 )
    {
      colorMode( HSB, iRepeat, 1, 1 );
      noStroke();
      for ( int iX = 0; iX < 600; iX += 40 )
      {
        fill( iX % iRepeat, 1, 1 );
        rect( iX, iY, iWidth, 600 );
      }

      colorMode(RGB);
      //ウィンドウ表示
      stroke(0);
      strokeWeight(2);
      //ウィンドウ全体
      fill( random(255), random(255), random(255));
      rect( winX, winY, winWidth, winHeight );
      //ウィンドウ上部
      fill(255);
      rect(winX, winY, winWidth, winm);
      //ウィンドウ内部
      rect(winX+6, winY+winm+8, winWidth-12, winHeight-winm-12);
      //バツ印の枠
      fill(255, 0, 0);
      rect(winX+winWidth-18, winY, 18, winm);
      //バツ印
      stroke(255);
      strokeWeight(2);
      line(batsuXL, winY+4, batsuXR, winY+13);
      line(batsuXL, winY+13, batsuXR, winY+4);

      //文字。背景が虹色になるとCONGRATULATIONSも文字化けします
      textSize(50);
      fill( random(255), random(255), random(255));
      text( "おめdeとうｇおざiます!!!！！！！", winX+winWidth/23, winY+winHeight/3 );
      textSize(40);
      text( hour(), winX+winWidth/2.2, winY+winHeight/1.6 );
      textSize( 30);
      fill(0);
      text( "You は、 ", winX+winWidth/2.5, winY+winHeight/2.3 );
      text( "t?e", winX+winWidth/2.2, winY+winHeight/2 );
      text( "th", winX+winWidth/2.15, winY+winHeight/1.4);
      text( "訪もｎ?yaです!!!", winX+winWidth/2.45, winY+winHeight/1.3);
    } else
    {
      colorMode(RGB);
      fill( 204 );
      noStroke();
      rect( 0, 0, width, height );

      //ウィンドウ表示
      stroke(0);
      strokeWeight(2);
      //ウィンドウ全体
      fill( random(255), random(255), random(255));
      rect( winX, winY, winWidth, winHeight );
      //ウィンドウ上部
      fill(255);
      rect(winX, winY, winWidth, winm);
      //ウィンドウ内部
      rect(winX+6, winY+winm+8, winWidth-12, winHeight-winm-12);
      //バツ印の枠
      fill(255, 0, 0);
      rect(winX+winWidth-18, winY, 18, winm);
      //バツ印
      stroke(255);
      strokeWeight(2);
      line(batsuXL, winY+4, batsuXR, winY+13);
      line(batsuXL, winY+13, batsuXR, winY+4);

      //文字
      textSize(50);
      fill( random(255), random(255), random(255));
      text( "CONGRATULATIONS!!!", winX+winWidth/23, winY+winHeight/3 );
      textSize(40);
      text( hour(), winX+winWidth/2.2, winY+winHeight/1.6 );
      textSize( 30);
      fill(0);
      text( "You are ", winX+winWidth/2.5, winY+winHeight/2.3 );
      text( "the", winX+winWidth/2.2, winY+winHeight/2 );
      text( "th", winX+winWidth/2.15, winY+winHeight/1.4);
      text( "visitor!!!", winX+winWidth/2.45, winY+winHeight/1.3);
    }





    isHourAnim = 0;  // アニメーション終了
  }

  // 時間をデバッグ表示（ 提出前に非表示にすること．）
  /*
   fill( 0 );
   textSize(20);
   text( hourCurrent + ":" + minuteCurrent + ":" + secondCurrent, 10, 20);
   text( "deltaTimePerSec: " + deltaTimePerSec, 10, 40);
   text( "deltaTime: " + deltaTime, 10, 60);
   */
  // === Time Update ===
  updateTimePost();
}
