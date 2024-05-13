import gifAnimation.*;

GifMaker gifMaker;

void setup()
{
  size( 400, 400 );
  frameRate(30);

  gifMaker = new GifMaker(this, "sk_.gif"); // 'sk_.gif'という名前でGIFアニメを作成
  gifMaker.setRepeat(0); // エンドレス再生する
  gifMaker.setDelay(floor(1000/frameRate));  // フレームレートを合わせる
}

void draw()
{
  
  gifMaker.addFrame(); // 現在の画面をアニメーションのコマとして追加

  if (millis() >= 3000) {  // 一定時間
    gifMaker.finish(); // GIFアニメの作成を終了
    exit();
  }
}
