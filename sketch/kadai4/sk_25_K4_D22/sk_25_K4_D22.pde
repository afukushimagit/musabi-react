/**************************************************************
再起的な樹木の描画のプログラムを改造し、for文を用いて円形になるように繰り返し描画することで綿毛のような模様を作成しました。
分岐を繰り返すごとに線を細くしていくことで、末端になるにつれ綿毛のふわふわとした様子に近づけています。
描画後に座標変換を用いて大きさや位置をランダムに定め、計４つの綿毛模様が描画されます。
背景を完全に黒染めにすることで綿毛の繊維までよく見えるようにし、少し不気味な雰囲気の演出も試みています。
 **************************************************************/
/**
  デバッグ機能
    実行ウィンドウ内でマウスクリック：再描画
    '1'キー：１枚目のpng出力（~_01.png）
    '2'キー：２枚目のpng出力（~_02.png）
*/
// === 'S'キーを押した時の出力画像名 ===
//  "K4_[クラス][番号]_[苗字]"  ※拡張子(.png)は不要
String pngName = "K4_D22_Fukushima";

// === setupには変更を加えないこと ===
void setup()
{
  size(1000, 1000);    // Window Size
  noLoop();            // draw once.
}

void draw()
{ 
  //　 再描画を行うため，背景色の描画もここに記述する．
  background( 0 );
  translate( 500, 500 );
  
   // === 再帰関数の呼び出しやその他の描画命令 ===
   
  for( int iFluff = 0; iFluff < 6; iFluff++ )
  {
    
    //座標変換で描画した綿毛模様の位置、大きさを変更
    pushMatrix(); 
    translate( random( -500, 500), random( -500, 500) );
    scale( random( 0.3, 0.8 ) );
    
       //再帰関数drawFluffを繰り返し呼び出して綿毛を描画
      for( int rotator = -90; rotator < 260; rotator += 30)
      {
        drawFluff( 0, 0, 110, rotator, 18 );
        drawFluff2( 0, 0, 110, rotator, 18 );
        drawFluff3( 0, 0, 110, rotator, 18 );
        drawFluff4( 0, 0, 110, rotator, 18 );
        drawFluff5( 0, 0, 110, rotator, 18 );
        drawFluff6( 0, 0, 110, rotator, 18 );
      }
      
   popMatrix();
  }
}

//綿毛を描画する再帰関数を定義
void drawFluff( float fBeginX, float fBeginY, float fLength, float fRot, int iLevel )
{
  if( iLevel > 0 )
  {
   
   stroke( 255 );
   strokeWeight( iLevel  / 2);  //線を細く 
    
   //線の終点
   float fEndX = fBeginX + cos( radians( fRot ) ) * fLength;
   float fEndY = fBeginY + sin( radians( fRot ) ) * fLength;
   
   //線の描画
   strokeWeight( iLevel * 0.025);  //線を細く 
   line( fBeginX, fBeginY, fEndX, fEndY );
   
   drawFluff( fEndX, fEndY, fLength * 0.80, fRot + 12, iLevel - 2 );
   drawFluff( fEndX, fEndY, fLength * 0.80, fRot + random( -10, 10 ), iLevel - 2 );
   drawFluff( fEndX, fEndY, fLength * 0.80, fRot - 12, iLevel - 2 );
  }
}

void drawFluff2( float fBeginX, float fBeginY, float fLength, float fRot, int iLevel )
{
  if( iLevel > 0 )
  {
   
   stroke( 255 );
   strokeWeight( iLevel  / 2);  //線を細く 
    
   //線の終点
   float fEndX = fBeginX + cos( radians( fRot ) ) * (fLength / 2);
   float fEndY = fBeginY + sin( radians( fRot ) ) * (fLength / 2);
   
   //線の描画
   strokeWeight( iLevel * 0.025);  //線を細く 
   line( fBeginX, fBeginY, fEndX, fEndY );
   
   drawFluff( fEndX, fEndY, fLength * 0.80, fRot + 12, iLevel - 3 );
   drawFluff( fEndX, fEndY, fLength * 0.80, fRot + random( -10, 10 ), iLevel - 3 );
   drawFluff( fEndX, fEndY, fLength * 0.80, fRot - 12, iLevel - 3 );
  }
}

void drawFluff3( float fBeginX, float fBeginY, float fLength, float fRot, int iLevel )
{
  if( iLevel > 0 )
  {
   
   stroke( 255 );
   strokeWeight( iLevel  / 2);  //線を細く 
    
   //線の終点
   float fEndX = fBeginX + cos( radians( fRot ) ) * (fLength / 3);
   float fEndY = fBeginY + sin( radians( fRot ) ) * (fLength / 3);
   
   //線の描画
   strokeWeight( iLevel * 0.025);  //線を細く 
   line( fBeginX, fBeginY, fEndX, fEndY );
   
   drawFluff( fEndX, fEndY, fLength * 0.70, fRot + 12, iLevel - 4 );
   drawFluff( fEndX, fEndY, fLength * 0.70, fRot + random( -10, 10 ), iLevel - 4 );
   drawFluff( fEndX, fEndY, fLength * 0.70, fRot - 12, iLevel - 4 );
  }
}

void drawFluff4( float fBeginX, float fBeginY, float fLength, float fRot, int iLevel )
{
  if( iLevel > 0 )
  {
   
   stroke( 255 );
   strokeWeight( iLevel  / 2);  //線を細く 
    
   //線の終点
   float fEndX = fBeginX + cos( radians( fRot ) ) * (fLength / 4);
   float fEndY = fBeginY + sin( radians( fRot ) ) * (fLength / 4);
   
   //線の描画
   strokeWeight( iLevel * 0.025);  //線を細く 
   line( fBeginX, fBeginY, fEndX, fEndY );
   
   drawFluff( fEndX, fEndY, fLength * 0.60, fRot + 12, iLevel - 5 );
   drawFluff( fEndX, fEndY, fLength * 0.60, fRot + random( -10, 10 ), iLevel - 5 );
   drawFluff( fEndX, fEndY, fLength * 0.60, fRot - 12, iLevel - 5 );
  }
}

void drawFluff5( float fBeginX, float fBeginY, float fLength, float fRot, int iLevel )
{
  if( iLevel > 0 )
  {
   
   stroke( 255 );
   strokeWeight( iLevel  / 2);  //線を細く 
    
   //線の終点
   float fEndX = fBeginX + cos( radians( fRot ) ) * (fLength / 5 );
   float fEndY = fBeginY + sin( radians( fRot ) ) * (fLength / 5 );
   
   //線の描画
   strokeWeight( iLevel * 0.025);  //線を細く 
   line( fBeginX, fBeginY, fEndX, fEndY );
   
   drawFluff( fEndX, fEndY, fLength * 0.50, fRot + 12, iLevel - 6 );
   drawFluff( fEndX, fEndY, fLength * 0.50, fRot + random( -10, 10 ), iLevel - 6 );
   drawFluff( fEndX, fEndY, fLength * 0.50, fRot - 12, iLevel - 6 );
  }
}

void drawFluff6( float fBeginX, float fBeginY, float fLength, float fRot, int iLevel )
{
  if( iLevel > 0 )
  {
   
   stroke( 255 );
   strokeWeight( iLevel  / 2);  //線を細く 
    
   //線の終点
   float fEndX = fBeginX + cos( radians( fRot ) ) * (fLength / 6 );
   float fEndY = fBeginY + sin( radians( fRot ) ) * (fLength / 6 );
   
   //線の描画
   strokeWeight( iLevel * 0.025);  //線を細く 
   line( fBeginX, fBeginY, fEndX, fEndY );
   
   drawFluff( fEndX, fEndY, fLength * 0.40, fRot + 12, iLevel - 7 );
   drawFluff( fEndX, fEndY, fLength * 0.40, fRot + random( -10, 10 ), iLevel - 7 );
   drawFluff( fEndX, fEndY, fLength * 0.40, fRot - 12, iLevel - 7 );
  }
}
