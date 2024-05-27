/**************************************************************
18~5字に月，6~17時に太陽が昇り，時によって角度が変わる．
分毎に海の潮位が上昇し，時が変わった時に潮位が戻るアニメーションを再生する．
秒毎に船が右に移動する
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
// 潮位タイマー
float fOceanHeight = 0;
float fOceanTimer = 0;

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
  
  // 現在の時を調整 6~29
  //int fHourOffset6 = ( 2 * secondCurrent ) / 5 + 6;  // 秒でテスト
  int fHourOffset6 = hourCurrent + 6;
  // 24以降を巻き戻す 0~23
  // 0~12が夜,13~23が昼
  int fHourShisted = fHourOffset6 % 24;

  // 太陽と月の回転角度 0~90°
  float fSunMoonRot = 90 * ( fHourShisted % 12 ) / 12.0;

  // 月or太陽，空の描画
  colorMode( HSB, 100 );
  pushMatrix();
  if ( fHourShisted < 12 )
  {
    // 夜の進行0~1
    float fProgress = fHourShisted / 11.0;
    float fProgressSin = sin( radians( 180 * fProgress ) );

    // 空
    fill( fProgress * 40  );
    noStroke();
    rect( 0, 0, width, height );

    // 月
    translate( 200, 400 );
    rotate( radians( fSunMoonRot ) );
    float fBrightness = 60 + 40 * sin( radians( 180 * deltaTimePerSec ) );
    fill( 15, 100, fBrightness );
    circle( -240, -180, 100 );
    fill( fProgress * 40 );
    // 月の影
    ellipse( -245 - 100 * fProgressSin, -180 + 10 * fProgressSin, 100, 100 );
  }
  else
  {
    // 昼の進行0~1
    float fProgress = ( fHourShisted - 12 ) / 11.0;

    // 空
    fill( 50 + 20 * fProgress, 20, 60 + 40 * sin( radians( 180 * fProgress ) ) );
    noStroke();
    rect( 0, 0, width, height );

    // 太陽
    translate( 200, 380 );
    rotate( radians( fSunMoonRot ) );
    float fHue = 5 + 15 * sin( radians( 180 * deltaTimePerSec ) );
    fill( fHue, 60, 80 );
    circle( -240, -180, 100 );
  }
  popMatrix();

  // 海
  colorMode( HSB, 100 );
  noStroke();
  fill( random( 60, 61 ), 60, 80, 40 );
  ellipse( 200, 400, 400 + 2 * fOceanHeight, fOceanHeight );

  // 船
  pushMatrix();
  // 現在の秒と潮位の影響で位置を変える
  translate( 20 + secondCurrent * 6, 400 - fOceanHeight / 2 );
  colorMode( HSB, 100 );
  stroke( 0 );
  fill( 0, 0, 100, 40 );
  beginShape();
  vertex( -30, -15 );
  vertex( 25, -15 );
  vertex( 15, 15 );
  vertex( -25, 15 );
  endShape(CLOSE);
  popMatrix();

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
  if ( isMinuteAnim == 1 )  // アニメーション中
  {
    isMinuteAnim = 0;  // アニメーション終了
  }

  // 時が変化した時のアニメーション
  // 潮位
  if ( hourCurrent != hourPrev )
  {
    isHourAnim = 1;  // アニメーションの開始

    // アニメーション初期化
    fOceanTimer = 0;  // タイマーリセット
  }
  if ( isHourAnim == 1 )
  {
    // 潮位が0に下がるアニメーション
    if ( fOceanTimer < 3 )
    {
      // ３秒間の間の進行率（0~1）
      float fOceanProgress = fOceanTimer / 3.0;

      // 潮位更新
      fOceanHeight = 40 + 360 * ( 1 - fOceanProgress );  // 400~40

      fOceanTimer += deltaTime;  // タイマー更新
    }
    else
    {
      isHourAnim = 0;  // アニメーション終了
    }
  }
  else
  {
    // 非アニメーション中
    // 分毎に海の潮位が上昇
    fOceanHeight = 40 + minuteCurrent * 6;  // 400~40
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
