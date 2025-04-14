/**************************************************************
立方体に明るい面と暗い面を用意し、どの面を正面に向けるかでデジタル時計のような
時刻の表示ができるようにしました。立方体は四角形を縦に長い楕円に沿うように動かし、
それぞれの頂点を辺で結ぶことで再現しています。
 **************************************************************/
/**
  デバッグ機能
    'S'キー：png出力
    'H'キー：時が変わったときのアニメーション再生
    'M'キー：分が変わったときのアニメーション再生
*/
// === 'S'キーを押した時の出力画像名 ===
//  "K3_[クラス][番号]_[苗字].png"
String pngName = "K3_A12_fukushima.png";

// === アニメーション用変数/定数 ===
//横七列で7セグメント表示の各位置、縦六列で各位の情報を持つ二次元配列を宣言
float[][] iRStoH = new float[6][7];
//大きさ調整用変数
//どれだけ横から見るか
float iRL = 5;
//どれだけ縦を伸ばすか
float iYL = 10;
//どれだけ横に伸ばすか
float iXL = 12.5;

//色調整用
//暗い面の色
float iDC = 40;
//明るい面の色
float iLCR = 255;
float iLCG = 255;
float iLCB = 255;
//中くらいの面の色
float iMC = 60;

//コロン回転用変数
float iColonR;

//7セグメント表示でどのセグメントがどんなタイミングで明るくなるかを表す二次元配列。左から0~9
int[][] iPos = { { 1, 0, 1, 1, 0, 1, 1, 1, 1, 1 },//上部
                 { 1, 1, 1, 1, 1, 0, 0, 1, 1, 1 },//右上
                 { 1, 1, 0, 1, 1, 1, 1, 1, 1, 1 },//右下
                 { 1, 0, 1, 1, 0, 1, 1, 0, 1, 1 },//下部
                 { 1, 0, 1, 0, 0, 0, 1, 0, 1, 0 },//左下
                 { 1, 0, 0, 0, 1, 1, 1, 0, 1, 1 },//左上
                 { 0, 0, 1, 1, 1, 1, 1, 0, 1, 1 } };//中心

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
  size( 800, 205 );
  frameRate( 30 );  // フレームレートの指定
 
  // === Time Init ===
  initTime();
  //角度の情報を一旦全て45にし、見かけ上の0度にする
  for( int i=0; i < iRStoH.length; i++ )
  {
    for( int j=0; j < iRStoH[i].length; j++ )
    {
      iRStoH[i][j] = 45;
    }
  }
  //一度動かしておかないと表示されないんです
  secondPrev = -1;
  minutePrev = -1;
  hourPrev = -1;
  //つなぎ目を滑らかに
  strokeJoin(BEVEL);
}

void draw()
{  
  // === Time Update ===
  updateTimePre();
 
  //hourCurrent = 1;  // 時 を指定して描画を確認したい場合に一時的に有効化
 
  // === 画面のクリア ===
 
  // 画面をクリア
  fill( 0 );
  noStroke();
  rect( 0, 0, width, height );

  // 既定の描画カラーに戻す．
  fill( 255 );
  stroke( 255 );
 
  // === アニメーションを記述 ===
  //枠線削除
  noStroke();
  
  //各位の
  //秒数一の位を並べる
  locateBox( 750, 0 );
  //秒数十の位を並べる
  locateBox( 625, 1 );
  //分数一の位を並べる
  locateBox( 477.5, 2 );
  //分数十の位を並べる
  locateBox( 352.5, 3 );
  //時間一の位を並べる
  locateBox( 205, 4 );
  //時間十の位を並べる
  locateBox( 80, 5 );
  //コロン書く
  drawColon( 256.5, 75 );
  drawColon( 256.5, 127.5 );
  drawColon( 530, 75 );
  drawColon( 530, 127.5 );
 
  // 秒が変化した時のアニメーション
  if ( secondCurrent != secondPrev )
  {
    isSecondAnim = 1;  // アニメーション開始

    // アニメーション初期化
   
   
  }
  if ( isSecondAnim == 1 )  // アニメーション中
  {
    //秒数一の位の各セグメントの情報をiPosから仕入れ、iRStoHに入れる
    for( int a=0; a < iRStoH[0].length; a++ )
    {
      iRStoH[0][a] = rotateBox( a, secondCurrent % 10,iRStoH[0][a] );
    }
    //秒数十の位
    for( int b = 0; b < iRStoH[0].length; b++ )
    {
      iRStoH[1][b] = rotateBox( b, ( secondCurrent - ( secondCurrent % 10 ) ) / 10,iRStoH[1][b] );
    }
    //isSecondAnim = 0;

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
    //分数一の位
    for( int c=0; c < iRStoH[0].length; c++ )
    {
      iRStoH[2][c] = rotateBox( c, minuteCurrent % 10,iRStoH[2][c] );
    }
    //分数十の位
    for( int d = 0; d < iRStoH[0].length; d++ )
    {
      iRStoH[3][d] = rotateBox( d, ( minuteCurrent - ( minuteCurrent % 10 ) ) / 10,iRStoH[3][d] );
    }
   
   
   
    //isMinuteAnim = 0;  // アニメーション終了
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
    //時間一の位
    for( int e=0; e < iRStoH[0].length; e++ )
    {
      iRStoH[4][e] = rotateBox( e, hourCurrent % 10,iRStoH[4][e] );
    }
    //時間十の位
    for( int f = 0; f < iRStoH[0].length; f++ )
    {
      iRStoH[5][f] = rotateBox( f, ( hourCurrent - ( hourCurrent % 10 ) ) / 10,iRStoH[5][f] );
    }
    //isHourAnim = 0;  // アニメーション終了
  }
 
  // 時間をデバッグ表示（ 提出前に非表示にすること．）
  /*
  fill( 0 );
  textSize(20);  // フォントサイズを10に変更
  text( hourCurrent + ":" + minuteCurrent + ":" + secondCurrent, 5, 10);
  text( "deltaTimePerSec: " + deltaTimePerSec, 5, 20);
  text( "deltaTime: " + deltaTime, 5, 30);
  */
 
  // === Time Update ===
  updateTimePost();
}
