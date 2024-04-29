size( 400, 400 );

blendMode( DIFFERENCE );  // 差の絶対値

translate( 200, 200 );

for( int iAngle = 0; iAngle < 360; iAngle += 40 )
{
  pushMatrix();
  
  fill( 200 );
  rotate( radians( iAngle ) );
  rect( 0, -36, 140, 180 );
  
  popMatrix();
}
