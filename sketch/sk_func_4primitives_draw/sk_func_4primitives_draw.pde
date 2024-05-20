int iX = 0;

void setup()
{
  size( 400, 200 );
}

void draw()
{ 
  background( 204 );
  
  iX++;
  if( iX > width )
  {
    iX = 0;
  }
  
  translate( iX, 80 );
  
  // ４つの図形を描画する．
  draw4Primitives();
}

void draw4Primitives()
{
  square( 0, 0, 20 );
  triangle( 30, 0, 20, 20, 40, 20 );
  circle( 30, 30, 20 );
  quad( 10, 20, 20, 30, 10, 40, 0, 30 );
}
