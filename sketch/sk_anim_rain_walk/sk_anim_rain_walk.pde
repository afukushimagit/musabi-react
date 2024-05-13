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
// 100個の雨粒の情報
// [0]:X座標値，[1]:Y座標値，[2]:スピード
float[][] fAmeXYS = new float[100][3];

// 正円
float fCircleX = 0;  // X座標値

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
  
  // 雨粒の初期化
  for( int iAmeIdx=0; iAmeIdx < fAmeXYS.length; iAmeIdx++ )
  {
    fAmeXYS[iAmeIdx][0] = random( width );     // X座標値
    fAmeXYS[iAmeIdx][1] = random( height );    // Y座標値
    fAmeXYS[iAmeIdx][2] = random( 10, 20 );    // 雨粒のスピード
  }
  
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
  
  // 100個の内，半分のアニメーション  
  pushMatrix();
  
  rotate( radians( 10 ) );  // 雨の角度
  translate( 30, -50 );     // 調整
  for( int iAmeIdx=0; iAmeIdx < 50; iAmeIdx++ )
  {
    fill( 0 );
    
    // アニメーション後のY座標値．
    fAmeXYS[iAmeIdx][1] += fAmeXYS[iAmeIdx][2];
    fAmeXYS[iAmeIdx][1] %= height;  // 550超えたら0から繰り返す．
    
    // 雨粒の描画
    line( fAmeXYS[iAmeIdx][0], fAmeXYS[iAmeIdx][1], fAmeXYS[iAmeIdx][0], fAmeXYS[iAmeIdx][1] + 40 );
  }
  
  popMatrix();
  
  // 地面
  fill( 0 );
  rect( 0, 270, 400, 150 );
  
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
  //  正円が左から右まで動く
  if ( minuteCurrent != minutePrev )
  {
    isMinuteAnim = 1;  // アニメーション開始
    
    // アニメーション初期化
    // 正円の位置を左端に
    fCircleX = 0;
  }
  if( isMinuteAnim == 1 )  // アニメーション中
  {
    // アニメーション中の処理を記述
    
    // 秒に応じて移動する
    fCircleX = 400 * ( secondCurrent / 60.0 );
    fill( 255 - secondCurrent );  // 徐々に濡れる
    circle( fCircleX, 210, 120 );
    
    //isMinuteAnim = 0;  // アニメーション終了
  }
  
  // 時が変化した時のアニメーション
  if ( hourCurrent != hourPrev )
  {
    isHourAnim = 1;  // アニメーションの開始
    
    // アニメーション初期化
    
  }
  if( isHourAnim == 1 )
  {
    // アニメーション中の処理を記述
    
    
    
    isHourAnim = 0;  // アニメーション終了
  }
  
  // 100個の内，残りの半分のアニメーション  
  pushMatrix();
  
  rotate( radians( 10 ) );  // 雨の角度
  translate( 30, -50 );     // 調整
  for( int iAmeIdx=50; iAmeIdx < fAmeXYS.length; iAmeIdx++ )
  {
    fill( 0 );
    
    // アニメーション後のY座標値．
    fAmeXYS[iAmeIdx][1] += fAmeXYS[iAmeIdx][2];
    fAmeXYS[iAmeIdx][1] %= height;  // 550超えたら0から繰り返す．
    
    // 雨粒の描画
    line( fAmeXYS[iAmeIdx][0], fAmeXYS[iAmeIdx][1], fAmeXYS[iAmeIdx][0], fAmeXYS[iAmeIdx][1] + 40 );
  }
  
  popMatrix();
  
  
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
