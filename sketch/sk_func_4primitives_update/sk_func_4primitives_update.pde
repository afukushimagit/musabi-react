int iX = 0;

void setup()
{
  size( 400, 200 );
}

void draw()
{ 
  background( 204 );
  
  // ４つの図形を更新する．
  update4Primitives();
  
  // ４つの図形を描画する．
  draw4Primitives();
}
