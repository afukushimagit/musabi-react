/**************************************************************
Sakuhin Caption...


 **************************************************************/
/**
  デバッグ機能
    'S'キー：png出力
    'H'キー：時が変わったときのアニメーション再生
    'M'キー：分が変わったときのアニメーション再生
*/
// === 'S'キーを押した時の出力画像名 ===
//  "K3_[クラス][番号]_[苗字].png"
String pngName = "K3_A00_Fukushima.png";

// === アニメーション用変数/定数 ===
float fSuitekiY = -10;// 水滴Y座標値
float fSuiiY = 400;   // 水位Y
float fSuiTimer = 4;  // タイマー

// === Time Handling ===

int hourCurrent;       // 現在の時（0~23）
int minuteCurrent;     // 現在の分（0~59）
int secondCurrent;     // 現在の秒（0~59）
float deltaTime;       // 前フレームからの経過時間（秒,0~1）
float deltaTimePerSec; // 前回の秒が切り替わってからの経過時間（秒,0~1）
int isHourAnim = 0;    // アニメーションフラグ（1:アニメーション中）
int isMinuteAnim = 1;  // 最初からフラグを立てておく
int isSecondAnim = 0;

 
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
 
 // 水関連の描画関数呼び出し
  drawSui();
  
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
  // 水が引くアニメーション
  if ( minuteCurrent != minutePrev )
  {
    isMinuteAnim = 1;  // アニメーション開始
    
    // アニメーション初期化
    fSuiTimer = 0;
  }
  if( isMinuteAnim == 1 )  // アニメーション中
  {
    // アニメーション中の処理を記述

    if( fSuiTimer < 3 )  // はじめの3秒間
    {
      // 水が引くアニメーション
      fSuitekiY = -20;  // 水滴表示しない
      fSuiiY = 130 * fSuiTimer;
      fSuiTimer += deltaTime;
    }
    else
    {
      // 水滴が落ちて水カサが増える．
      fSuitekiY = height * deltaTimePerSec * deltaTimePerSec;  // 若干加速するように
      fSuiiY = height - ( height / 60 ) * secondCurrent;
      //isMinuteAnim = 0;  // アニメーション終了しない
    }    
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
  
  // 時間をデバッグ表示（ 提出前に非表示にすること．）
  fill( 0 );
  textSize(20);
  text( hourCurrent + ":" + minuteCurrent + ":" + secondCurrent, 10, 20);
  text( "deltaTimePerSec: " + deltaTimePerSec, 10, 40);
  text( "deltaTime: " + deltaTime, 10, 60);
  
  // === Time Update ===
  updateTimePost();
}

// 水関連の描画
void drawSui()
{
  // 水滴
  fill( 255 );
  stroke( 0 );
  circle( width/2, fSuitekiY, 20 );

  // 水たまり
  noStroke();
  rect( 0, fSuiiY, width, height );
}
