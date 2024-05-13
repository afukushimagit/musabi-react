// === アニメーション用変数/定数 ===
float fRectY = 0;         // Y座標値

// === Time Handling ===
int minuteCurrent;     // 現在の分（0~59）
float deltaTime;       // 前フレームからの経過時間（秒,0~1）
int minutePrev;        // 前フレームの分（0~59）
float millisPrev;      // プログラム開始から前回のフレームまでの経過時間（ミリ秒）
int isMinuteAnim = 0;  // アニメーションフラグ（1:アニメーション中）

void setup()
{
  size( 400, 400 );
  frameRate( 30 );
  minutePrev = minute();
}

void draw()
{
  background( 204 );
  
  // === Time Update ===
  minuteCurrent = minute();
  int millisCurrent = millis();
  
  // 前フレームからの経過時間（秒,0~1）
  deltaTime = ( millisCurrent - millisPrev ) / 1000;
  
  // === アニメーションを記述 ===
  
  // 分が変化したときにアニメーションを開始する．
  if ( minuteCurrent != minutePrev )
  {
    isMinuteAnim = 1;  // アニメーション開始
    
    // アニメーション初期化
    fRectY = -400;         // 初期位置
  }
  if( isMinuteAnim == 1 )  // アニメーション中
  {
    if( fRectY < 400 )  // アニメーションの継続条件
    {
      // 位置
      fRectY += 300 * deltaTime;
      
      fill( 0 );
      noStroke();
      rect( 0, fRectY, 400, 400 );
    }
    else
    {
      isMinuteAnim = 0;  // アニメーション終了
    }
  }
  
 // 時間をデバッグ表示
  fill( 0 );
  textSize(20);
  text( "secondCurrent:" + second(), 10, 20);
  text( "deltaTime: " + deltaTime, 10, 40);
  
  // === Time Update ===
  minutePrev = minuteCurrent;
  millisPrev = millisCurrent;
}
void keyPressed()
{
  if ( key == 'm' )
  {
    minutePrev = -1;
  }
}
