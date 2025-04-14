/**************************************************************
再帰的な樹木の描写をいじるうちに波模様のようになったので、
富嶽三十六景の神奈川沖浪裏をイメージして作りました。
グラデーションや富士山の描写はchatGPTを参考にしています。
円を描写することで水しぶきっぽくなるようにしています。
呼び出すごとに波の位置や角度、色が変わるようになっています。雲も微妙に変わってます。
 **************************************************************/
/**
  デバッグ機能
    実行ウィンドウ内でマウスクリック：再描画
    '1'キー：１枚目のpng出力（~_01.png）
    '2'キー：２枚目のpng出力（~_02.png）
*/
// === 'S'キーを押した時の出力画像名 ===
//  "K4_[クラス][番号]_[苗字]"  ※拡張子(.png)は不要
String pngName = "K4_A12_fukushima";

// === グローバル変数/定数 ===



// === setupには変更を加えないこと ===
void setup()
{
  size( 1000, 1000 );    // Window Size
  noLoop();            // draw once.
}

void draw()
{ 
  // 再描画を行うため，背景色の描画もここに記述する．
  colorMode( RGB, 255 );
  background( 255, 249, 230 );
  
  // === 再帰関数の呼び出しやその他の描画命令 ===
  // 背景の黒グラデーション
  for ( float y = 0; y < height; y++ ) 
  {
    // 色の計算
    float r = map( y, 0, height-1, 255, 0 );
    float g = map( y, 0, height-1, 249, 0 );
    float b = map( y, 0, height-1, 230, 0 );
    
    // 描画色の設定
    stroke(r, g, b);
    noFill(); // 塗りつぶしを無効化
    rect(0, y+400, width, 1); // 上から下へのグラデーションを描画
  }
  
  colorMode( HSB, 100, 100, 100, 100 );
  
  // 富士山
  float baseWidth = 500;         // 底辺の幅
  float topWidth = 10;           // 上辺の幅
  float height = 295;            // 台形の高さ
  float baseX = 350;             // 底辺のX座標
  float baseY = 1000;             // 底辺のY座標
  float topX = 595;              // 上辺のX座標
  float topY = baseY - height;   // 上辺のY座標
  
  // 富士山の色
  for ( float y = baseY; y >= topY; y -= 1 ) // グラデーションのなめらかさ
  {
    float gradient = map( y, baseY, topY, 70, 0 ); // 白と青の色設定
    fill( 65, gradient, 85 );  // 富士山の色
    noStroke();
    
    // 左右の座標を計算
    float ratio = 1 - ( y - topY ) / (baseY - topY);
    float leftX = lerp( baseX, topX, ratio );
    float rightX = lerp( baseX + baseWidth, topX + topWidth, ratio );
    
    // 台形を描画
    quad( leftX, y, rightX, y, topX + topWidth, topY, topX, topY );
  }
  
  // 再帰関数で描画してるもの
  drawKumo( 230, 10, 1480, 130, 15 );  // 雲
  
  drawNami( random( 0,10 ), 880, 310, random( 280,294 ), random( 49,51 ), random( 5,30 ), 100, 17 );      // 白大波
  drawNami( random( 110,130 ), 680, 300, random( 300,315 ), random( 57,59 ), random( 40,60 ), 70, 10 );    // 大波
  drawNami( random( 450,460 ), 1300, 285, random( 235,245 ), random( 54,56 ), random( 10,35 ), 100, 15 );  // 青
  drawNami( random( 375,385 ), 900, 180, random( 190,245 ), random( 49,51 ), random( 5,30 ), 100, 15 );    // 白
  drawNami( random( 350,360 ), 900, 90, random( 210,245 ), random( 51,53 ), random( 10,50 ), 100, 13 );    // 水色
  drawNami( random( 450,460 ), 1050, 90, random( 220,239 ), random( 54,56 ), random( 10,40 ), 30, 12 );    // 濃青
  drawNami( random( 980,990 ), 710, 300, random( 855,870 ), random( 57,59 ), random( 20,55 ), 70, 10 );    // 大波

}

// === 再帰関数の定義 ===

/**
  再帰関数：線を再帰的に短くし，回転させながら３分岐描画する ( 波 )
*/
void drawNami( float fBeginX, float fBeginY, float fLength, float fRot, float fHue, float fSat, float fAlp, int iLevel )
{
  if( iLevel > 0 )
  {
    // 円の終点
    float fEndX = fBeginX + cos( radians( fRot ) ) * fLength;
    float fEndY = fBeginY + sin( radians( fRot ) ) * fLength;
    
    // 円の描画
    float fCenterX = ( fBeginX + fEndX ) / 2.0;
    float fCenterY = ( fBeginY + fEndY ) / 2.0;
    stroke( fHue, iLevel*3+fSat, 100, fAlp );
    fill( random( 50, 60 ), random( 0, 100 ), random( 50, 100 ), 90 );
    circle( fCenterX, fCenterY, fLength/2.0  );
    
    // 再帰呼び出し
    drawNami( fEndX, fEndY, fLength * 0.75, fRot + 20, fHue, fSat, fAlp, iLevel - 1 );
    drawNami( fEndX, fEndY, fLength * 0.75, fRot - 20, fHue, fSat, fAlp, iLevel - 1 );
    drawNami( fEndX, fEndY, fLength * 0.75, fRot - 70, fHue, fSat, fAlp, iLevel - 1 );
  }
}

/**
  再帰関数：ドラゴン曲線 ( 雲 )
*/
void drawKumo( float fBeginX, float fBeginY, float fEndX, float fEndY, int iLevel ) 
{
  if (iLevel > 0) 
  {
    // 直角三角形のX軸方向の大きさ
    float fTriangleX = ( fEndX - fBeginX ) / 2.0;
    
    // 直角三角形のY軸方向の大きさ
    float fTriangleY = ( fBeginY - fEndY ) / 2.0;
    
    float fBeginToNewX = fTriangleX + fTriangleY;
    float fEndToNewY = fTriangleX + fTriangleY;
    
    // 新たに生成される点のXY座標値
    float fNewX = fBeginX + fBeginToNewX;
    float fNewY = fEndY + fEndToNewY; 
    
    // 二つの線に再帰的に分割
    drawKumo( fBeginX, fBeginY, fNewX, fNewY, iLevel - 1 );
    drawKumo( fEndX, fEndY, fNewX, fNewY, iLevel - 1 );
  } else 
  {
    strokeWeight( 2 );
    stroke( 50, 5, 100, random( 60 ));
    line( fBeginX, fBeginY, fEndX, fEndY );
  }
}
