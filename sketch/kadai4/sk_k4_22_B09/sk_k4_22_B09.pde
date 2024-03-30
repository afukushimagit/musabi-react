/**
ブルーベリーの木をモチーフに、再帰的な表現を試みた.
授業の演習にもあったように植物の構造は繰り返しでできているため、
そこから更に発展して枝のほかに実と葉を再現しようと思った。
再帰した際、ブルーベリーがただの紫色の円に見えないように実の中央に蔕を描画した。
低木特有の、塊に近い形状を再現するために密度を下方に集中させ、
主幹ができる限り目立たないようにした。
*/
void setup()
{
  size( 1000, 1000);
  noLoop();
}

void draw()
{
  background(220, 220, 230);
  strokeWeight(10);

  for ( int i=-300; i<=400; i+=80 )
  {
    pushMatrix();
    translate( width/2, 1150);
    branch(0);
    popMatrix();
  }
  save("sk_k4_22_B09.png");
}

//枝と茎
void branch( int stem )
{
  if ( stem < 9 )
  {
    stroke( 70, 64, 50 );
    line( 3, 3, 2, -height/5 );
    {
      translate( 0, -height/12 );
      rotate( random( -0.1, 0.1 ) );
      
      if( random(2.3)<1.1 )
      {
        rotate( 0.3 );
        scale( 0.72 );
        pushMatrix();
        branch( stem+1 );
        popMatrix();
        rotate( -0.7 );
        pushMatrix();
        branch( stem+1);
        popMatrix();
      }
      else
      {
        branch( stem );
      }
    }
  }
  else
  {
    //葉
    stroke(75, 100, 40);
    fill(70, 140, 65);
    ellipse(100, 500, random(500, 100), random(170, 50));

    //ブルーベリー1​
    noStroke();
    fill( 100, 0, 220 );
    ellipse( 0, 0, random(120, 100), random(100, 100) );
    stroke(0);
    
    //ブルーベリー2​
    noStroke();
    fill( 130, 0, 220 );
    ellipse( 70, 30, random(100, 100), random(100, 100) );
    stroke(0);
    
    //ブルーベリーの蔕1​
    fill(10, 100, 220);
    ellipse( 0, 0, random(10, 10), random(10, 10) );
    
    //ブルーベリーの蔕2​
    fill(10, 100, 220);
    ellipse( 70, 30, random(10, 10), random(10, 10) ); 
  }
}

//マウスクリックで描画​
void mousePressed()
{
  redraw();
}
