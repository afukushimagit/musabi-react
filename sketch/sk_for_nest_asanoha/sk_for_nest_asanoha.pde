size( 600, 600 );
    
fill( 235,184,184 );
stroke( 255 );
strokeWeight( 2 );
strokeJoin( BEVEL );

translate( 0, 30 );

/*
  奇数段
*/

for( int iY = 0; iY < 600; iY += 240 )
{
  for( int iX = 0; iX < 600; iX += 140 )
  {
    pushMatrix();
    
    translate( iX, iY );
    
    // 麻の葉模様を描画する
    for( int i = 0; i < 6; i++ )
    {
      beginShape( TRIANGLE_STRIP );
      vertex( 0, 0 );
      vertex( 69, 40 );
      vertex( 23, 40 );
      vertex( 0, 80 );
      vertex( 0, 0 );
      endShape();
      
      rotate( radians( 60 ) );
    }
  
    popMatrix();
  }
}


/*
  偶数段
*/
fill( 255,144,144 );  // 濃い目の色

for( int iY = 120; iY < 700; iY += 240 )
{
  for( int iX = 70; iX < 700; iX += 140 )
  {
    pushMatrix();
    
    translate( iX, iY );
    
    // 麻の葉模様を描画する
    for( int i = 0; i < 6; i++ )
    {
      beginShape( TRIANGLE_STRIP );
      vertex( 0, 0 );
      vertex( 69, 40 );
      vertex( 23, 40 );
      vertex( 0, 80 );
      vertex( 0, 0 );
      endShape();
      
      rotate( radians( 60 ) );
    }
  
    popMatrix();
  }
}
