/**************************************************************
Sakuhin Caption...
オイルタイマーを書きました。一秒とにオイルが一滴落ち、一分で
下にたまっていたオイルが融合して、右下にたまっていき、一時間で
すべてのオイルが落ち切ってランダムな色に変わって再びオイルが満たされて
落ちていきます。
 **************************************************************/
/**
  デバッグ機能
    'S'キー：png出力
    'H'キー：時が変わったときのアニメーション再生
    'M'キー：分が変わったときのアニメーション再生
*/
// === 'S'キーを押した時の出力画像名 ===
//  "K3_[クラス][番号]_[苗字].png"
String pngName = "K3_D02_Fukushima.png";

// === アニメーション用変数/定数 ===



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
  size( 600, 1000 );
  frameRate( 30 );  // フレームレートの指定
    
  for (int i = 0; i < maxDrops; i++) {
  dropActive[i] = false;
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
  fill( 255 );
  noStroke();
  rect( 0, 0, width, height );

  // 既定の描画カラーに戻す．
  fill( 255 );
  stroke( 0 );
  
  // === アニメーションを記述 ===
  oH = 50 + secondCurrent*0.0847222222 + minuteCurrent*5.08333333; //オイルの水位
  mX = 50*pow( 1.0391, minuteCurrent );
  mY = 50*pow( 1.03225, minuteCurrent );
  
  if (secondCurrent == 12) //オイルが角まで移動すると溜まっているオイルが大きくなる
  {
    mX = mX*1.0391;
    mY = mY*1.03225;
    
    iX = 75;
  }


  drawOil();
  drawSunadokei();
  dropOil();
  drawStoredOil();
  drawMargedOil();
  
  if (secondCurrent < 12) //分が変わるとオイルの塊が角に向かって移動する
  {
    drawIdouOil();
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
    if (minuteCurrent != 0) //一時間で溜まったオイルが落ちきるように一秒ごとに水位が変化
    {
      oH += 0.0847222222;
    }
    else
    {
      oH = 50;
    }
    
    if (minuteCurrent > 49) //砂時計の形に沿うようにオイルの描画に使う変数の値を変化させる
    {
      oX = 9*oH - 2650;
      oY = oH;
      
      if (oX > 500)
      { oX = 500;}
    }
    if (minuteCurrent == 0)
    {
      oX = 50;
      oY = 300;
    }
    
 
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
    // ▼ 分が変わったらオイルをリセット
    storedCount = 0;
    isOilSolid = false;
    
    isMinuteAnim = 0;  // アニメーション終了
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
    
    oR = random(255);
    oG = random(255);
    oB = random(255);
    
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
