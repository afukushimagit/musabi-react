size( 300, 300 );
    
fill( 235,184,184 );
stroke( 255 );
strokeWeight( 2 );
strokeJoin( BEVEL );

translate( 150, 150 );

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
