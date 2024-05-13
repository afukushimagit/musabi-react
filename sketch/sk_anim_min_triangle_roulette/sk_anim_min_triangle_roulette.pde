// === アニメーション用変数/定数 ===
float fTriangleRot = 0;         // 回転値
float fTriangleRotSpeed = 0;    // 回転速度
int iAnimCounter = 0;           // アニメーション用カウンタ

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
    
    // 回転角度を360内で正規化
    if( fTriangleRot > 360 )
    {
      fTriangleRot %= 360;
    }
    fTriangleRotSpeed = 400;
    iAnimCounter = 0;
  }
  if( isMinuteAnim == 1 )  // アニメーション中
  {
    if( iAnimCounter < 90 )  // アニメーションの継続条件
    {
      // 回転角度
      fTriangleRot += fTriangleRotSpeed * deltaTime;
      
      // 回転速度
      fTriangleRotSpeed -= 140 * deltaTime;  // 減速
       
      iAnimCounter++;
    }
    else
    {
      isMinuteAnim = 0;
    }
  }
  
  // 三角形描画
  // アニメーション中以外も常に表示

  pushMatrix();
  
  translate( 200, 200 );
  rotate( radians( fTriangleRot ) );
  
  fill( 255 );
  stroke( 0 );
  triangle( 0, -60, 30, 20, -30, 20 );
  
  popMatrix();
  
  
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
