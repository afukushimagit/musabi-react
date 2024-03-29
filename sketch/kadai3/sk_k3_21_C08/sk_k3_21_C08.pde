float preSec = 0;//前の秒　分　時を保存する
float preMinute = 0;
float preHour = 0;
int a=0 ;
int b=1;
int c=1;
void setup()
{
  size(500, 500);

  frameRate(60);
}

void draw()
{
  noStroke();
  background(255, 0, 250);
  float s = second();
  float m = minute();
  float h = hour();

  if (s != preSec)
  {
    a=0;
  }
  fill(random(150, 50), 200, random(100, 350));
  rect( 350, 500, 50, -(s*height/59) );//過ぎた秒の概念の積み重ね
  fill(250, 0, 100);
  rect( 250, 500, 50, -(m*height/59) );//過ぎた分の概念の積み重ね
  fill(300, 100, 0);
  rect( 150, 500, 50, -(h*height/23) );//過ぎた時の概念の積み重ね

  fill(random(150, 50), 200, random(100, 350));
  rect(350, a*height/59-(s*height/59), 50, height/59);
  preSec= s;//秒の概念の積み重ねる動作
  a++;

  if (m != preMinute)
  {
    b=0;
  }
  fill(250, 0, 100);
  rect(250, b*height/59-(m*height/59), 50, height/59);
  preMinute = m;
  b++;//分の概念の積み重ねる動作

  if (h != preHour)
  {
    c=0;
  }
  fill(300, 100, 0);
  rect(150, c*height/23-(h*height/23), 50, height/23);
  preHour= h;
  c++;//時の概念の積み重ねる動作
}
