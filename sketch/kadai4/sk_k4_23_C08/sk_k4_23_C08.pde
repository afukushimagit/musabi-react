/**
再帰を利用して地形図を作成した。
ランダムの数値を利用することによって島の細かい位置や全体の形が変化するように工夫した。
繰り返すごとに一つの島の後にそれより小さいサイズの島が増える。
また、海岸線もランダムに変化し、海岸と島の様々な地形を何度も作り出せる。
*/
void setup()
{
  size( 1000, 1000 );
  background(0, 97, 146);
  for (int i= 0; i<1001; i++)
  {
    stroke(0, 200-i/20, 200+i/20);
    line(0, i+100, width, i+100);
  }
  kaigan();    //海岸線

  island(80, 500, 300, 3);
  island(320, 400, 200, 3);
  island(510, 300, 300, 3);
  island(680, 400, 300, 3);
  island(880, 500, 200, 3);
}

void kaigan()
{
  fill(50, 200, 140);
  strokeWeight(10);
  stroke(230, 230, 160);
  strokeJoin(ROUND);
  beginShape();    //リアス式海岸
  vertex(-50, -50);
  for (int iX = 0; iX <1200; iX += 30)
  {
    vertex(iX, random((iX-500)/30*(iX-500)/30+250, (iX-500)/30*(iX-500)/30+300));
  }
  vertex(1000, -50);
  endShape(CLOSE);
  for (int i= 0; i<200; i++)
  {
    strokeWeight(1);
    stroke(i/4, 100+i/2, 100+i/5);
    line(0, i, width, i);
  }
}

void island(float sX, float sY, float iSize, int iLevel)
{
  fill(50, 200, 140);
  strokeWeight(3+iLevel);
  stroke(230, 230, 160);
  strokeJoin(ROUND);
  beginShape();
  float lilisland = iSize/3;
  vertex(sX+lilisland/4, sY+lilisland/4);
  vertex(random(sX+lilisland/3, sX+lilisland), random(sY, sY+lilisland/4));
  vertex(sX+lilisland, random(sY+lilisland/3, sY+lilisland));
  vertex(random(sX+lilisland/3, sX+lilisland), sY+lilisland);
  vertex(random(sX, sX+lilisland/4), sY+lilisland);
  vertex(sX, random(sY, sY+lilisland));
  vertex(sX+lilisland/4, sY+lilisland/4);
  endShape(CLOSE);

  if (iLevel>1)
  {
    island(random(sX-sX/4, sX), random(sY+iSize/3, sY+5*iSize/4), iSize/2, iLevel-1);
    island(random(sX+iSize/4, sX+iSize/2), random(sY+iSize/3, sY+5*iSize/4), iSize/2, iLevel-1);
  }
}
