void update4Primitives()
{
  iX++;
  if( iX > width )
  {
    iX = 0;
  }
}

void draw4Primitives()
{
  pushMatrix();
  
  translate( iX, 80 );
  
  square( 0, 0, 20 );
  triangle( 30, 0, 20, 20, 40, 20 );
  circle( 30, 30, 20 );
  quad( 10, 20, 20, 30, 10, 40, 0, 30 );
  
  popMatrix();
}
