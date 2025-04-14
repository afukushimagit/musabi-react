// === Time Handling ===
int hourPrev;
int minutePrev;
int secondPrev;
float millisCurrent;
float millisPrev;
float millisPrevSec;
// === Time Handling Functions===
void initTime()
{
  hourCurrent = hour();
  minuteCurrent = minute();
  secondCurrent = second();
  millisCurrent = millis();
  
  hourPrev = hour();
  minutePrev = minute();
  secondPrev = second();
  millisPrev = millis();
  
  millisPrevSec = millis();
}

void updateTimePre()
{
  if( hourPrev != hour() ) hourCurrent = hour();
  if( minutePrev != minute() ) minuteCurrent = minute();
  secondCurrent = second();
  millisCurrent = millis();
  
  deltaTime = ( millisCurrent - millisPrev ) / 1000;
  
  if ( secondCurrent != secondPrev )
  {
    millisPrevSec = millis();
  }
  
  deltaTimePerSec = ( millisCurrent - millisPrevSec ) / 1000;
}
void updateTimePost()
{ 
  hourPrev = hourCurrent;
  minutePrev = minuteCurrent;
  secondPrev = secondCurrent;
  millisPrev = millisCurrent;
}
void keyPressed()
{
  if ( key == 's' )
  {
    save(pngName);
  }
  else if ( key == 'h' )
  {
    hourPrev = -1;
  }
  else if ( key == 'm' )
  {
    minutePrev = -1;
  }
}

//描画用関数
void drawBox( float iR )
{
  //白い面を作成
  fill( iLCR, iLCG, iLCB );
  beginShape();
  vertex( iRL * cos( radians( iR + 180 ) ) , iYL * sin( radians( iR + 180 ) ) );
  vertex( iRL * cos( radians( iR + 270 ) ) , iYL * sin( radians( iR + 270 ) ) );
  vertex( iRL * cos( radians( iR + 270 ) ) + iXL , iYL * sin( radians( iR + 270 ) ) );
  vertex( iRL * cos( radians( iR + 180 ) ) + iXL , iYL * sin( radians( iR + 180 ) ) );
  endShape( CLOSE );
 
  //黒い面を作成
  fill( iDC );
  beginShape();
  vertex( iRL * cos( radians( iR + 270 ) ) , iYL * sin( radians( iR + 270 ) ) );
  vertex( iRL * cos( radians( iR ) ) , iYL * sin( radians( iR ) ) );
  vertex( iRL * cos( radians( iR ) ) + iXL , iYL * sin( radians( iR ) ) );
  vertex( iRL * cos( radians( iR + 270 ) ) + iXL , iYL * sin( radians( iR + 270 ) ) );
  endShape( CLOSE );
  
  //横の面を作成
  fill( iMC );
  beginShape();
  vertex( iRL * cos( radians( iR + 180 ) ) , iYL * sin( radians( iR + 180 ) ) );
  vertex( iRL * cos( radians( iR + 270 ) ) , iYL * sin( radians( iR + 270 ) ) );
  vertex( iRL * cos( radians( iR ) ) , iYL * sin( radians( iR ) ) );
  vertex( iRL * cos( radians( iR + 90 ) ) , iYL * sin( radians( iR + 90 ) ) );
  endShape( CLOSE );
}
//各位の各セグメントの情報をiPosから仕入れ、iRStoHに入れ、回転の角度を返す関数
float rotateBox( int iPlace, int iNow, float iRR )
{
  if( iPos[iPlace][iNow] == 1 )
    {
      //90度より傾きすぎないようにする分岐
      if( iRR < 135 )
      {
        iRR += 4;
      }
    }
    else
    {
      //0度未満に傾きすぎないようにする分岐
      if( iRR > 45 )
      {
        iRR -= 4;
      }
    }
    return iRR;
}


void locateBox( float iCenter, int iUnit )
{
  pushMatrix();
  //各位の位置、明暗、位の情報をもとに箱を並べていく
  //秒数一の位上部
  translate( iCenter, 25 );
  drawBox( iRStoH[iUnit][0] );
  translate( -22.5, 0 );
  drawBox( iRStoH[iUnit][0] );
  translate( -22.5, 0 );
  drawBox( iRStoH[iUnit][0] );
  
  popMatrix();
  pushMatrix();
  //秒数一の位右上
  translate( iCenter + 20, 45 );
  drawBox( iRStoH[iUnit][1] );
  translate( 0, 20 );
  drawBox( iRStoH[iUnit][1] );
  translate( 0, 20 );
  drawBox( iRStoH[iUnit][1] );
  
  popMatrix();
  pushMatrix();
  //秒数一の位右下
  translate( iCenter + 20, 120 );
  drawBox( iRStoH[iUnit][2] );
  translate( 0, 20 );
  drawBox( iRStoH[iUnit][2] );
  translate( 0, 20 );
  drawBox( iRStoH[iUnit][2] );
  
  popMatrix();
  pushMatrix();
  //秒数一の位下部
  translate( iCenter, 180 );
  drawBox( iRStoH[iUnit][3] );
  translate( -22.5, 0 );
  drawBox( iRStoH[iUnit][3] );
  translate( -22.5, 0 );
  drawBox( iRStoH[iUnit][3] );
  
  popMatrix();
  pushMatrix();
  //秒数一の位左下
  translate( iCenter - 65, 120 );
  drawBox( iRStoH[iUnit][4] );
  translate( 0, 20 );
  drawBox( iRStoH[iUnit][4] );
  translate( 0, 20 );
  drawBox( iRStoH[iUnit][4] );
  
  popMatrix();
  pushMatrix();
  //秒数一の位左上
  translate( iCenter - 65, 45 );
  drawBox( iRStoH[iUnit][5] );
  translate( 0, 20 );
  drawBox( iRStoH[iUnit][5] );
  translate( 0, 20 );
  drawBox( iRStoH[iUnit][5] );
  
  popMatrix();
  pushMatrix();
  //秒数一の位中央
  translate( iCenter, 102.5 );
  drawBox( iRStoH[iUnit][6] );
  translate( -22.5, 0 );
  drawBox( iRStoH[iUnit][6] );
  translate( -22.5, 0 );
  drawBox( iRStoH[iUnit][6] );
  
  popMatrix();
}

void drawColon( float iColonPosX, float iColonPosY )
{
  pushMatrix();
  noFill();
  stroke( 255 );
  translate( iColonPosX, iColonPosY );
  //回転し続ける骨組み立方体コロンを書く
  beginShape();
  vertex( iRL * cos( radians( iColonR + 180 ) ) , iYL * sin( radians( iColonR + 180 ) ) );
  vertex( iRL * cos( radians( iColonR + 270 ) ) , iYL * sin( radians( iColonR + 270 ) ) );
  vertex( iRL * cos( radians( iColonR + 270 ) ) + iXL , iYL * sin( radians( iColonR + 270 ) ) );
  vertex( iRL * cos( radians( iColonR + 180 ) ) + iXL , iYL * sin( radians( iColonR + 180 ) ) );
  endShape( CLOSE );
 
  beginShape();
  vertex( iRL * cos( radians( iColonR + 270 ) ) , iYL * sin( radians( iColonR + 270 ) ) );
  vertex( iRL * cos( radians( iColonR ) ) , iYL * sin( radians( iColonR ) ) );
  vertex( iRL * cos( radians( iColonR ) ) + iXL , iYL * sin( radians( iColonR ) ) );
  vertex( iRL * cos( radians( iColonR + 270 ) ) + iXL , iYL * sin( radians( iColonR + 270 ) ) );
  endShape( CLOSE );
  
  beginShape();
  vertex( iRL * cos( radians( iColonR ) ) , iYL * sin( radians( iColonR ) ) );
  vertex( iRL * cos( radians( iColonR + 90 ) ) , iYL * sin( radians( iColonR + 90 ) ) );
  vertex( iRL * cos( radians( iColonR + 90 ) ) + iXL , iYL * sin( radians( iColonR + 90 ) ) );
  vertex( iRL * cos( radians( iColonR ) ) + iXL , iYL * sin( radians( iColonR ) ) );
  endShape( CLOSE );
  
  beginShape();
  vertex( iRL * cos( radians( iColonR + 90 ) ) , iYL * sin( radians( iColonR + 90 ) ) );
  vertex( iRL * cos( radians( iColonR + 180 ) ) , iYL * sin( radians( iColonR + 180 ) ) );
  vertex( iRL * cos( radians( iColonR + 180 ) ) + iXL , iYL * sin( radians( iColonR + 180 ) ) );
  vertex( iRL * cos( radians( iColonR + 90 ) ) + iXL , iYL * sin( radians( iColonR + 90 ) ) );
  endShape( CLOSE );
  
  iColonR += 0.5;
  popMatrix();
}
