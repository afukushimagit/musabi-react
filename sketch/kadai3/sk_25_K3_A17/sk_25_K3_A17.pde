/**************************************************************

コードの勘違いをしていて、時間の取得が変になってしまったので、MキーとHキーで出力をお願いします。
インベーダーゲームのような時計を目指して頑張りました。
10秒ごとに1体の敵を倒します。一列倒すと1分です。
左上の四つに別れた円は15分タイマーで、15分おきに小さいまるが移動して1周したら１時間です。
その下の24個の円は、1時間タイマーです。緑の円が１時間ごとに右下へ向けて移動していきます。

 **************************************************************/
/**
  デバッグ機能
    'S'キー：png出力
    'H'キー：時が変わったときのアニメーション再生
    'M'キー：分が変わったときのアニメーション再生
*/
// === 'S'キーを押した時の出力画像名 ===
//  "K3_[クラス][番号]_[苗字].png"
String pngName = "K3_A17_Fukushima.png";

// === アニメーション用変数/定数 ===

//Player
float fPlayerX = 0;
float fPlayerY = 0;
float fPlayerTimer = 0;

//攻撃
float fTamaX = 0;
float fTamaY = 0;
float fTamaTimer = 0;

//敵
float fKakusiX = 0;
float fKakusiY = 0;
float fKakusiW = 0;//横
float fKakusiH = 0;//縦
float fKakusiTimer = 0;
float fTekiY = 0;

//bomb
float fBombX = 0;
float fBombY = 0;
float fBombW = 0;
float fBombWm = 0;
float fBombTimer = 0;

//エフェクト
float fERectY = 0;

//15分タイマー
float fQX = 0;
float fQY = 0;
float fQS = 0;
float fQTimer = 0;

//1時間タイマー
float fhtX = 0;
float fhtY = 0;
float fhtTimer = 0;

// === Time Handling ===

int hourCurrent;       // 現在の時（0~23）
int minuteCurrent;     // 現在の分（0~59）
int secondCurrent;     // 現在の秒（0~59）
float deltaTime;       // 前フレームからの経過時間（秒,0~1）
float deltaTimePerSec; // 前回の秒が切り替わってからの経過時間（秒,0~1）
int isHourAnim = 0;// アニメーションフラグ（1:アニメーション中）
int isHourAnim_Q = 0;//15分カウント用
int isMinuteAnim_P = 0;//Player用
int isMinuteAnim_T = 0;//攻撃用
int isMinuteAnim_K = 0;//隠し用
int isMinuteAnim_E = 0;//エフェクト用
int isMinuteAnim_B = 0;//bomb用
int isSecondAnim = 0;
int isSecondAnim_ht = 0;//1時間カウント用

void setup()
{
  size( 600, 400 );
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
  
  //背景
  background( 40, 60, 100 );
  fill( 40, 70, 120 );
  strokeWeight( 2 );
  stroke( 8, 0, 124 );
  rect( 0, 0, 200, 400 );//左側のゾーン
  
  //15分タイマー
  noFill();
  strokeWeight( 2 );
  stroke( 155, 255, 115 );
  circle( 65, 65, 90 );
  strokeWeight( 1 );
  fill( 65, 95, 165 );
  circle( 65, 65, 80 );
  line( 65, 25, 65, 105 );
  line( 25, 65, 105, 65 );
  
  //1時間タイマー
  for( int iX = 50; iX < 150; iX += 30 )
  {
    for( int iY = 200; iY < 380; iY += 30 )
    {
      noStroke();
      circle( iX, iY, 20 );
    }
  }
  
  //敵
  fTekiY = 15;
  
  for( int iX = 230; iX < 570; iX += 60 )//敵青
  {
      strokeWeight( 2 );//体
      stroke( 8, 0, 124 );
      fill( 66, 255, 207 );
      square( iX, fTekiY, 40 );
      fill( 255 );//白目
      ellipse( iX+13, fTekiY+20, 15, 30 );
      ellipse( iX+28, fTekiY+20, 15, 30 );
      line( iX, fTekiY+10, iX+20, fTekiY+20 );//眉毛
      line( iX+20, fTekiY+20, iX+40, fTekiY+10 );
      fill( 8, 0, 124 );//黒目
      ellipse( iX+13, fTekiY+30, 8, 8 );
      ellipse( iX+28, fTekiY+30, 8, 8 );
  }
  
  for( int iX = 230; iX < 570; iX += 60 )//敵黄色
  {
      fill( 255, 238, 133 );
      square( iX, fTekiY+60, 40 );
      fill( 255 );
      ellipse( iX+13, fTekiY+80, 15, 30 );
      ellipse( iX+28, fTekiY+80, 15, 30 );
      line( iX, fTekiY+70, iX+20, fTekiY+80 );
      line( iX+20, fTekiY+80, iX+40, fTekiY+70 );
      ellipse( iX+13, fTekiY+90, 8, 8 );
      ellipse( iX+28, fTekiY+80, 8, 8 );
  }
    
    for( int iX = 230; iX < 570; iX += 60 )//敵ピンク
  {
      fill( 255, 0, 255 );
      square( iX, fTekiY+120, 40 );
      fill( 255 );
      ellipse( iX+13, fTekiY+140, 15, 30 );
      ellipse( iX+28, fTekiY+140, 15, 30 );
      line( iX, fTekiY+130, iX+20, fTekiY+140 );
      line( iX+20, fTekiY+140, iX+40, fTekiY+130 );
      fill( 8, 0, 124 );
      ellipse( iX+13, fTekiY+150, 8, 8 );
      ellipse( iX+28, fTekiY+150, 8, 8 );
  }
  
  //1秒カウント
   float fArcStart = -90 + 360 * deltaTimePerSec;// 円弧の始まり（°）
   noStroke();
   fill( 155, 255, 115 );
   arc( 160, 100, 50, 50, radians( fArcStart ), radians( 270 ), PIE );
  
  
  // 秒が変化した時のアニメーション
  if ( secondCurrent != secondPrev )
  {
    isSecondAnim = 1;  // アニメーション開始
    
    // アニメーション初期化
    
  }
  if ( isSecondAnim == 1 )  // アニメーション中
  {
    // アニメーション中の処理を記述
 
  }
 
  //分が変化した時のアニメーション
 
  if ( minuteCurrent != minutePrev )
  {
    isMinuteAnim_K = 1;  //Kakusiアニメーション開始
    
    // アニメーション初期化
   
   //敵隠し
   //10秒ごとに右に伸びて敵を隠す
   
    fKakusiX = 215;
    fKakusiY = 130;
    fKakusiW = 10;
    fKakusiH = 48;
    fKakusiTimer = 0;
    
  }
  if( isMinuteAnim_K == 1 )  //Kakusiアニメーション中
  {
    // アニメーション中の処理を記述
    
    if ( fKakusiTimer < 10 )
    {
      //10秒待機
    }
    else if ( fKakusiTimer < 11 )
    {
      KX();//右に伸びる
    }
    else if ( fKakusiTimer < 20 )
    {
      
    }
    else if ( fKakusiTimer < 21 )
    {
      KX();
    }
    else if ( fKakusiTimer < 30 )
    {
      
    }
    else if ( fKakusiTimer < 31 )
    {
      KX();
    }
    else if ( fKakusiTimer < 40 )
    {
      
    }
    else if ( fKakusiTimer < 41 )
    {
      KX();
    }
    else if ( fKakusiTimer < 50 )
    {
      
    }
    else if ( fKakusiTimer < 51 )
    {
      KX();
    }
    else if ( fKakusiTimer < 59 )
    {
      
    }
    else if ( fKakusiTimer < 60 )
    {
      KX();
    }
    else
    
    
    {
      isMinuteAnim_K = 0;  //Kakusiアニメーション終了
    }
    
    fKakusiTimer += deltaTime;
    
    noStroke();
    fill( 40, 60, 100 );
    rect( fKakusiX, fKakusiY, fKakusiW, fKakusiH );
   
  }
 
  //Playerのアニメーション
  //10秒ごとに右にずれる
  if ( minuteCurrent != minutePrev )
  {
    isMinuteAnim_P = 1;  // Playerアニメーション開始
    
    // アニメーション初期化
    //Player
    fPlayerX = 250;
    fPlayerY = 350;
    fPlayerTimer = 0;
    
  }
  if( isMinuteAnim_P == 1 )  // Playerアニメーション中
  {
    // アニメーション中の処理を記述
    if( fPlayerTimer < 10 )
    {
      //10秒待機
    }
    else if ( fPlayerTimer < 11 )
    {
      PM();//右に動く
    }
    else if ( fPlayerTimer < 20 )
    {
      
    }
    else if ( fPlayerTimer < 21 )
    {
      PM();
    }
    else if ( fPlayerTimer < 30 )
    {
      
    }
    else if ( fPlayerTimer < 31 )
    {
      PM();
    }
    else if ( fPlayerTimer < 40 )
    {
      
    }
    else if ( fPlayerTimer < 41 )
    {
      PM();
    }
    else if ( fPlayerTimer < 50 )
    {
      
    }
    else if ( fPlayerTimer < 51 )
    {
      PM();
    }
    else if ( fPlayerTimer < 60 )
    {
      
    }
    else
    
    
    {
      isMinuteAnim_P = 0;  // Playerアニメーション終了
    }
    
    fPlayerTimer += deltaTime;
    
    //PlayerBody
    strokeWeight( 2 );
    stroke( 8, 0, 124 );
    fill( 255 );
    circle( fPlayerX, fPlayerY, 30 );
    
    beginShape();
    vertex( fPlayerX - 30, fPlayerY - 5 );
    vertex( fPlayerX + 30, fPlayerY - 5 );
    vertex( fPlayerX + 40, fPlayerY + 20 );
    vertex( fPlayerX ,fPlayerY );
    vertex( fPlayerX - 40, fPlayerY + 20 );
    endShape( CLOSE );
    
  }
  
  //攻撃のアニメーション　
  //敵に攻撃しながら、10秒ごとに右にずれる
  if ( minuteCurrent != minutePrev )
    {
      isMinuteAnim_T = 1;  //攻撃アニメーション開始
    
      // アニメーション初期化
    
      //Tama
      fTamaX = 250;
      fTamaY = 330;
      fTamaTimer = 0;
    
    }  
  
  if( isMinuteAnim_T == 1 )  //攻撃アニメーション中
  {
    // アニメーション中の処理を記述
    
    if( fTamaTimer < 1 )
    {
      //1秒待機
    }
    else if ( fTamaTimer < 6 )
    {
      TMY();//上に動く
    }
    else if ( fTamaTimer < 9 )
    {
      //3秒待機
    }
    else if ( fTamaTimer < 10 )
    {
     TMYRE();//装填位置に戻る
    }
    else if ( fTamaTimer < 11 )
    {
      TMX();//右に動く
    }
    else if ( fTamaTimer < 16 )
    {
      TMY();
    }
    else if ( fTamaTimer < 19 )
    {
      
    }
    else if ( fTamaTimer < 20 )
    {
      TMYRE();
    }
    else if ( fTamaTimer < 21 )
    {
      TMX();
    }
    else if ( fTamaTimer < 26 )
    {
      TMY();
    }
    else if ( fTamaTimer < 29 )
    {
      
    }
    else if ( fTamaTimer < 30 )
    {
      TMYRE();
    }
    else if ( fTamaTimer < 31 )
    {
      TMX();
    }
    else if ( fTamaTimer < 36 )
    {
      TMY();
    }
    else if ( fTamaTimer < 39 )
    {
      
    }
    else if ( fTamaTimer < 40 )
    {
      TMYRE();
    }
    else if ( fTamaTimer < 41 )
    {
      TMX();
    }
    else if ( fTamaTimer < 46 )
    {
      TMY();
    }
    else if ( fTamaTimer < 49 )
    {
      
    }
    else if ( fTamaTimer < 50 )
    {
      TMYRE();
    }
    else if ( fTamaTimer < 51 )
    {
      TMX();
    }
    else if ( fTamaTimer < 56 )
    {
      TMY();
    }
    else if ( fTamaTimer < 59 )
    {
      
    }
    else if ( fTamaTimer < 60 )
    {
      TMYRE();
    }
    else
    
    {
      isMinuteAnim_T = 0;  //攻撃アニメーション終了
    }
    
    fTamaTimer += deltaTime;
    
    fill( 0, 250, 255 );
    circle( fTamaX, fTamaY, 10 );
  }
  
  //bomb
  if ( minuteCurrent != minutePrev )
  {
    isMinuteAnim_B = 1;  // Bombアニメーション開始
    
    // アニメーション初期化
   
    fBombX = 250;
    fBombY = 180;
    fBombW = 0;
    fBombWm = 0;
    fBombTimer = 0;
    
  }
  if( isMinuteAnim_B == 1 )  // Bombアニメーション中
  {
    // アニメーション中の処理を記述
    
    
    //Bombを動かす
    
    if ( fBombTimer < 6 )
    {
      //6秒待機
    }
    else if ( fBombTimer < 11 )
    {
      BM();//外側の爆破だんだん大きく
      bm();//内側の爆破だんだん大きく
    }
    else if ( fBombTimer < 12 )
    {
      fBombX = 310;//右に移動
      fBombW = 0;//外側の爆破の大きさを0に
      fBombWm = 0;//内側の爆破の大きさを0に
    }
    else if ( fBombTimer < 16 )
    {
      
    }
    else if ( fBombTimer < 21 )
    {
      BM();
      bm();
    }
    else if ( fBombTimer < 22 )
    {
      fBombX = 370;
      fBombW = 0;
      fBombWm = 0;
    }
    else if ( fBombTimer < 26 )
    {
      
    }
    else if ( fBombTimer < 31 )
    {
      BM();
      bm();
    }
    else if ( fBombTimer < 32 )
    {
      fBombX = 430;
      fBombW = 0;
      fBombWm = 0;
    }
    else if ( fBombTimer < 36 )
    {
      
    }
    else if ( fBombTimer < 41 )
    {
      BM();
      bm();
    }
    else if ( fBombTimer < 42 )
    {
      fBombX = 490;
      fBombW = 0;
      fBombWm = 0;
    }
    else if ( fBombTimer < 46 )
    {
      
    }
    else if ( fBombTimer < 51 )
    {
      BM();
      bm();
    }
    else if ( fBombTimer < 52 )
    {
      fBombX = 550;
      fBombW = 0;
      fBombWm = 0;
    }
    else if ( fBombTimer < 56 )
    {
      
    }
    else if ( fBombTimer < 59 )
    {
      BM();
      bm();
    }
    
    else
    
    
    {
      isMinuteAnim_B = 0;  // Bombアニメーション終了
    }
    
    fBombTimer += deltaTime;
    
    strokeWeight( 8 );
    stroke( 0, 250, 255 );
    fill( 180, 255, 223 );
    circle( fBombX, fBombY, fBombW );
    noStroke();
    fill( 255 );
    circle( fBombX, fBombY, fBombWm );
   
  }
 
 //エフェクト(1分おき)
  if ( minuteCurrent != minutePrev )
  {
    isMinuteAnim_E = 1;  // エフェクトアニメーション開始
    
    // アニメーション初期化
    fERectY = -400;         // 初期位置
  }
  if( isMinuteAnim_E == 1 )  // エフェクトアニメーション中
  {
    if( fERectY < 400 )  // アニメーションの継続条件
    {
      // 位置
      fERectY += 600 * deltaTime;
      
      fill( 137, 141, 181, 50 );
      noStroke();
      rect( 0, fERectY, 600, 400 );
    }
    else
    {
      isMinuteAnim_E = 0;  // エフェクトアニメーション終了
    }
  }
  
  // 時が変化した時のアニメーション
  
  //15分カウントタイマー
  //15分ごとに位置移動
  if ( hourCurrent != hourPrev )
  {
    isHourAnim = 1;  // 15分カウントアニメーションの開始
    
    // アニメーション初期化
    fQX = 80;
    fQY = 50;
    fQS = 20;
    fQTimer = 0;
    
  }
  if( isHourAnim == 1 )  // 15分カウントアニメーション中
  {
    // アニメーション中の処理を記述
    
    if ( fQTimer < 900 )
    {
      //最初の15分右上
    }
    else if ( fQTimer < 901 )
    {
      fQY += 1;//下に移動
    }
    else if ( fQTimer < 1800 )
    {
      //30分まで右下
    }
    else if ( fQTimer < 1801 )
    {
      fQX -= 1;//左に移動
    }
    else if ( fQTimer < 2700 )
    {
      //45分まで左下
    }
    else if ( fQTimer < 2701 )
    {
      fQY -= 1;//上に移動
    }
    else if ( fQTimer < 3600 )
    {
      //60分まで左上
    }
    else
    
    
    {
      isHourAnim = 0;  // エフェクトアニメーション終了
    }
    
    fQTimer += deltaTime;
    
    strokeWeight( 2 );
    stroke( 155, 255, 115 );
    noFill();
    circle( fQX, fQY, fQS );
    fill( 155, 255, 115 );
    circle( fQX, fQY, fQS/2 );
  }
  
  //1時間タイマー
  //1時間ごとにまるが右下へ降りていく
  if ( hourCurrent != hourPrev )
  {
    isHourAnim = 1;  // 1時間アニメーション開始
    
    // アニメーション初期化
    fhtX = 50;
    fhtY = 200;
    fhtTimer = 0;
    
  }
  if( isHourAnim == 1 )  // 1時間アニメーション中
  {
    // アニメーション中の処理を記述
    
    if ( fhtTimer < 3600 * 1 )//1~4時
    {
     fhtX = 50;
    }
    else if( fhtTimer < 3600 * 2 )
    {
      fhtX = 80;
    }
    else if ( fhtTimer < 3600 * 3 )
    {
     fhtX = 110;
    }
    else if ( fhtTimer < 3600 * 4 )
    {
      fhtX = 140;
    }
    else if ( fhtTimer < 3600 * 5 )//5~8時
    {
      fhtX = 50;
      fhtY = 230;
    }
    else if ( fhtTimer < 3600 * 6 )
    {
      fhtX = 80;
    }
    else if ( fhtTimer < 3600 * 7 )
    {
     fhtX = 110;
    }
    else if ( fhtTimer < 3600 * 8 )
    {
      fhtX = 140;
    }
    else if ( fhtTimer < 3600 * 9 )//9~12時
    {
      fhtX = 50;
      fhtY = 260;
    }
    else if ( fhtTimer < 3600 * 10 )
    {
      fhtX = 80;
    }
    else if ( fhtTimer < 3600 * 11 )
    {
     fhtX = 110;
    }
    else if ( fhtTimer < 3600 * 12 )
    {
      fhtX = 140;
    }
    else if ( fhtTimer < 3600 * 13 )//13~16時
    {
      fhtX = 50;
      fhtY = 290;
    }
    else if ( fhtTimer < 3600 * 14 )
    {
      fhtX = 80;
    }
    else if ( fhtTimer < 3600 * 15 )
    {
     fhtX = 110;
    }
    else if ( fhtTimer < 3600 * 16 )
    {
      fhtX = 140;
    }
    else if ( fhtTimer < 3600 * 17 )//17~20時
    {
      fhtX = 50;
      fhtY = 320;
    }
    else if ( fhtTimer < 3600 * 18 )
    {
      fhtX = 80;
    }
    else if ( fhtTimer < 3600 * 19 )
    {
     fhtX = 110;
    }
    else if ( fhtTimer < 3600 * 20 )
    {
      fhtX = 140;
    }
    else if ( fhtTimer < 3600 * 21 )//21~24時
    {
      fhtX = 50;
      fhtY = 350;
    }
    else if ( fhtTimer < 3600 * 22 )
    {
      fhtX = 80;
    }
    else if ( fhtTimer < 3600 * 23 )
    {
     fhtX = 110;
    }
    else if ( fhtTimer < 3600 * 24 )
    {
      fhtX = 140;
    }
    else
    
    
    {
      isHourAnim = 0;  // 1時間タイマーアニメーション終了
    }
    
    fhtTimer += deltaTime;
    
    strokeWeight( 3 );
    stroke( 155, 255, 115 );
    noFill();
    circle( fhtX, fhtY, 20 );
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
