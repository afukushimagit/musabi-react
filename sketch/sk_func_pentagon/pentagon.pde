void updatePentagon()
{
  iPentagonAnimRot++;
  if( iPentagonAnimRot > 360 )
  {
    iPentagonAnimRot = 0;
  }
}

void drawPentagon()
{
  pushMatrix();
  
  translate( 150, 150 );
  rotate( radians( iPentagonAnimRot ) );

  beginShape();
  for( int iDeg = -18; iDeg < 360; iDeg += 72 )
  {
    float fX = fPentagonRadius * cos( radians( iDeg ) );
    float fY = fPentagonRadius * sin( radians( iDeg ) );
    
    vertex( fX, fY );
  }
  endShape( CLOSE );
  
  popMatrix();
}
