/**************************************************************
  アニメーションフレームワーク
  png出力機能が無い簡易版
 **************************************************************/
/**
  デバッグ機能
    'H'キー：時が変わったときのアニメーション再生
    'M'キー：分が変わったときのアニメーション再生
*/

// === アニメーション用変数/定数 ===
float fCX = 200;     // 正円のXY座標
float fCY = 260;
int iCJumpDeg = 0;   // ジャンプ用角度

float fSX = 180;     // 正方形のXY座標
float fSY = 150;
int iSJumpDeg = 0;   // ジャンプ用角度

// === Time Handling ===

int hourCurrent;       // 現在の時（0~23）
int minuteCurrent;     // 現在の分（0~59）
int secondCurrent;     // 現在の秒（0~59）
float deltaTime;       // 前フレームからの経過時間（秒,0~1）
float deltaTimePerSec; // 前回の秒が切り替わってからの経過時間（秒,0~1）
int isHourAnim = 0;    // アニメーションフラグ（1:アニメーション中）
int isMinuteAnim = 0;
int isSecondAnim = 0;

int hourPrev;
int minutePrev;
int secondPrev;
float millisCurrent;
float millisPrev;
float millisPrevSec;
  
void setup()
{
  size( 400, 400 );
  frameRate( 30 );  // フレームレートの指定
  
  // === Time Init ===
  initTime();
}

void draw()
{  
  // === Time Update ===
  updateTimePre();
  
  //hourCurrent = 1;  // 時 を指定して描画を確認したい場合に一時的に有効化
  
  // === 画面のクリア ===
  
  // 画面をクリア
  fill( 204  );
  noStroke();
  rect( 0, 0, width, height );

  // 既定の描画カラーに戻す．
  fill( 255 );
  stroke( 0 );
  
  // === アニメーションを記述 ===
  
  // 地面
  fill( 0 );
  rect( 0, 275, 400, 150 );
  
  // 秒が変化した時のアニメーション
  if ( secondCurrent != secondPrev )
  {
    isSecondAnim = 1;  // アニメーション開始
    
    // アニメーション初期化
    
    
  }
  if ( isSecondAnim == 1 )  // アニメーション中
  {
    // アニメーション中の処理を記述
    
    
    
    isSecondAnim = 0;  // アニメーション終了
  }
  
  
  // 分が変化した時のアニメーション
  if ( minuteCurrent != minutePrev )
  {
    isMinuteAnim = 1;  // アニメーション開始
    
    // アニメーション初期化
    
    
  }
  if( isMinuteAnim == 1 )  // アニメーション中
  {
    // アニメーション中の処理を記述
    
    
    
    isMinuteAnim = 0;  // アニメーション終了
  }
  
  
  // 時が変化した時のアニメーション
  if ( hourCurrent != hourPrev )
  {
    isHourAnim = 1;  // アニメーションの開始
    
    // アニメーション初期化
    iCJumpDeg = 0;
    iSJumpDeg = 0;
  }
  if( isHourAnim == 1 )
  {
    // アニメーション中の処理を記述
    
    // 正円
    if( iCJumpDeg < 180 )
    {
      // ジャンプ中
      iCJumpDeg += 10;
      fCY = 260 - 65 * sin( radians( iCJumpDeg ) );
    }
    
    // 正方形
    if( iCJumpDeg > 0 && iCJumpDeg < 80 )  // 正円が当たるまで待機
    {
    }
    else if( iSJumpDeg < 180 ) // ジャンプ開始
    {
      // ジャンプ中
      iSJumpDeg += 10;
      fSY = 150 - 20 * sin( radians( iSJumpDeg ) );
    }
    
    // 正円と正方形がジャンプを終えたら
    if( iCJumpDeg >= 180 && iSJumpDeg >= 180 )
    {
      isHourAnim = 0;  // アニメーション終了
    }
  }
  
  // 正円と正方形の図形描画は常に行う
  fill( 255 );
  stroke( 0 );
  circle( fCX, fCY, 30 );
  
  fill( 80 );
  square( fSX, fSY, 40 );
  
  // 時間をデバッグ表示（ 提出前に非表示にすること．）
  fill( 0 );
  textSize(20);
  text( hourCurrent + ":" + minuteCurrent + ":" + secondCurrent, 10, 20);
  text( "deltaTimePerSec: " + deltaTimePerSec, 10, 40);
  text( "deltaTime: " + deltaTime, 10, 60);
  
  // === Time Update ===
  updateTimePost();
}

// === Time Handling Functions===
void initTime()
{
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
void updateTimePre()
{ 
  if( hourPrev != hour() ) hourCurrent = hour();
  if( minutePrev != minute() ) minuteCurrent = minute();
  secondCurrent = second();
  millisCurrent = millis();
  
  deltaTime = ( millisCurrent - millisPrev ) / 1000;
  
  if ( secondCurrent != secondPrev )
  {
    millisPrevSec = millis();
  }
  
  deltaTimePerSec = ( millisCurrent - millisPrevSec ) / 1000;
}
void updateTimePost()
{ 
  hourPrev = hourCurrent;
  minutePrev = minuteCurrent;
  secondPrev = secondCurrent;
  millisPrev = millisCurrent;
}
void keyPressed()
{
  if ( key == 'h' )
  {
    hourPrev = -1;
  }
  else if ( key == 'm' )
  {
    minutePrev = -1;
  }
}
