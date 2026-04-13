/**************************************************************
デ情くんを召喚するプログラムです。 1秒おきに蝋燭が明滅し、1分間で魔法陣がじわじわ明るくなって1分経つと色がリセットされ、1時間で1本蝋燭が増えます。
現在の時間に併せて魔法陣の色が変化する仕様となっており、最初の3時間は蝋燭の本数が少ないため、力が足りず暗いままですが、後々蝋燭が増えるにつれどんどん明るくなっていきます。
12本の蝋燭が揃い、0時を超えると、魔法陣から光が放たれデ情くんが召喚されます。（若干紛らわしいのですが、蝋燭の本数-1が現在時刻を表しています。）
 
 **************************************************************/
/**
 デバッグ機能
 'S'キー：png出力
 'H'キー：時が変わったときのアニメーション再生
 'M'キー：分が変わったときのアニメーション再生
 */
// === 'S'キーを押した時の出力画像名 ===
//  "K3_[クラス][番号]_[苗字].png"
String pngName = "K3_A07_fukushima.png";

// === アニメーション用変数/定数 ===

int ih = 0;
float fR = 0;
float fG = 0;
float fB = 0;


//フレーム保持用変数
int isSecondFrame = 0;
int isShokanFrame = 0;


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
  size(600, 700);
  /*
  //魔法陣の最終目的値目安（メモ）
  fR=148;
   fG=93;
   fB=216;
   */
   

  frameRate( 30 );  // フレームレートの指定

  // === Time Init ===
  initTime();
  
  //現在時刻の取得＆12時間表記への変換
  if (hourCurrent<=11)
  {
    ih=hourCurrent;
  } else
  {
    ih=hourCurrent-12;
  }
}


void draw()
{
  // === Time Update ===
  updateTimePre();

  //hourCurrent = 1;  // 時 を指定して描画を確認したい場合に一時的に有効化

  // === 画面のクリア ===

  /*
  // 画面をクリア
   fill( 204  );
   noStroke();
   rect( 0, 0, width, height );
   
   // 既定の描画カラーに戻す．
   fill( 255 );
   stroke( 0 );
   */
  // === アニメーションを記述 ===

  background(10, 16, 43);
  fill(15, 31, 58);
  rect(0, 300, width, height); //床

//魔法陣描画
  pushMatrix();
  scale(1, 0.5);
  translate(0, 630);
  mahoujin();
  //ルーン文字円環（処理が重すぎたので３つの関数に分けてます）
  dejoukun1 (285, 105);
  dejoukun2 (285, 105);
  dejoukun3 (285, 105);
  popMatrix();


//蝋燭の描写＆本数と時間の同期
  hAnim(); 

//12時にデ情くんを召喚するための関数
  Shokan();

//////////////////////////////////////////////////////////
  /* 秒のアニメーション（光の明滅）は関数candle内に移動
   // 秒が変化した時のアニメーション
   if ( secondCurrent != secondPrev )
   {
   isSecondAnim = 1;  // アニメーション開始
   isSecondFrame = 30;
   
   // アニメーション初期化
   }
   if ( isSecondAnim == 1 )  // アニメーション中
   {
   // アニメーション中の処理を記述
   
   if( isSecondFrame > 0)
   {
   drawlight();
   isSecondFrame --;
   }
   else
   {
   isSecondAnim = 0;
   }
   
   // アニメーション終了
   }
   */

////////////////////////////////////////////
  // 分が変化した時のアニメーション　
  if ( minuteCurrent != minutePrev )
  {
    isMinuteAnim = 1;  // アニメーション開始

    // アニメーション初期化
  }
  if ( isMinuteAnim == 1 )  // アニメーション中
  {
    // アニメーション中の処理を記述
    
    //魔法陣の色を初期化（一分おき）。時間に応じて初期値が明るくなる
    if (ih<=3)
    {
      fR=1.48;
      fG=0.93;
      fB=2.16;
    }
    if ((7<=ih)&&(ih<=12))
    {
      fR=1.48*30;
      fG=0.93*30;
      fB=2.16*30;
    }

    isMinuteAnim = 0;  // アニメーション終了
  }


  // 時が変化した時のアニメーション
  if ( hourCurrent != hourPrev )
  {
    isHourAnim = 1;  // アニメーションの開始

    // アニメーション初期化
  }
  if ( isHourAnim == 1 )
  {
    // アニメーション中の処理を記述
    if (ih>=12)
    {
      isShokanFrame=500;
    }


    isHourAnim = 0;  // アニメーション終了
  }


  /*
  // 時間をデバッグ表示（ 提出前に非表示にすること．）
   fill( 255 );
   textSize(20);
   text( hourCurrent + ":" + minuteCurrent + ":" + secondCurrent, 10, 20);
   text( "deltaTimePerSec: " + deltaTimePerSec, 10, 40);
   text( "deltaTime: " + deltaTime, 10, 60);
   text(ih, 300, 20);
   text(fR, 400, 20);
   text(fG, 400, 40);
   text(fB, 400, 60);
   */
  // === Time Update ===
  updateTimePost();
}
