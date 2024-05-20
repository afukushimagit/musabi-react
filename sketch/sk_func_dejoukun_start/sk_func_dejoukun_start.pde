void setup()
{
  size( 400, 400 );
}

void draw()
{
  background( 204 );
  
  drawDejoukun( 200, 200 );  
}

/**
 * 指定した位置とサイズで円を描画する関数
 *
 * @param iX デ情くんの中心のX座標
 * @param iY デ情くんの中心のY座標
 */
void drawDejoukun( int iX, int iY )
{
  pushMatrix();
  
  translate( iX, iY );
    
  noStroke();  // fuchi nashi

  // finger
  fill( 0 );
  ellipse( 100, -49, 104, 136 );
  
  // finger mask
  fill( 204 );
  ellipse( 190, -70, 200, 200 );
  
  // daen
  fill( 0 );
  ellipse( 0, 30, 260, 200 );
  
  // mouth mask
  fill( 204 );
  ellipse( 0, 4, 116, 186 );
  
  // ue daen mask
  fill( 0 );
  ellipse( 0, -4, 200, 134 );
  
  // daen mask
  fill( 204 );
  ellipse( 0, 4, 90, 60 );
  
  popMatrix();
}
