/**************************************************************
授業内で制作した稲妻を発展させ、よりリアルで幻想的な雷の描画を試みた。
①メインの稲妻の枝分かれ分岐
②メインの稲妻の周りをバチバチしてる細い部分
に再帰関数を使用している。
②の、始点と終点を保持しながら、ある程度ランダムに走らせつつも元の稲妻に帰ってくるプログラムに苦労した。
 **************************************************************/
/**
  デバッグ機能
    実行ウィンドウ内でマウスクリック：再描画
    '1'キー：１枚目のpng出力（~_01.png）
    '2'キー：２枚目のpng出力（~_02.png）
*/
// === 'S'キーを押した時の出力画像名 ===
//  "K4_[クラス][番号]_[苗字]"  ※拡張子(.png)は不要
String pngName = "K4_B04_Fukushima";

void setup()
{
  size(1000, 1000);    // Window Size
  noLoop();            // draw once.
}

void draw()
{
  background(0);
  colorMode(HSB);
  blendMode( ADD );
  stroke(0);
  strokeWeight(2);
  for (int i = 1; i < 100; i++) {
    noStroke();
    fill(180, 100, 5, 200);
    circle(500, 0, i*16);
  }
  for (int i = 1; i < 7; i++) {
    drawLightning(random(500, 500), random(-300, 0), /*長さ*/120, /*y角度*/90 + random( -10, 10 ), /*太さ*/int(random(12, 18)), 0); // 最初の再帰呼び出し
  }
}

/**
 再帰関数：線を再帰的に短くし，ランダムに回転させながら描画する．
 */
void drawLightning( float fBeginX, float fBeginY, float fLength, float fRot, int iLevel, float BranchingProbability )
{
  if ( int(iLevel) > 0 )  // 再帰の継続条件
  {
    // 線の終点
    float fEndX = fBeginX + cos( radians( fRot ) ) * fLength;
    float fEndY = fBeginY + sin( radians( fRot ) ) * fLength;
    float Thickness = 0.4;

    stroke(180, 100, 100, 100);

    for (int j = iLevel; j > 0; j--) {
      strokeWeight( Thickness*(iLevel + j + random(15) )*0.55);
      line( fBeginX, fBeginY, fEndX, fEndY); // 線を描画
    }
    drawElectric(fBeginX, fBeginY, fEndX, fEndY, 1, 0, 0);

    // 子の回転
    float fNewRot = fRot + random( -40, 40 );

    // 真横に向いたら逆向きに戻す．
    if ( fNewRot > 180 )
    {
      fNewRot -= 160;
    } else if ( fNewRot < 0 )
    {
      fNewRot += 160;
    }

    // 再帰呼び出し
    drawLightning( fEndX, fEndY, fLength * 0.95, fNewRot, iLevel - 1, BranchingProbability + 0.4);

    // ランダムに再帰呼び出しを行う．
    if ( 1/random( 0, BranchingProbability ) < 10 )
    {
      drawLightning( fEndX, fEndY, fLength * 0.4, fNewRot + random( -40, 40 ), int(iLevel - random( 0, iLevel )), 0);
      if (iLevel>10) {
        drawElectric(fBeginX, fBeginY, fEndX, fEndY, 1, 0, 0);
      }
    }
  }
}
//バチバチ
void drawElectric( float fBeginX, float fBeginY, float fEndX, float fEndY, int n, float shiftX, float shiftY) {
  stroke(180, 100, 255, 100);
  strokeWeight(0.4);
  float shiftXAfter = shiftX + random(-4, 4);
  float shiftYAfter = shiftY + random(-4, 4);
  //ずれの是正
  if (n == 10) {
    shiftXAfter = 0;
    shiftYAfter = 0;
  }
  line(fBeginX+((fEndX-fBeginX)*(n*0.1))+shiftX, fBeginY-((fBeginY-fEndY)*(n*0.1))+shiftY, fBeginX+((fEndX-fBeginX)*((n+1)*0.1))+shiftXAfter, fBeginY-((fBeginY-fEndY)*((n+1)*0.1))+shiftYAfter ); // 線を描画
//再帰呼び出し(10回適当に走らせ、元の場所に戻る)
  if (n < 10) {
    drawElectric(fBeginX, fBeginY, fEndX, fEndY, n+1, shiftXAfter, shiftYAfter);
  }
  if (random(100) > 98) {
        drawElectric(fBeginX+((fEndX-fBeginX)*(n*0.1))+shiftX, fBeginY-((fBeginY-fEndY)*(n*0.1))+shiftY, fBeginX+((fEndX-fBeginX)*((n+1)*0.1))+shiftXAfter, fBeginY-((fBeginY-fEndY)*((n+1)*0.1))+shiftYAfter, 1, 0, 0);
      }
}
