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

void PM()
{
  fPlayerX += 2;
}

void TMY()
{
  fTamaY -= 1;
}

void TMX()
{
 fTamaX += 2;
}

void TMYRE()
{
  fTamaY = 330;
}

void KX()
{
  fKakusiW += 2;
}

void BM()
{
  fBombW += 0.6;
}
void bm()
{
  fBombWm += 0.3;
}
