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
float fFallFaceX = 0;
float fFallFaceY = 0;
float fFaceHSB[] = { random( 360 ), 100, 100 };
float fFaceMinScale = 1;
float fFaceTimer = 0;

// === Time Handling ===

int hourCurrent;       // 現在の時（0~23）
int minuteCurrent;     // 現在の分（0~59）
int secondCurrent;     // 現在の秒（0~59）
float deltaTime;       // 前フレームからの経過時間（秒,0~1）
float deltaTimePerSec; // 前回の秒が切り替わってからの経過時間（秒,0~1）
int isHourAnim = 0;    // アニメーションフラグ（1:アニメーション中）
int isMinuteAnim = 1;  // 常にフラグをたてておく
int isSecondAnim = 0;

 
void setup()
{
  size( 400, 400 );
  frameRate( 30 );  // フレームレートの指定
  
  // === Time Init ===
  initTime();
  
  // タイマーを時刻秒と同期
  fFaceTimer = secondCurrent; 
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
  
  // 降ってくる顔
  fFallFaceX += random( -4, 4 );
  fFallFaceY = height * deltaTimePerSec;
  drawFace( fFallFaceX, fFallFaceY, 1, fFaceHSB[0], fFaceHSB[1], fFaceHSB[2] );
  
  // 中央の大きな顔
  drawFace( 200, 350, fFaceMinScale, fFaceHSB[0], fFaceHSB[1], fFaceHSB[2] );
  
  
  // 秒が変化した時のアニメーション
  // 色相をランダムに変更し，降ってくる顔のX座標を初期位置へ
  if ( secondCurrent != secondPrev )
  {
    isSecondAnim = 1;  // アニメーション開始
    
    // アニメーション初期化
    
    // 色をランダム
    fFaceHSB[0] = random( 360 );
    
    // 小さい顔の初期X座標値
    fFallFaceX = 50 + secondCurrent * 5;
  }
  if ( isSecondAnim == 1 )  // アニメーション中
  {
    // アニメーション中の処理を記述
    
    
    
    isSecondAnim = 0;  // アニメーション終了
  }
  
  
  // 分が変化した時のアニメーション
  // 中央の顔が膨れたり萎む
  if ( minuteCurrent != minutePrev )
  {
    isMinuteAnim = 1;  // アニメーション開始
    
    // アニメーション初期化
    
    // タイマーリセット
    fFaceTimer = 0;
  }
  if( isMinuteAnim == 1 )  // アニメーション中
  {
    // アニメーション中の処理を記述
    if( fFaceTimer < 8 )  // 萎む
    {
      fFaceMinScale = 3 - 2 * fFaceTimer / 8.0;
    }
    else                      // 膨れる
    {
      fFaceMinScale = 1 + 2 * fFaceTimer / 60.0;
    }
    
    fFaceTimer += deltaTime;
    //isMinuteAnim = 0;  // アニメーション終了しない
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

// 顔の描画関数
void drawFace( float fX, float fY, float fScale, float fH, float fS, float fB )
{
  pushMatrix();
  
  translate( fX, fY );
  scale( fScale );
  
  colorMode( HSB, 360, 100, 100 );
  strokeWeight( 2 );
  
  fill( fH, fS, fB );
  ellipse( 0, 0, 80, 70 );
  arc( -23, -27, 14, 20, radians( -220 ), radians( -10 ) );
  arc( 23, -27, 14, 20, radians( -170 ), radians( 40 ) );
  
  fill( 0 );
  circle( -13, -2, 9 );
  circle( 13, -2, 9 );
  
  line( -18, -12, -10, -13 );
  line( 18, -12, 10, -13 );
  
  fill( fH, fS, fB );
  noStroke();
  ellipse( -13, -4, 6, 5 );
  ellipse( 13, -4, 6, 5 );

  stroke( 0 );
  arc( -3, 10, 6, 6, radians( 0 ), radians( 180 ) );
  arc( 3, 10, 6, 6, radians( 0 ), radians( 180 ) );
  
  popMatrix();
}
