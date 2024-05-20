int iRot = 0;

void setup()
{
  size( 400, 400 );
  frameRate( 60 );
}

void draw()
{
  background( 204 );
  
  iRot++;
  if( iRot > 360 )
  {
    iRot = 0;
  }
  
  drawShape();
}

void drawShape()
{
  beginShape( TRIANGLE_FAN );
  vertex( 200 + 40 * cos( radians( iRot ) ), 200 + 40 * sin( radians( iRot ) ) );
  vertex( 200, 0 );
  vertex( 400, 200 );
  vertex( 200, 400 );
  vertex( 0, 200 );
  vertex( 200, 0 );
  endShape( CLOSE );
}
