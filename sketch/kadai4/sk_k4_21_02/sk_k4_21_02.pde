void setup()
{
  size( 1000, 1000 );
  noLoop();
}

void draw()
{
  fill( 250 );
  background( #dfe0e2 );  //背景色を明るいグレーに設定
  strokeWeight( 4 );  //線幅を4に設定

  for( int i=-300; i<=500; i+=80 )
  {
    pushMatrix();
    translate( 500, 1000 );
    flower(0);
    popMatrix();
  }
}

//カスミソウの茎
void flower( int stem )
{
  if( stem<11 )
  {
    stroke( 152, 174, 102 );
    line( 0, 0, 0, -height/10 );
    {
      translate( 0, -height/15 );
      rotate( random( -0.1, 0.1 ) );

      if( random( 1.0 )<0.4 )
      {  
        rotate( 0.4 );
        scale( 0.7 );
        pushMatrix();
        flower( stem+1 );
        popMatrix();
        rotate( -0.6 );
        pushMatrix();
        flower( stem+1 );
        popMatrix();
      }
      else
      {
        flower( stem );
      }
    }
  }
  
//カスミソウの花弁
  else
  {
    //花弁１
    noStroke();
    fill( 250, 250, 239 );
    ellipse( 0, 0, random(100,300), random(100,300) );
    stroke( 255 );
  
    //花弁２
    fill( 247, 243, 237 );
    ellipse( 30, 60, random(70,90), random(70,90) );
    
    //花弁３
    fill( 249, 247, 239 );
    ellipse( 100, 100, random(60,80), random(60,80) );
    
    //花弁４
    fill( 250, 249, 254 );
    ellipse( 500, 500, random(100,120), random(100,120) );
    
    //花弁５
    fill( 232, 228, 222 );
    ellipse( 900, 500, random(30,50), random(30,50) );
  }
}
