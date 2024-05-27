/**************************************************************
秒毎に花火を１つ打ち上げる．
分が大きいほど高く上がり，秒ごとに右隣の花火を打ち上げる．
時が変わったときに多数の花火を同時に打ち上げる．
時が大きいほど多くの花火を上げる．
 **************************************************************/
/**
  デバッグ機能
    'S'キー：png出力
    'H'キー：時が変わったときのアニメーション再生
    'M'キー：分が変わったときのアニメーション再生
*/
// === 'S'キーを押した時の出力画像名 ===
//  "K3_[クラス][番号]_[苗字].png"
String pngName = "K3_A00_Fukushima.png";

// === アニメーション用変数/定数 ===
// 背景の星
float[][] iStarsProp = new float[20][5];

// 花火
float [][] fHanabiHourProp = new float[60][6];
float [][] fHanabiSecondProp = new float[60][7];  // タイマー内蔵

// 花火タイマー
float fHanabiHourTimer = 0;

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
  size( 400, 400 );
  frameRate( 30 );  // フレームレートの指定
  
  // === Time Init ===
  initTime();
  
  // 星配列の初期化
  for( int iStar = 0; iStar < iStarsProp.length; iStar++ ) 
  {
    iStarsProp[iStar][0] = random( width );    // X座標
    iStarsProp[iStar][1] = random( height );   // Y座標
    iStarsProp[iStar][2] = random( 4, 8 );     // 大きさ
    iStarsProp[iStar][3] = random( 255 );      // 明るさ
    iStarsProp[iStar][4] = 1;                  // 1:明るくなる．-1:暗くなる．
  }
}

void draw()
{  
  // === Time Update ===
  updateTimePre();
  
  //hourCurrent = 23;  // 時 を指定して描画を確認したい場合に一時的に有効化
  
  // === 画面のクリア ===
  
  // 画面をクリア
  fill( 0  );
  noStroke();
  rect( 0, 0, width, height );

  // 既定の描画カラーに戻す．
  fill( 255 );
  stroke( 0 );
  
  // === アニメーションを記述 ===
  colorMode( HSB, 360, 1, 1, 1 );
  
  // 背景の星
  for( int iStar=0; iStar < iStarsProp.length; iStar++ )
  {
    fill( iStarsProp[iStar][3] );
    circle( iStarsProp[iStar][0], iStarsProp[iStar][1], iStarsProp[iStar][2] );
  }
  // 明るさ更新
  for( int iStar=0; iStar < iStarsProp.length; iStar++ )
  {
    iStarsProp[iStar][3] += iStarsProp[iStar][4] * 255 / 60.0;
    
    // 明るくなるか暗くなるか切り替える．
    if( iStarsProp[iStar][3] < 0 || iStarsProp[iStar][3] > 255 )
    {
      iStarsProp[iStar][4] *= -1;
    }
  }
  
  // 秒が変化した時のアニメーション
  if ( secondCurrent != secondPrev )
  {
    isSecondAnim = 1;  // アニメーション開始
    
    // アニメーション初期化
    // 新しい花火の準備，配列の要素を１つだけ初期化
    fHanabiSecondProp[secondCurrent][0] = 20 + secondCurrent * 6;// X座標
    fHanabiSecondProp[secondCurrent][1] = random( 400, 420 );     // Y座標
    fHanabiSecondProp[secondCurrent][2] = random( 2, 4 );         // 大きさ
    fHanabiSecondProp[secondCurrent][3] = random( 40, 300 );      // 最大の大きさ
    fHanabiSecondProp[secondCurrent][4] = random( 255 );          // 色相
    fHanabiSecondProp[secondCurrent][5] = 0;                      // 1:明るくなる．-1:暗くなる．
    fHanabiSecondProp[secondCurrent][6] = 0;                      // タイマーリセット
  }
  if ( isSecondAnim == 1 )  // アニメーション中
  {
    // アニメーション中の処理を記述
    // 全秒花火の更新と描画
    for( int iHanabi = 0; iHanabi < fHanabiSecondProp.length; iHanabi++ ) 
    {      
      // 花火の更新
      if( fHanabiSecondProp[iHanabi][6] < 4 )
      {
        // 上昇中
        fHanabiSecondProp[iHanabi][1] -= random( 5, 50 + 1.8 * minuteCurrent ) * deltaTime;    // 上昇
        fHanabiSecondProp[iHanabi][2] += random( 0, 1 ) * deltaTime;     // 大きさ
        fHanabiSecondProp[iHanabi][5] += random( 0.1, 0.5 ) * deltaTime; // 明るさ
      }
      else if( fHanabiSecondProp[iHanabi][6] < 10 )
      {
        // パッと開く
        // 最大の大きさとの差があるほど早く大きくなる
        fHanabiSecondProp[iHanabi][2] += ( fHanabiSecondProp[iHanabi][3] - fHanabiSecondProp[iHanabi][2] ) * deltaTime;
        fHanabiSecondProp[iHanabi][5] -= random( 0.5, 1 ) * deltaTime;  // 明るさ
      }
      
      // 花火タイマー更新
      fHanabiSecondProp[iHanabi][6] += deltaTime;
      
      // 花火の描画（10秒間）
      if( fHanabiSecondProp[iHanabi][6] < 10 )
      {
        noFill();
        stroke( fHanabiSecondProp[iHanabi][4], 0.3, fHanabiSecondProp[iHanabi][5], 0.9 );
        strokeWeight( random( 1, 2 ) );
        circle( fHanabiSecondProp[iHanabi][0], fHanabiSecondProp[iHanabi][1], fHanabiSecondProp[iHanabi][2] );
      }
    }
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
    
    
    
    isMinuteAnim = 0;  // アニメーション終了
  }
  
  
  // 時が変化した時のアニメーション
  if ( hourCurrent != hourPrev )
  {
    isHourAnim = 1;  // アニメーションの開始
    
    // アニメーション初期化
    // 花火配列の初期化
    for( int iHanabi = 0; iHanabi < fHanabiHourProp.length; iHanabi++ ) 
    {
      fHanabiHourProp[iHanabi][0] = random( 50, 350 );    // X座標
      fHanabiHourProp[iHanabi][1] = random( 400, 420 );   // Y座標
      fHanabiHourProp[iHanabi][2] = random( 2, 4 );       // 大きさ
      fHanabiHourProp[iHanabi][3] = random( 40, 300 );    // 最大の大きさ
      fHanabiHourProp[iHanabi][4] = random( 255 );        // 色相
      fHanabiHourProp[iHanabi][5] = 0;                    // 1:明るくなる．-1:暗くなる．
    }
    
    fHanabiHourTimer = 0;  // タイマーリセット
  }
  if( isHourAnim == 1 )
  {
    // アニメーション中の処理を記述
    // 打ち上げる時の花火の数
    int iHanabiHourNum = 14 + hourCurrent * 2;  // 14~60
    
    if( fHanabiHourTimer < 4 )
    {
      // 上昇中
      for( int iHanabi = 0; iHanabi < iHanabiHourNum; iHanabi++ ) 
      {
        fHanabiHourProp[iHanabi][1] -= random( 5, 100 ) * deltaTime;    // 上昇
        fHanabiHourProp[iHanabi][2] += random( 0, 1 ) * deltaTime;     // 大きさ
        fHanabiHourProp[iHanabi][5] += random( 0.1, 0.5 ) * deltaTime; // 明るさ
      }    
    }
    else if( fHanabiHourTimer < 10 )
    {
      // パッと開く
      for( int iHanabi = 0; iHanabi < iHanabiHourNum; iHanabi++ ) 
      {
        // 最大の大きさとの差があるほど早く大きくなる
        fHanabiHourProp[iHanabi][2] += ( fHanabiHourProp[iHanabi][3] - fHanabiHourProp[iHanabi][2] ) * deltaTime;
        fHanabiHourProp[iHanabi][5] -= random( 0.5, 1 ) * deltaTime;         // 明るさ
      }    
    }
    else
    {
      isHourAnim = 0;  // アニメーション終了
    }
    
    fHanabiHourTimer += deltaTime;  // タイマーを進める．
    
    // 花火の描画
    for( int iHanabi = 0; iHanabi < iHanabiHourNum; iHanabi++ ) 
    {
      noFill();
      stroke( fHanabiHourProp[iHanabi][4], 0.3, fHanabiHourProp[iHanabi][5], 0.9 );
      strokeWeight( random( 1, 2 ) );
      circle( fHanabiHourProp[iHanabi][0], fHanabiHourProp[iHanabi][1], fHanabiHourProp[iHanabi][2] );
    }
  }
  
  // 時間をデバッグ表示（ 提出前に非表示にすること．）
  fill( 0 );
  textSize(20);
  text( hourCurrent + ":" + minuteCurrent + ":" + secondCurrent, 10, 20);
  text( "deltaTimePerSec: " + deltaTimePerSec, 10, 40);
  text( "deltaTime: " + deltaTime, 10, 60);
  
  // === Time Update ===
  updateTimePost();
}
