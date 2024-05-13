int secondCurrent;     // 現在の秒（0~59）
int secondPrev;        // 前フレームの秒（0~59）
float millisPrevSec;   // プログラム開始から前回の秒が変わった時までの経過時間（ミリ秒）

void setup()
{
  size( 400, 400 );
  frameRate( 30 );
  millisPrevSec = 0;
}

void draw()
{
  background( 204 );
  
  // === Time Update ===
  int secondCurrent = second();    // 現在の秒（0~60）
  float millisCurrent = millis();  // プログラムの開始から現在までの経過時間（ミリ秒）
  
  if( secondCurrent != secondPrev )
  {
    millisPrevSec = millis();
  }
  
  // 前回の描画切り替わってから現在までの経過時間（秒,0~1）
  float deltaTimePerSec = ( millisCurrent - millisPrevSec ) / 1000;
  
  // === アニメーションを記述 ===
  
  // １秒周期で左右に往復する正円
  float fX = 200 + 100 * cos( radians( 360 * deltaTimePerSec ) );
  fill( 255 );
  circle( fX, 200, 40 );
  
  // 時間をデバッグ表示
  fill( 0 );
  textSize(20);
  text( "deltaTimePerSec: " + deltaTimePerSec, 10, 20 );
  
  // === Time Update ===
  secondPrev = secondCurrent;
}
