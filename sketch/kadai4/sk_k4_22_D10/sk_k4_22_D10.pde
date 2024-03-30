/**
色々試した結果、花のような形になったため花をテーマに作品を作った。
主に花弁の形が変わり、周りの丸は花から飛び散る花粉を表している。
*/
void setup()
{
  size(1000, 1000);
  colorMode(RGB, 255);
  background(random(80), random(10), random(60));//背景
  blendMode( SCREEN );
  stroke(random(255), random(180), 200, 230);//色相
  noFill();
  translate(width/2, height/2);//座標
  Hana(0, 0, 400, 160, 5, 10);

  for (int g=40; g<=500; g++)
  {

    strokeWeight(0.7);
    beginShape();
    vertex(random(40), 40);
    vertex(70, 50);
    vertex(15, 85);
    vertex(random(120), 85);
    vertex(55, 115);
    vertex(85, random(120));
    endShape(CLOSE);//頭花
    rotate(radians(60));
  }
  
  save("sk_k4_22_D13.png");
}

void Hana(float fX, float fY, float fsize, float fWidth, float fHeight, int i)
{

  float fEndX = fX+fsize*cos(radians(fWidth)) ;
  float fEndY = fY+fsize*sin(radians(fWidth)) ;//終点座標

  strokeWeight(2);
  bezier( 200, 300, fX/2, fY/2, random(fWidth/2, i*5)-fX, random(fHeight/2, i/5)-fY, fsize+300, fsize+300); //花弁
  rotate(radians(80));

  ellipse(fX, fY, width/80, height/80);//花粉

  if (fsize>5)
  {
    Hana( fEndX, fEndY, fsize/2, fWidth*random(2.0), fHeight+20, i-1);
    Hana( fEndX, fEndY, fsize/2, fWidth*random(2.0), fHeight-30, i+1);
  }
}
