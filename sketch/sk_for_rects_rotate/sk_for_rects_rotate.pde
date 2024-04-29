size( 400, 400 );

translate( 200, 200 );

for( int iAngle = 0; iAngle < 360; iAngle += 60 )
{
  pushMatrix();
  
  rotate( radians( iAngle ) );
  rect( 0, 0, 60, 120 );
  
  popMatrix();
}
