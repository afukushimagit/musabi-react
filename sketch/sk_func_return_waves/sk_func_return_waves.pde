float fTimeR = 0;
float fTimeB = 0;

void setup()
{
  size(600, 400);
}

void draw()
{
  
  background(204);
  
  translate( 0, height / 2 );
  
  // 波の描画（Red）
  drawWaveR();
  
  // 波の描画（Blue）
  drawWaveB();
}

void drawWaveR()
{
  stroke(255,0,0);
  noFill();
  beginShape();
  for (int iX = 0; iX < width; iX+=10)
  {
    float fY = getWaveY(iX, fTimeR, 60);
    vertex( iX, fY );
  }
  endShape();
  
  fTimeR += 0.05;
}

void drawWaveB()
{
  stroke(0,0,255);
  noFill();
  beginShape();
  for (int iX = 0; iX < width; iX+=10)
  {
    float fY = getWaveY(iX, fTimeB, 30);
    vertex( iX, fY );
  }
  endShape();
  
  fTimeB += 0.06;
}

float getWaveY(float iX, float fTime, float fAmp ) 
{
  return sin(iX * 0.05 + fTime) * fAmp;
}
