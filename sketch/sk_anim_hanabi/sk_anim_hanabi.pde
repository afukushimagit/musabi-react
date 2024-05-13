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

// 背景の星
float[][] iStarsProp = new float[20][5];

// 花火
float [][] fHanabiProp = new float[20][6];

float fHanabiTimer = 0;  // 花火タイマー

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
  
  // 星配列の初期化
  for( int iStar = 0; iStar < iStarsProp.length; iStar++ ) 
  {
    iStarsProp[iStar][0] = random( width );    // X座標
    iStarsProp[iStar][1] = random( height );   // Y座標
    iStarsProp[iStar][2] = random( 4, 8 );     // 大きさ
    iStarsProp[iStar][3] = random( 255 );      // 明るさ
    iStarsProp[iStar][4] = 1;                  // 1:明るくなる．-1:暗くなる．
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
  fill( 0 );
  noStroke();
  rect( 0, 0, width, height );

  // 既定の描画カラーに戻す．
  fill( 255 );
  stroke( 0 );
  
  // === アニメーションを記述 ===
  colorMode( HSB, 360, 1, 1, 1 );
  
  // 背景の星
  for( int iStar=0; iStar < iStarsProp.length; iStar++ )
  {
    fill( iStarsProp[iStar][3] );
    circle( iStarsProp[iStar][0], iStarsProp[iStar][1], iStarsProp[iStar][2] );
  }
  // 明るさ更新
  for( int iStar=0; iStar < iStarsProp.length; iStar++ )
  {
    iStarsProp[iStar][3] += iStarsProp[iStar][4] * 255 / 60.0;
    
    // 明るくなるか暗くなるか切り替える．
    if( iStarsProp[iStar][3] < 0 || iStarsProp[iStar][3] > 255 )
    {
      iStarsProp[iStar][4] *= -1;
    }
  }
  
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
    // 花火配列の初期化
    for( int iHanabi = 0; iHanabi < fHanabiProp.length; iHanabi++ ) 
    {
      fHanabiProp[iHanabi][0] = random( 50, 350 );    // X座標
      fHanabiProp[iHanabi][1] = random( 400, 420 );   // Y座標
      fHanabiProp[iHanabi][2] = random( 2, 4 );       // 大きさ
      fHanabiProp[iHanabi][3] = random( 40, 300 );    // 最大の大きさ
      fHanabiProp[iHanabi][4] = random( 255 );        // 色相
      fHanabiProp[iHanabi][5] = 0;                    // 1:明るくなる．-1:暗くなる．
    }
    
    fHanabiTimer = 0;  // タイマーリセット
    print("start");
  }
  if( isHourAnim == 1 )
  {
    // アニメーション中の処理を記述
    
    if( fHanabiTimer < 4 )
    {
      // 上昇中
      for( int iHanabi = 0; iHanabi < fHanabiProp.length; iHanabi++ ) 
      {
        fHanabiProp[iHanabi][1] -= random( 5, 80 ) * deltaTime;    // 上昇
        fHanabiProp[iHanabi][2] += random( 0, 1 ) * deltaTime;     // 大きさ
        fHanabiProp[iHanabi][5] += random( 0.1, 0.5 ) * deltaTime; // 明るさ
      }    
    }
    else if( fHanabiTimer < 10 )
    {
      // パッと開く
      for( int iHanabi = 0; iHanabi < fHanabiProp.length; iHanabi++ ) 
      {
        // 最大の大きさとの差があるほど早く大きくなる
        fHanabiProp[iHanabi][2] += ( fHanabiProp[iHanabi][3] - fHanabiProp[iHanabi][2] ) * deltaTime;
        fHanabiProp[iHanabi][5] -= random( 0.5, 1 ) * deltaTime;         // 明るさ
      }    
    }
    else
    {
      isHourAnim = 0;  // アニメーション終了
    }
    
    fHanabiTimer += deltaTime;  // タイマーを進める．
    
    // 花火の描画
    for( int iHanabi = 0; iHanabi < fHanabiProp.length; iHanabi++ ) 
    {
      noFill();
      stroke( fHanabiProp[iHanabi][4], 0.3, fHanabiProp[iHanabi][5], 0.9 );
      strokeWeight( random( 1, 2 ) );
      circle( fHanabiProp[iHanabi][0], fHanabiProp[iHanabi][1], fHanabiProp[iHanabi][2] );
    }
  }
  
  // 時間をデバッグ表示（ 提出前に非表示にすること．）
  fill( 255 );
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
