// 線の座標値
float fLineX = 0;
float fLineY = 200;

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

  if ( secondCurrent != secondPrev )
  {
    millisPrevSec = millis();
  }

  // 前回の描画切り替わってから現在までの経過時間（秒,0~1）
  float deltaTimePerSec = ( millisCurrent - millisPrevSec ) / 1000;

  // === アニメーションを記述 ===
  // 1秒周期で速度を変えながらランダムに右へ移動する線
  
  // 線の次のXY座標値
  float fLineNextX = fLineX + 10 * deltaTimePerSec;
  float fLineNextY = fLineY + random( -12, 12 ) * deltaTimePerSec;

  // 線の描画
  stroke( 0 );
  strokeWeight( 8 );
  line( fLineX, fLineY, fLineNextX, fLineNextY );

  // 線の座標値更新
  fLineX = fLineNextX;
  fLineY = fLineNextY;
  
  // 線の座標値リセット
  if( fLineX > 400 )
  {
    fLineX = 0;
    fLineY = 200;
  }

  // 時間をデバッグ表示
  fill( 0 );
  textSize(20);
  text( "deltaTimePerSec: " + deltaTimePerSec, 10, 20 );

  // === Time Update ===
  secondPrev = secondCurrent;
}
