/**************************************************************
澄んだ山の景色をかきました。山はシェルピンスキーのギャスケット、
蜘蛛はドラゴン曲線、太陽の光は正方形を再帰的に小さくしながら
描画するプログラムをもとに書きました。山の高さがランダムに変わります。
（※描画にかなり時間がかかります．）
 **************************************************************/
/**
  デバッグ機能
    実行ウィンドウ内でマウスクリック：再描画
    '1'キー：１枚目のpng出力（~_01.png）
    '2'キー：２枚目のpng出力（~_02.png）
*/
// === 'S'キーを押した時の出力画像名 ===
//  "K4_[クラス][番号]_[苗字]"  ※拡張子(.png)は不要
String pngName = "K4_D02_Fukushima";

// === グローバル変数/定数 ===



// === setupには変更を加えないこと ===
void setup()
{
  size(1000, 1000);    // Window Size
  noLoop();            // draw once.
}

void draw()
{ 
  // 再描画を行うため，背景色の描画もここに記述する．
  background(#DBF5FF);//空の色
  
  // === 再帰関数の呼び出しやその他の描画命令 ===
  
  drawDragonCurve( 200, 100, 1000, 250, 20 );  //後ろ側の雲の描画
  drawDragonCurve2( 200, 100, 1000, 250, 10 ); //その影
  
  /*前後感を表現するために奥になるにつれて青白くなるように色を指定して山を描画*/
  fill(#C9E1EA);
  drawTriangle( width/2.5, height/1.75, width, 7 );
  fill(#A5D2E3);
  drawTriangle( width/5, height/1.9, width, 7 );
  drawTriangle( width-40, height/1.9, width, 7 );
  fill(#84B2C4);
  drawTriangle( width-80, height-200, width, 7 );
  fill(#7F9CA7);
  drawTriangle( width/2, height/1.7, width, 7 ); 
  fill(#778D95);
  drawTriangle( width-180, height-150, width, 7 ); 
  fill(#5F747C);
  drawTriangle( width/0.85, height/1.5, width, 7 );
  
  drawDragonCurve( 500, 600, 1000, 800, 20 ); //前側の山
  drawDragonCurve2( 500, 600, 1000, 800, 20 ); // その影
  
  /*再び山の描画*/
  fill(#374950);
  drawTriangle( width/5, height/1.9, width, 7 );  
  drawTriangle( width/2, height/1.5, width, 7 );
  
  drawCircle(2300,60);//太陽光に照らされる表現
  
  
}

// === 再帰関数の定義 ===
void drawTriangle( float fCenterX, float fCenterY, float fWidth, int iLevel )//山の描画関数
{
  noStroke();
  
  if( iLevel > 0 )
  {    
    if(iLevel < 7)
    {
      blendMode(MULTIPLY);
    }
    else
    {
      blendMode(BLEND);
    }
    
    // 三角形の内接円の半径
    float fInCircleRadius = ( fWidth/2 ) * tan( radians( 40 ) );
    
    // 三角形の高さ
    float fHeight = fWidth * sin( radians( random(20,50) ) );
    
    // 三角形の描画
    triangle( fCenterX, fCenterY - ( fHeight - fInCircleRadius ),
              fCenterX + fWidth/2.0, fCenterY + fInCircleRadius,
              fCenterX - fWidth/2.0, fCenterY + fInCircleRadius );

    // 再帰呼び出し（上，左下，右下）
    float fDistanceX = fInCircleRadius * cos( radians( 40 ) );
    float fDistanceY = fInCircleRadius * sin( radians( 30 ) );
    

    drawTriangle( fCenterX + fDistanceX, fCenterY + fDistanceY, fWidth/2.0, iLevel - 1 );
    drawTriangle( fCenterX - fDistanceX, fCenterY + fDistanceY, fWidth/2.0, iLevel - 1 );
  }
}

void drawDragonCurve( float fBeginX, float fBeginY, float fEndX, float fEndY, int iLevel )//雲の描画関数
{  
  noStroke();
   blendMode(SCREEN);
   fill(255,30);
   
  if( iLevel > 0 )
  {
    // 直角三角形のX軸方向の大きさ
    float fTriangleX = ( fEndX - fBeginX ) / 4.0;
    
    // 直角三角形のY軸方向の大きさ
    float fTriangleY = ( fBeginY - fEndY ) /2.0;  // fBeginY方向へ向かうのが正
    
    float fBeginToNewX = fTriangleX + fTriangleY;
    float fEndToNewY = fTriangleX + fTriangleY;
    
    // 新たに生成される点のXY座標値
    float fNewX = fBeginX + fBeginToNewX;
    float fNewY = fEndY + fEndToNewY; 
    
    // 二つの線に再帰的に分割
    drawDragonCurve( fBeginX, fBeginY, fNewX, fNewY, iLevel - 1 );
    drawDragonCurve( fEndX, fEndY, fNewX, fNewY, iLevel - 1 );
  }
  else
  {
    // 再帰の終了時に線を描画する．
    // 開始点から終了点への距離
  
    // 線の代わりに円描画
    float fCenterX = ( fBeginX + fEndX ) / 2.0;
    float fCenterY = ( fBeginY + fEndY ) / 2.0;

    circle( fCenterX, fCenterY, random(80) );
    //line( fBeginX, fBeginY, fEndX, fEndY );
  }
}

void drawDragonCurve2( float fBeginX, float fBeginY, float fEndX, float fEndY, int iLevel )//雲の影の描画関数
{  
   blendMode(BLEND);
   fill(#E6F1F5);
   
  if( iLevel > 0 )
  {
    // 直角三角形のX軸方向の大きさ
    float fTriangleX = ( fEndX - fBeginX ) / 4.0;
    
    // 直角三角形のY軸方向の大きさ
    float fTriangleY = ( fBeginY - fEndY ) /2.0;  // fBeginY方向へ向かうのが正
    
    float fBeginToNewX = fTriangleX + fTriangleY;
    float fEndToNewY = fTriangleX + fTriangleY;
    
    // 新たに生成される点のXY座標値
    float fNewX = fBeginX + fBeginToNewX;
    float fNewY = fEndY + fEndToNewY; 
    
    // 二つの線に再帰的に分割
    drawDragonCurve2( fBeginX, fBeginY, fNewX, fNewY, iLevel - 1 );
    drawDragonCurve2( fEndX, fEndY, fNewX, fNewY, iLevel - 1 );
  }
  else
  {
    // 再帰の終了時に線を描画する．
    // 開始点から終了点への距離
  
    // 線の代わりに円描画
    float fCenterX = ( fBeginX + fEndX ) / 2.0;
    float fCenterY = ( fBeginY + fEndY ) / 2.0;

    //line( fBeginX, fBeginY, fEndX, fEndY );
    circle( fCenterX-25, fCenterY+25, random(50) );
  }
}

void drawCircle( float fSize, int iLevel )//太陽光の描画関数
{
  blendMode(SCREEN);
  noStroke();
  if( iLevel > 0 )  // 再帰の継続条件
  {
    fill(255 - iLevel/4,30);
    // 正方形描画
    circle( 1000, 0, fSize );
    
    drawCircle( fSize * 0.8, iLevel - 1 );  // 再帰呼び出し
  }
}
