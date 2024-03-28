void setup()
{
  size(500, 500);
  colorMode(RGB);
  noStroke();
  frameRate(30);
}

void  draw()
{

  background(255, 120, 100);
  int d = second();
  int m = minute();
  int y = hour();


  //午後
  fill(53, 62, 87);
  rect(0, 250, 500, 250);


  //秒：鳥（画面を横にに60分割）
  fill(53, 62, 87);
  ellipse(d*8.3-50, 50, 80, 80);
  ellipse(d*8.3, 50, 25, 5);
  ellipse(d*8.3-12, 50, 30, 20);
  fill(255, 120, 100);
  ellipse(d*8.3-80, 50, 80, 80);
  fill(53, 62, 87);
  ellipse(d*8.3-40, 50, 50, 20);
  fill(255, 120, 100);
  ellipse(d*8.3-60, 50, 25, 5);


  //時間：太陽（画面を縦に２４分割、午前午後で色が変わる）
  if (y*20>250)
  {
    fill(255, 120, 100);
  }
  else
  {
    fill(53, 62, 87);
  }
  ellipse(250, y*20.8, 80, 80);


  //分：ヨット（画面を横にに60分割）
  fill(53, 62, 87);
  triangle(m*8.3-40, 235, m*8.3, 235, m*8.3, 150);
  triangle(m*8.3+5, 235, m*8.3+35, 235, m*8.3+5, 160);
  triangle(m*8.3-45, 240, m*8.3, 270, m*8.3+40, 240);
}
