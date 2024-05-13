// === アニメーション用変数/定数 ===
float fCircleX = 0;         // 座標値
float fCircleY = 400;
float fCircleSpeedX = 0;    // 移動速度（ピクセル/秒）
float fCircleSpeedY = 0;

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
    fCircleX = 0;         // 初期位置
    fCircleY = 50;
    fCircleSpeedX = 300;  // 初速
    fCircleSpeedY = 0;
  }
  if( isMinuteAnim == 1 )  // アニメーション中
  {
    if( fCircleX < 400 )  // アニメーションの継続条件
    {
      // 位置
      fCircleX += fCircleSpeedX * deltaTime;
      fCircleY += fCircleSpeedY * deltaTime;
      
      // 速度
      fCircleSpeedY += 350 * deltaTime;  // 重力加速
      
      fill( 255 );
      stroke( 0 );
      circle( fCircleX, fCircleY, 20 );
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
