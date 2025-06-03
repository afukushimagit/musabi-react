void setup()
{
  size( 300, 300 );
}

void draw()
{ 
  background( 204 );
  
  drawHexagons();
}

//12個の六角形を描画する．
void drawHexagons()
{
  for( int iHexagon = 0; iHexagon < 12; iHexagon++ )
  {
    drawHexagon( 150, 150, 150 - iHexagon * 12 );
  }
}

// 六角形を１つ描画する．
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
