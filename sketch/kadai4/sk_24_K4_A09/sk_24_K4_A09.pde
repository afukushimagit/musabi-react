/**************************************************************
関数を再帰的に呼び出すことで描画できる枝分かれを応用し、線香花火の
ような模様を作成しました。
線ではなく円を使って描画することで、火花らしい滑らかな曲線を表現しました。
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
  size(1000, 1000);    // Window Size
  noLoop();            // draw once.
}

void draw()
{
 
  translate( 500, 500 );
  noStroke();
  
  colorMode( HSB, 100 );
  background( 0, 0, 0 );
  
  //光
  for( int iCircle = 0; iCircle < 1000; iCircle ++ )
  {
    fill( 7, 80, iCircle / 20 );
    circle( 0, 0, 1000 - iCircle );
  }
  
  //線香花火
  fill( 100, 0, 100 );
  circle( 0, 0, 10 );
  arc( 0, -1, 10, 20, radians( -180 ), radians( 0 ), PIE );
  
  //火花
  for( int iDraw = 0; iDraw < 10; iDraw ++ )
  {
    drawSenko( 0, 0, 0, 100, 400, 0, 1000 );
    rotate( radians( random( 0, 360 ) ) );
  }
  

}

void drawSenko( float fPlaceX, float fPlaceY, float fSize, float fColor, int iLevel, float fAngle, float fProbability )
{
  if( iLevel > 0 )
  {
    fill( 7, fColor, 100 );
    circle( fPlaceX, fPlaceY, fSize );
    
    float fSeparate = random( 0, 1000 );
    //確率で起こる分岐
    if( fSeparate > fProbability || iLevel == 100 )
    {
      for( int i = 0; i < 5; i ++ )
      {
        fAngle = fAngle + random( 0, 360 );
        drawSenko( fPlaceX + cos( radians( fAngle ) ), fPlaceY + sin( radians( fAngle ) ), 0.6, 90, iLevel - 1, random( 0, 360 ), 1000 );
      }
    }
    else
    {
      float fSeparateOrEnd = random( 0, 1000 );
      //iLevelが200以上のときだけ起こる分岐
      if( fSeparateOrEnd > 999 && iLevel > 200 )
      {
        float fSeparateAngle1 = random( 0, 45 );
        float fSeparateAngle2 = random( -45, 0 );
        drawSenko( fPlaceX + cos( radians( fAngle + fSeparateAngle1 ) ), fPlaceY + sin( radians( fAngle + fSeparateAngle1 ) ), fSize + 0.01, fColor - 0.2, iLevel - 1, fAngle + fSeparateAngle1, fProbability - 0.03 );
        drawSenko( fPlaceX + cos( radians( fAngle + fSeparateAngle2 ) ), fPlaceY + sin( radians( fAngle + fSeparateAngle2 ) ), fSize + 0.01, fColor - 0.2, iLevel - 1, fAngle + fSeparateAngle2, fProbability - 0.03 );
      }
      else if( fSeparateOrEnd < 999 && fSeparateOrEnd > 10 )
      {
        drawSenko( fPlaceX + cos( radians( fAngle ) ), fPlaceY + sin( radians( fAngle ) ), fSize + 0.01, fColor - 0.2, iLevel - 1, fAngle + random( -1, 1 ), fProbability - 0.01 );
      }
      //時々iLevelを増やして長さをランダムにする
      else
      {
        drawSenko( fPlaceX + cos( radians( fAngle ) ), fPlaceY + sin( radians( fAngle ) ), fSize + 0.01, fColor + 0.2, iLevel + 10, fAngle + random( -1, 1 ), fProbability - 0.01 );
      }
    }
  }
}
