/**************************************************************
 Sakuhin Caption...
 秒毎に尻尾が左右に揺れ、時間が1分進むと耳がピコッと動きます。
 12時間制で机の上の肉球の数が変わります。
 朝、昼、夕方、夜で魚の骨の絵の色が変わります。
 約3秒以上、10秒以内に一回ランダムなタイミングでまばたきをします。
 キャラを上下にちょっとずつ揺らすことで、呼吸しているように見えるようにしました。
 要所要所chatGPTに助けてもらいました。
 **************************************************************/
/**
 デバッグ機能
 'S'キー：png出力
 'H'キー：時が変わったときのアニメーション再生
 'M'キー：分が変わったときのアニメーション再生
 */

// === 'S'キーを押した時の出力画像名 ===
//  "K3_[クラス][番号]_[苗字].png"
String pngName = "K3_A21_Fukushima.png";

// === アニメーション用変数/定数 ===
float angle = 0;
float targetAngle = 5;

float easing = 0.05;
float earEasing=1;

float earMaxAngle = 10;
float earAngle = 0;
float earTargetAngle = 0;

int earAnimStep = 0;
int earAnimTimer = 0;
int animTimer = 0;

int tiltDuration = 7;
int returnDuration = 60;
float tiltEasing = 0.2;
float returnEasing = 0.05;

float tailAngle = 0;
float tailTargetAngle = 5;
float tailEasing = 0.01;

int defaultEyeballY = -3;
int blinkEyeballY = -10;

int blinkTimer = 0;
int blinkInterval = int(random(180, 600));
int blinkDuration = 15;
boolean isBlinking = false;
int defaultEyelashY = -20;
int closedEyelashY = -10;

int baseX = 0;
int hourWidth = 60;
int totalHours = 12;

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
  size(400, 300);
  frameRate(60);
  noStroke();
  initTime();
}

void draw()
{
  // === Time Update ===
  updateTimePre();
  background(40);
  picture();


    //////まばたき
    if (!isBlinking) {
      blinkTimer++;
      if (blinkTimer >= blinkInterval) {
        blinkTimer = 0;
        isBlinking = true;
      }
    } else {
      if (isBlinking) {
        blinkTimer++;

        int halfDuration = blinkDuration / 2;

        if (blinkTimer < halfDuration) {
          eyeHight = 0;
          eyelashY = closedEyelashY;
          eyeballY = blinkEyeballY;
        } else if (blinkTimer < blinkDuration) {
          eyeHight = 17;
          eyelashY = defaultEyelashY;
          eyeballY = defaultEyeballY;
        } else {
          isBlinking = false;
          blinkTimer = 0;
          blinkInterval = int(random(180, 600));
        }
      } else {
        blinkTimer++;

        if (blinkTimer > blinkInterval) {
          isBlinking = true;
          blinkTimer = 0;
        }
      }
    }
    //////まばたき終わり


    //////尻尾
    if (secondCurrent != secondPrev)
    {
      if (secondCurrent % 1 == 0)
      {
        if (tailTargetAngle > 0)
        {
          tailTargetAngle = -10;
        } else
        {
          tailTargetAngle = 10;
        }
      }
    }
    tailAngle += (tailTargetAngle - tailAngle) * tailEasing;
    pushMatrix();
    translate(285, 290 + 5);
    rotate(radians(tailAngle));
    translate(0, -130);
    tail();
    popMatrix();
    //////尻尾終わり


    //////体上下
    float period = 6.0;
    float amplitude = 2;
    float timeInSec = millis() / 1000.0;
    float characterYOffset = sin(TWO_PI * timeInSec / period) * amplitude;

    pushMatrix();
    translate(285, 160 + characterYOffset);
    character();
    popMatrix();
    //////体上下終わり


    //////耳
    if (minuteCurrent != minutePrev)
    {
      minutePrev = minuteCurrent;

      earAnimStep = 1;
      earAnimTimer = tiltDuration;
      targetAngle = 10;
    }

    if (earAnimStep == 1)
    {
      angle += (targetAngle - angle) * tiltEasing;
      earAnimTimer--;
      if (earAnimTimer <= 0)
      {
        earAnimStep = 2;
        earAnimTimer = returnDuration;
        targetAngle = 0;
      }
    } else if (earAnimStep == 2)
    {
      angle += (targetAngle - angle) * returnEasing;
      earAnimTimer--;
      if (earAnimTimer <= 0)
      {
        earAnimStep = 0;
        angle = 0;
      }
    }
    pushMatrix();
    translate(285, 160 + characterYOffset);
    pushMatrix();
    rotate(radians(angle));
    leftEar();
    popMatrix();
    pushMatrix();
    rotate(radians(-angle));
    rightEar();
    popMatrix();
    popMatrix();
    //////耳終わり


  //////その他
  pushMatrix();
  translate(285, 160);
  hands();
  popMatrix();
  desk();
  paws();
  //////その他終わり

  /*
   // 時間をデバッグ表示（ 提出前に非表示にすること．）
   fill( 0 );
   textSize(20);
   text( hourCurrent + ":" + minuteCurrent + ":" + secondCurrent, 10, 20);
   text( "deltaTimePerSec: " + deltaTimePerSec, 10, 40);
   text( "deltaTime: " + deltaTime, 10, 60);
   
   secondPrev = secondCurrent;
   //////時間終わり
   */

  // === Time Update ===
  updateTimePost();
}
