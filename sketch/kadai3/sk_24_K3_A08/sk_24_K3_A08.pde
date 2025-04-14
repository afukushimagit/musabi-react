/**************************************************************
真夜中の電車の風景を表現しました。
秒が変わったときに景色(街並み)が動き、分が変わったときは対向列車が、
時が変わったときは銀河鉄道が走ります。
対向電車と今乗ってる電車(街並みで表現）、銀河鉄道が交互になって別方向に動くことで奥行きを表現しました。
希望としては女の子をうとうとさせたり、電車のアナウンスをセリフとして書き出せたらよかったなと思います。
 **************************************************************/
/**
  デバッグ機能
    'S'キー：png出力
    'H'キー：時が変わったときのアニメーション再生
    'M'キー：分が変わったときのアニメーション再生
*/
// === 'S'キーを押した時の出力画像名 ===
//  "K3_[クラス][番号]_[苗字].png"
String pngName = "K3_A12_Fukushima.png";

// === アニメーション用変数/定数 ===
float ftRectX = 0;         // 対向電車のX座標値
float fgRectX = 0;         // 銀河鉄道のX座標値


// === Time Handling ===

int hourCurrent;       // 現在の時（0~23）
int minuteCurrent;     // 現在の分（0~59）
int secondCurrent;     // 現在の秒（0~59）
int iesecondCurrent;   // 町を動かすための変数
float deltaTime;       // 前フレームからの経過時間（秒,0~1）
float deltaTimePerSec; // 前回の秒が切り替わってからの経過時間（秒,0~1）
int isHourAnim = 0;    // アニメーションフラグ（1:アニメーション中）
int isMinuteAnim = 0;
int isSecondAnim = 0;

 
void setup()
{
  size( 600, 600 );
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
  
 matinami();
 densyanaisou();
  // 秒が変化した時のアニメーション
  if ( secondCurrent != secondPrev )
  {
    isSecondAnim = 1;  // アニメーション開始
    
    // アニメーション初期化
    
    
  }
  if ( isSecondAnim == 1 )  // アニメーション中
  {
    // アニメーション中の処理を記述
    
    
    
    isSecondAnim = 0;  // アニメーション終了
  }
  
  
  // 分が変化した時のアニメーション
  if ( minuteCurrent != minutePrev )
  {
    isMinuteAnim = 1;  // アニメーション開始
    
    // アニメーション初期化
     ftRectX = -1200;         // 初期位置
    
  }
  if( isMinuteAnim == 1 )  // アニメーション中
  {
    // アニメーション中の処理を記述
    if( ftRectX < 1200 )  // アニメーションの継続条件
    {
      taikoudensya();
    }
    else
    {
    
    
    isMinuteAnim = 0;  // アニメーション終了
    }
    
  }
  
  // 時が変化した時のアニメーション
  if ( hourCurrent != hourPrev )
  {
    isHourAnim = 1;  // アニメーションの開始
    
    // アニメーション初期化
    
    fgRectX = 600;         // 初期位置
    
  }
  if( isHourAnim == 1 )
  {
    // アニメーション中の処理を記述
     if( fgRectX > -1200 )  // アニメーションの継続条件
    {
      gingatetudou();
    }
    else
    {
    
    isHourAnim = 0;  // アニメーション終了
    }
    
  }
   onnanoko();
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
