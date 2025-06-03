int iMouthDeg = 0;

void setup()
{
  size( 400, 400 );
  frameRate( 20 );
}
void draw()
{
  background( 204 );
  
  draw25Faces();
  
  update();
}

void draw25Faces()
{
  // 口の開き具合 0~1
  float fMouthOpenCos = ( 1 + cos( radians( iMouthDeg ) ) )/2.0;
  float fMouthOpenSin = ( 1 + sin( radians( iMouthDeg ) ) )/2.0;
  
  // 顔を並べて描画
  translate( 40, 40 );
  for( int iFace=0; iFace < 25; iFace++ )
  {
    int iColumn = iFace % 5;
    int iRow    = iFace / 5;
    float fMouthOpen = 0.0;
    
    // 口の開き具合(cos,sin)どちらの値を使うか
    if( iRow % 2 == 0 )
    {
      fMouthOpen = fMouthOpenCos;
    }
    else
    {
      fMouthOpen = fMouthOpenSin;
    }
    // 顔の描画
    drawFace( 80 * iColumn, 80 * iRow, fMouthOpen );
  }
}

// fMouthOpen：0~1
void drawFace( float fX, float fY, float fMouthOpen )
{
  pushMatrix();
  
  stroke( 0 );
  fill( 255 );
  circle( fX, fY, 80 );  // 輪郭
  
  fill( 0 );
  circle( fX - 16, fY - 20, 8 );// 目
  circle( fX + 16, fY - 20, 8 );
  
  //   位置調整のため，細かい数値が入っています．
  float fBeginDeg = 60 - 60 * fMouthOpen;
  float fEndDeg = 120 + 60 * fMouthOpen;
  float fMouthY = fY - 10 + 16 * fMouthOpen;
  float fMouthWidth = 40 - 20 * fMouthOpen;
  
  // 口の描画
  fill( 255, 0, 0 );
  arc( fX, fMouthY, fMouthWidth, 30, radians( fBeginDeg ), radians( fEndDeg ), CHORD );
  
  popMatrix();
}

void update()
{
  iMouthDeg += 4;
  if( iMouthDeg > 360 )
  {
    iMouthDeg-= 360;
  }
}
