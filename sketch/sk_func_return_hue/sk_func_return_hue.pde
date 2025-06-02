int hourCurrent;       // 現在の時（0~23）
int minuteCurrent;     // 現在の分（0~59）
int secondCurrent;     // 現在の秒（0~59）

void setup()
{
  size(450, 200);
  colorMode(HSB, 360, 100, 100);
}

void draw()
{
  hourCurrent = hour();
  minuteCurrent = minute();
  secondCurrent = second();
  
  background(204);
  
  // 時の円(24時間で色相ループ)
  fill( getLoopingHue( hourCurrent, 24), 80, 100 );
  noStroke();
  ellipse( 75, height / 2, 100, 100);
  
  // 分の円(60分で色相ループ)
  fill( getLoopingHue( minuteCurrent, 60), 80, 100 );
  noStroke();
  ellipse(225, height / 2, 100, 100);
  
  // 秒の円(60秒で色相ループ)
  fill( getLoopingHue( secondCurrent, 60), 80, 100 );
  noStroke();
  ellipse(375, height / 2, 100, 100);
}

float getLoopingHue(int fTime, float fMax) 
{
  float hue = ( ( fTime % int(fMax) ) / fMax ) * 360;
  return hue;
}
