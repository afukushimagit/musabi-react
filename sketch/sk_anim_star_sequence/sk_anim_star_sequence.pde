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
// 星型
float fStarX = 400;         // 座標値
float fStarY = 0;
float fStarSize = 40;       // 大きさ
float fStarSpeed = 100;     // 移動速度（ピクセル/秒）
float fStarRot = 0;         // 回転角度
float fStarSpeedRot = 100;  // 回転速度（°/秒）
float fStarTimer = 0;       // タイマー

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
  //  星型が画面上から出現し，画面中央にとどまった後画面下に去る．
  if ( hourCurrent != hourPrev )
  {
    isHourAnim = 1;  // アニメーションの開始
    
    // アニメーション初期化
    fStarX = 200;  // 初期位置
    fStarY = 0;
    fStarRot = 0;  // 回転0
    fStarTimer = 0;// タイマーリセット
  }
  if( isHourAnim == 1 )
  {
    if( fStarTimer < 10 )  // アニメーションの継続条件
    {
      // 位置
      if( fStarTimer < 2 )  // 最初の2秒間
      {
        fStarY += fStarSpeed * deltaTime;
      }
      else if( fStarTimer < 5 )  // 次の3秒間
      {
        // 停止
      }
      else if( fStarTimer < 10 )  // 最後の5秒間
      {
        fStarY += fStarSpeed * 2 * deltaTime;
      }
      
      // 回転
      fStarRot += fStarSpeedRot * deltaTime;
      
      // タイマーを進める
      fStarTimer += deltaTime;
      
      // 星型描画
      pushMatrix();
      
      translate( fStarX, fStarY );   // 移動
      rotate( radians( fStarRot ) );  // 回転
      
      fill( 255 );
      stroke( 0 );
      beginShape();
      for( int iDeg = 18; iDeg < 360; iDeg += 72 )
      {
        float fSX = fStarSize * cos( radians( iDeg ) ) / 2;
        float fSY = fStarSize * sin( radians( iDeg ) ) / 2;
        float fLX = fStarSize * cos( radians( iDeg + 36 ) );
        float fLY = fStarSize * sin( radians( iDeg + 36 ) );
        vertex( fSX, fSY );
        vertex( fLX, fLY );
      }
      endShape( CLOSE );
      
      popMatrix();
    }
    else
    {
      isHourAnim = 0;  // アニメーション終了
    }
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
