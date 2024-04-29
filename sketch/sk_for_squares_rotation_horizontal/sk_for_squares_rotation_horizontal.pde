size( 400, 100 );

rectMode( CENTER );
translate( 0, 50 );

for ( int iX = 25; iX < 400; iX += 50 )
{
  pushMatrix();
  
  translate( iX, 0 );
  rotate( radians( iX ) );
  square( 0, 0, 40 );
  
  popMatrix();
}
