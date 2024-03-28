size(500, 500);
background(280, 280, 280);

int a=25;
float b=12.5;

pushMatrix();
translate(-a*2, -a*2);
for (int x=0; x<=600; x=x+a*4)
{
  for (int y=0; y<=600; y=y+a*4)
  {
    fill(random(10, 100), random(150, 200), y+200, a*2.5);
    strokeWeight(3);
    stroke(0, random(150, 200), y+200, a);
    //横並びのダイア５列
    quad(x+0, y+0,
      x+35, y+50,
      x+ 0, y+100,
      -35+x, y+50);
  }
}
popMatrix();

for (int x=0; x<=500; x=x+100)
{
  for (int y=0; y<=500; y=y+100)
  {
    fill(280, 280, 280, 50);
    stroke(y+80, 200, x+250, a*3);
    //アサガオの円
    ellipse(x, y, 100, 100);
    ellipse(x+a*2, y+a*2, 100, 100);
  }
}

for (int x=0; x<=500; x=x+100)
{
  for (int y=0; y<=500; y=y+100)
  {

    fill(0, y+100, x+200, 120);
    strokeWeight(1);
    stroke(0, x+200, y+200, a*3);

    //外側の十字架
    quad(x+0, y+0,
      x+15, y+a,
      x+ 0, y+a*2,
      -15+x, y+a);
    //12時方向
    quad(x+0, y+a*2,
      x+15, y+a*3,
      x+ 0, y+100,
      -15+x, y+a*3);
    //6時方向
    quad(x+0, y+50,
      x+a, y+35,
      x+a*2, y+a*2,
      25+x, y+65);
    //3時方向
    quad(-a*2+x, y+a*2,
      -a+x, y+35,
      x, y+a*2,
      -a+x, y+65);
    //9時方向

    //内側の十字架
    quad(x, y+12.5,
      x+7.5, y+a,
      x+ 0, y+a*2,
      -7.5+x, y+a);
    //12時方向
    quad(x+0, y+a*2,
      x+7.5, y+a*3,
      x+ 0, y+b*7,
      -7.5+x, y+a*3);
    //6時方向
    quad(x+0, y+50,
      x+a, y+b*3.4,
      x+a*1.5, y+a*2,
      25+x, y+b*4.6);
    //3時方向
    quad(-b*3+x, y+a*2,
      -a+x, y+b*3.4,
      x, y+a*2,
      -a+x, y+b*4.6);
    //9時方向
  }
}
