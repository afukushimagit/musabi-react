size( 400, 400 );

rectMode( CENTER );
strokeWeight( 2 );

for ( int iY = 25; iY < 400; iY += 50 )
{
  pushMatrix();
  translate( 0, iY );

  for ( int iX = 25; iX < 400; iX += 50 )
  {
    pushMatrix();
    
    translate( iX, 0 );
    rotate( radians( iX + iY ) );
    
    noFill();
    circle( 0, 0, 50 );
    
    fill( 0, iX, iY );
    square( 0, 0, 34 );
    circle( 0, 0, 34 );
    
    popMatrix();
  }
  
  popMatrix();
}
