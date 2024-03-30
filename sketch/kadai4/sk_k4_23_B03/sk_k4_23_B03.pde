/**
ほこりをテーマに作品を作成した。
さまざまな色の糸くずが集まって離れてみると灰色に見えるほこりの性質を再現した。
ほこりであることに納得を持たせるために床のフローリングも生成した。
生成し直すたびに床の模様が変化する点にこだわった。
*/
void setup()
{
  size( 1000, 1000 );
  noLoop();
}

void draw()
{
  //床を描写
  for( int iF = 0; iF < 1000; iF += 200 )
  {
    Floor( iF, random(-600,-200), 600, 4 );
  }
  //ホコリを描写
  for( int iD = 0; iD < 50; iD ++ )
  {
    Dust( random( 1000 ), random( 1000 ), random( 3, 5 ), 12 );
  }
  save("sk_k4_23_B03.png");
}

void Dust( float BeginX, float BeginY, float nagasa, int iLevel )
{
  strokeWeight( 0.01 );  //ホコリの糸くずは細く
  stroke( random( 255 ), random( 255 ), random( 255 ) );  //ホコリの糸くず一本一本はカラフルに
  
  float EndX = BeginX + nagasa * random( -20, 20 );
  float EndY = BeginY + nagasa * random( -20, 20 );
  
  line( BeginX, BeginY, EndX, EndY );
  
  if( iLevel > 1 )
  {
    Dust( EndX, EndY, nagasa * 0.8, iLevel - 1 );
    Dust( EndX, EndY, nagasa * 0.8, iLevel - 1 );
  }
}

void Floor( float hidariueX, float hidariueY, float nagasa, int iLevel )
{
  rectMode(CORNERS); 
  strokeWeight( 0.8 );
  stroke(36, 22, 22);
  fill( random( 55,65 ), random( 40  , 44 ), random( 27, 33 ) );  //フローリングの板材の色を変更
  
  float migisitaX = hidariueX + 200;  //フローリングの幅は200に固定
  float migisitaY = hidariueY + nagasa + random( -200, 200 );  //フローリングの長さをランダムに
  
  rect( hidariueX, hidariueY, migisitaX, migisitaY );
  
  if( iLevel > 1 )
  {
    Floor( hidariueX, migisitaY, 600, iLevel - 1 );
  }
}


void keyPressed()
{
  if( keyCode == UP )
  {
    save("kadaishashin.png");
  }
  else
  {
    redraw();
  }
}
