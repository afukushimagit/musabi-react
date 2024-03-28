/**
 
 ランダムな点描によるデジタル時計
 分や時が切り替わった後，徐々に描画が変化していく．
 
 */

// 時間表示のスケール値[（スクリーンの）幅に対する率,高さに対する率]
final float DIGITS_SCALE[] = { 0.80, 0.60 };

// 各桁間の間隔 一桁分の幅に対する率
final float DIGIT_INTERVAL = 0.6;
// コロンの幅 一桁分の幅に対する率
final float COLON_WIDTH_RATE = 0.1;

// 桁番号 01:23
// 各桁の座標[桁番号][x,y]
float fDigitPos[][] = new float[4][2];

// 各桁のサイズ[桁番号][w,h]
float fDigitSize[][] = new float[4][2];

// コロンの挿入場所(桁番号に対応)
final int COLON_LOC_IDX = 2;

/** セグメント番号
 4
 -
 0|5|2
 -
 1| |3
 -
 6
 */
// セグメント範囲の左上座標 [セグメント番号][x,y]
float fSegmentUpperLeft[][] = new float[7][2];
// セグメント範囲のサイズ [セグメント番号][w,h]
float fSegmentSize[][] = new float[7][2];
// セグメント同士の重なり [0-1]
float fSegmentsLap = 0.5;
// セグメントの太さ [0-1]
float fSegmentsThickness[] = { 0.2, 0.1 };

// 数に対して，表示を行うかのフラグ[標示数値] [セグメント番号]
final boolean[][] DIGIT_DISP_FLG ={{true, true, true, true, true, false, true}, //0
  {false, false, true, true, false, false, false}, //1
  {false, true, true, false, true, true, true}, //2
  {false, false, true, true, true, true, true}, //3
  {true, false, true, true, false, true, false}, //4
  {true, false, false, true, true, true, true}, //5
  {true, true, false, true, true, true, true}, //6
  {true, false, true, true, true, false, false}, //7
  {true, true, true, true, true, true, true}, //8
  {true, false, true, true, true, true, false} };//9


void setup()
{
  // スクリーンサイズ(※手入力)
  size( 800, 450 );

  int iDigitsCount = fDigitPos.length;  // 桁の数

  // 各桁の座標と幅
  float fDigitsWidth = width * DIGITS_SCALE[0];
  float fDigitWidth = fDigitsWidth / (iDigitsCount*(1+DIGIT_INTERVAL)+COLON_WIDTH_RATE);
  float fDigitHeight = height * DIGITS_SCALE[1];
  float fDigitInterval = fDigitWidth * DIGIT_INTERVAL;
  float fDigitPosX = ( width - fDigitsWidth ) / 2.0;
  for (int iDigitIdx = 0; iDigitIdx < fDigitPos.length; iDigitIdx++)
  {
    // コロンの場所を挿入.
    if ( iDigitIdx == COLON_LOC_IDX)
    {
      fDigitPosX += fDigitWidth*COLON_WIDTH_RATE + fDigitInterval;
    }
    fDigitPos[iDigitIdx][0] = fDigitPosX;
    fDigitPos[iDigitIdx][1] = ( height - fDigitHeight ) / 2.0;
    fDigitSize[iDigitIdx][0] = fDigitWidth;
    fDigitSize[iDigitIdx][1] = fDigitHeight;
    fDigitPosX += fDigitWidth + fDigitInterval;
  }

  // 縦長と横長のセグメントのサイズ[w,h]
  float fSegmentSizeV[]  = new float[2];
  float fSegmentSizeH[]  = new float[2];
  fSegmentSizeV[0] = fSegmentsThickness[0] * fDigitWidth;
  fSegmentSizeH[1] = fSegmentsThickness[1] * fDigitHeight;
  fSegmentSizeV[1] = ( fDigitHeight - (1-fSegmentsLap)*(3 * fSegmentSizeH[1]) ) / 2.0;
  fSegmentSizeH[0] = fDigitWidth - (1-fSegmentsLap)* (2 * fSegmentSizeV[0]);

  // 各セグメントのローカル座標
  float fSegmentOfs[] = { ( fDigitWidth - fSegmentSizeH[0] )    / 2.0,
    ( fDigitHeight - 2*fSegmentSizeV[1] ) / 3.0 };
  fSegmentUpperLeft[0][0] = 0.0;
  fSegmentUpperLeft[1][0] = 0.0;
  fSegmentUpperLeft[2][0] = fDigitWidth - fSegmentSizeV[0];
  fSegmentUpperLeft[3][0] = fSegmentUpperLeft[2][0];
  fSegmentUpperLeft[4][0] = fSegmentOfs[0];
  fSegmentUpperLeft[5][0] = fSegmentOfs[0];
  fSegmentUpperLeft[6][0] = fSegmentOfs[0];
  fSegmentUpperLeft[4][1] = 0;
  fSegmentUpperLeft[0][1] = fSegmentOfs[1];
  fSegmentUpperLeft[2][1] = fSegmentOfs[1];
  fSegmentUpperLeft[5][1] = fDigitHeight / 2.0 - fSegmentSizeH[1] / 2.0;
  {
    float fOfsY = fSegmentSizeV[1] + 2 * fSegmentOfs[1];
    fSegmentUpperLeft[1][1] = fOfsY;
    fSegmentUpperLeft[3][1] = fOfsY;
  }
  fSegmentUpperLeft[6][1] = fDigitHeight - fSegmentSizeH[1];
  for (int iSegmentIdx = 0; iSegmentIdx <= 3; iSegmentIdx++)
  {
    fSegmentSize[iSegmentIdx][0] = fSegmentSizeV[0];
    fSegmentSize[iSegmentIdx][1] = fSegmentSizeV[1];
  }
  for (int iSegmentIdx = 4; iSegmentIdx < fSegmentUpperLeft.length; iSegmentIdx++)
  {
    fSegmentSize[iSegmentIdx][0] = fSegmentSizeH[0];
    fSegmentSize[iSegmentIdx][1] = fSegmentSizeH[1];
  }

  background(50, 50, 50);
  colorMode(RGB, 256);
  frameRate(12);
}

void draw()
{
  /*
  // test:各桁のマスク表示
   for(int iDigitIdx = 0; iDigitIdx < fDigitPos.length; iDigitIdx++)
   {
   noStroke();
   fill(255,255,255);
   rect( fDigitPos[iDigitIdx][0],fDigitPos[iDigitIdx][1],
   fDigitSize[iDigitIdx][0],fDigitSize[iDigitIdx][1]);
   }
   */
  /*
  // test:セグメントマスク表示
   for(int iDigitIdx = 0; iDigitIdx < fDigitPos.length; iDigitIdx++)
   {
   noStroke();
   fill(100,100,100);
   for(int iSegmentIdx = 0; iSegmentIdx < fSegmentUpperLeft.length; iSegmentIdx++)
   {
   rect( fSegmentUpperLeft[iSegmentIdx][0]+fDigitPos[iDigitIdx][0],
   fSegmentUpperLeft[iSegmentIdx][1]+fDigitPos[iDigitIdx][1],
   fSegmentSize[iSegmentIdx][0],
   fSegmentSize[iSegmentIdx][1] );
   }
   }
   */
  /*
  // test:現在時間マスク
   int iHour = hour() ;
   int iMinute = minute();
   int iDispNumbers[] = { iHour/10, iHour%10, iMinute/10, iMinute%10 };
   noStroke();
   for(int iDigitIdx = 0; iDigitIdx < fDigitPos.length; iDigitIdx++)
   {
   int iDispNumber = iDispNumbers[iDigitIdx];
   for(int iSegmentIdx = 0; iSegmentIdx < fSegmentUpperLeft.length; iSegmentIdx++)
   {
   if( DIGIT_DISP_FLG[iDispNumber][iSegmentIdx] )
   {
   fill(255,0,0);
   rect( fSegmentUpperLeft[iSegmentIdx][0]+fDigitPos[iDigitIdx][0],
   fSegmentUpperLeft[iSegmentIdx][1]+fDigitPos[iDigitIdx][1],
   fSegmentSize[iSegmentIdx][0],
   fSegmentSize[iSegmentIdx][1] );
   }
   }
   }
   */

  // 点描レンダリング
  int iHour = hour() ;
  int iMinute = minute();
  int iDispNumbers[] = { iHour/10, iHour%10, iMinute/10, iMinute%10 };
  noStroke();
  for (int iDigitIdx = 0; iDigitIdx < fDigitPos.length; iDigitIdx++)
  {
    int iDispNumber = iDispNumbers[iDigitIdx];
    for (int iSegmentIdx = 0; iSegmentIdx < fSegmentUpperLeft.length; iSegmentIdx++)
    {
      if ( DIGIT_DISP_FLG[iDispNumber][iSegmentIdx] )
      {
        fill(random(255), random(255), random(255), 50);  // 点描
      } else
      {
        fill(50, 50, 50, 50);                          //　徐々にフェードアウト
      }
      circle( fSegmentUpperLeft[iSegmentIdx][0]+fDigitPos[iDigitIdx][0] + random(fSegmentSize[iSegmentIdx][0]),
        fSegmentUpperLeft[iSegmentIdx][1]+fDigitPos[iDigitIdx][1] + random(fSegmentSize[iSegmentIdx][1]),
        6+random(10))  ;
    }
  }
}
