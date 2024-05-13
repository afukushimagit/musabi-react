// === アニメーション用変数/定数 ===
float fSquareX = 200;         // 正方形の座標値
float fSquareY = 0;
float fSquareSpeed;           // 正方形の速度（秒速）

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
    fSquareX = random( 50, 350 );         // 初期位置
    fSquareY = 0;
    fSquareSpeed = 10;
  }
  if ( isMinuteAnim == 1 )  // アニメーション中
  {
    if ( fSquareY < 400 )  // アニメーションの継続条件
    {
      // 位置
      fSquareY += fSquareSpeed * deltaTime;

      // 速度
      fSquareSpeed += 600 * deltaTime;  // 重力加速

      fill( 255 );
      stroke( 0 );
      square( fSquareX, fSquareY, 30 );
    } else
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
