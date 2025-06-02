int hourCurrent;       // 現在の時（0~23）
int minuteCurrent;     // 現在の分（0~59）
int secondCurrent;     // 現在の秒（0~59）

void setup()
{
  size(400, 400);
}

void draw()
{
  hourCurrent = hour();
  minuteCurrent = minute();
  secondCurrent = second();
  
  background(204);
  
  translate( width / 2, height / 2 );
  
  // 時の円(24時間で1周)
  pushMatrix();
  rotate( getRotationRad( hourCurrent, 24) );
  rect( -10, -180, 20, 200);
  popMatrix();
  
  // 分の円(60分で1周)
  pushMatrix();
  rotate( getRotationRad( minuteCurrent, 60) );
  rect( -6, -180, 12, 200);
  popMatrix();
  
  // 秒の円(60秒で1周)
  pushMatrix();
  rotate( getRotationRad( secondCurrent, 60) );
  rect( -2, -180, 4, 200);
  popMatrix();
}

float getRotationRad(int fTime, float fMax) 
{
  float fRot = ( ( fTime % int(fMax) ) / fMax ) * 360;
  return radians( fRot );
}
