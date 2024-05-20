void setup()
{
  size( 400, 200 );
}

void draw()
{ 
  background( 204 );
  
  drawHexagon( 70, 100, hour() + 20 );
  drawHexagon( 200, 100, minute() + 20 );
  drawHexagon( 330, 100, second() + 20 );
}

void drawHexagon( int iX, int iY, float fRadius )
{
  beginShape();
  for( int iDeg = 0; iDeg < 360; iDeg += 60 )
  {
    float fX = fRadius * cos( radians( iDeg ) );
    float fY = fRadius * sin( radians( iDeg ) );
    
    vertex( fX + iX, fY + iY );
  }
  endShape( CLOSE );
}
