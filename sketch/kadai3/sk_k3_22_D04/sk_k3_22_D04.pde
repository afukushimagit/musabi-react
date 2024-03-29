/**

ボールのキャラクターの動きと時刻の進みが連動している時計
時間、分、秒が切り替わる時に、キャラクターが各自の時間ボックスを叩く

*/

int iHour; //現在の時間
int iAnimFrameH; // アニメーションフレーム（時間）
int iMinute; //現在の分
int iAnimFrameM; // アニメーションフレーム（分）
int iSecond; // 現在の秒
int iAnimFrameS; // アニメーションフレーム（秒）

void setup()
{
  size(400,250);
  frameRate( 20 );
  iHour = hour();
  iMinute = minute();
  iSecond = second();
  iAnimFrameH = 0;
  iAnimFrameM = 0;
  iAnimFrameS = 0;
}

void draw()
{
  // スクリーンリフレッシュ
  noStroke();
  fill( 201, 201, 201 ); // 背景色（灰色）
  rect( 0, 0, width, height );
  // 地面の色
  fill(256,256,256);
  rect(0,215,400,215);
  stroke( 0 );
  // 地面の描画
  line(0,215,400,215);
  
  // ブロックの描画
    // 時間の矩形アニメーション描画
  float fHourRectY = 40; // 跳ねる矩形の初期Y座標値
  /** アニメーションは3フレーム目に開始して8フレーム目で終了 */
  if( iAnimFrameH > 3 && iAnimFrameH < 8 )
  {
    fHourRectY -= 10 * sin( radians( 180 * ( iAnimFrameH - 3 ) / 5.0 ) );
  }
  fill(256,256,256); //　矩形の色
  rect(70,fHourRectY,60,60);
  fill( 0 );
  textSize( 20 );
  textAlign(CENTER);
  text( iHour, 70+31, fHourRectY+36 );
  noFill();
  
   // 分の矩形アニメーション描画
  float fMinuteRectY = 40; // 跳ねる矩形の初期Y座標値
  /** アニメーションは3フレーム目に開始して8フレーム目で終了 */
  if( iAnimFrameM > 3 && iAnimFrameM < 8 )
  {
    fMinuteRectY -= 10 * sin( radians( 180 * ( iAnimFrameM - 3 ) / 5.0 ) );
  }
  fill(256,256,256); //　矩形の色
  rect(170,fMinuteRectY,60,60);
  fill( 0 );
  textSize( 20 );
  textAlign(CENTER);
  text( iMinute, 170+31, fMinuteRectY+36 );
  noFill();
 
  // 秒の矩形アニメーション描画
  float fSecondRectY = 40; // 跳ねる矩形の初期Y座標値
  /** アニメーションは3フレーム目に開始して8フレーム目で終了 */
  if( iAnimFrameS > 3 && iAnimFrameS < 8 )
  {
    fSecondRectY -= 10 * sin( radians( 180 * ( iAnimFrameS - 3 ) / 5.0 ) );
  }
  fill(256,256,256); //　矩形の色
  rect( 270, fSecondRectY, 60, 60 );
  fill( 0 );
  textSize( 20 );
  textAlign(CENTER);
  text( iSecond, 270+31, fSecondRectY+36 );
  noFill();
  
  // 時間の楕円
  //時間のアニメーション描画
  float fHourEllipseY = 200; // ジャンプする楕円の初期Y座標値
  /** アニメーションは8フレームの間行う．
  8フレームを超えたら初期位置で待機． */
  if( iAnimFrameH < 8 )
  {
    fHourEllipseY -= 90 * sin( radians( 180 * iAnimFrameH / 8.0 ) );
  }
  fill(76,113,71); //　緑色
  ellipse( 100, fHourEllipseY, 30, 30 );
  //　白目（時間）
  fill(256,256,256);
  ellipse(93,fHourEllipseY,7,7);
  ellipse(107,fHourEllipseY,7,7);
  //　黒目（時間）
  fill(0);
  ellipse(93,fHourEllipseY,3,3);
  ellipse(107,fHourEllipseY,3,3);
  // 最新の時間取得
  int iHourNew = hour();
  // アニメーションフレーム（時間）更新
  if( iHour != iHourNew )
  {
    iHour = iHourNew;
    iAnimFrameH = 0;
  }
  else if( iAnimFrameH < 8 )
  {
    iAnimFrameH++;
  }
  
  // 分の楕円
  //分のアニメーション描画
  float fMinuteEllipseY = 200; // ジャンプする楕円の初期Y座標値
  /** アニメーションは8フレームの間行う．
  8フレームを超えたら初期位置で待機． */
  if( iAnimFrameM < 8 )
  {
    fMinuteEllipseY -= 90 * sin( radians( 180 * iAnimFrameM / 8.0 ) );
  }
  fill(240,222,58); //　黄色
  ellipse( 200, fMinuteEllipseY, 30, 30 );
  //　白目（分）
  fill(256,256,256);
  ellipse(93+100,fMinuteEllipseY,7,7);
  ellipse(107+100,fMinuteEllipseY,7,7);
  //　黒目（分）
  fill(0);
  ellipse(93+100,fMinuteEllipseY,3,3);
  ellipse(107+100,fMinuteEllipseY,3,3);
  // 最新の時間取得
  int iMinuteNew = minute();
  // アニメーションフレーム（分）更新
  if( iMinute != iMinuteNew )
  {
    iMinute = iMinuteNew;
    iAnimFrameM = 0;
  }
  else if( iAnimFrameM < 8 )
  {
    iAnimFrameM++;
  }
  
  // 秒の楕円アニメーション描画
  float fSecondEllipseY = 200; // ジャンプする楕円の初期Y座標値
  /** アニメーションは8フレームの間行う．
  8フレームを超えたら初期位置で待機． */
  if( iAnimFrameS < 8 )
  {
    fSecondEllipseY -= 90 * sin( radians( 180 * iAnimFrameS / 8.0 ) );
  }
  fill(216,86,63); //　赤色
  ellipse( 300, fSecondEllipseY, 30, 30 );
  //　白目（秒）
  fill(256,256,256);
  ellipse(93+200,fSecondEllipseY,7,7);
  ellipse(107+200,fSecondEllipseY,7,7);
  //　黒目（秒）
  fill(0);
  ellipse(93+200,fSecondEllipseY,3,3);
  ellipse(107+200,fSecondEllipseY,3,3);
  // 最新の時間取得
  int iSecondNew = second();
  // アニメーションフレーム（秒）更新
  if( iSecond != iSecondNew )
  {
    iSecond = iSecondNew;
    iAnimFrameS = 0;
  }
  else if( iAnimFrameS < 8 )
  {
    iAnimFrameS++;
  }
}
