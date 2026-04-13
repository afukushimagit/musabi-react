//光を描画する関数。奇数秒と偶数秒で描画される光の直径が異なる。


void drawlight()
{
  pushMatrix();
  translate(100, 100);
  scale(0.8);
  blendMode(ADD);
  for (float i=0; i<=3; i++)
  {
    fill(239, 212, 139, 30);
    circle(250, 350, i*5);
  }

  if (secondCurrent%2==0)
  {
    for (float i=0; i<=8; i++)
    {
      fill(239, 212, 139, 30);
      circle(250, 340, i*15);
    }
  }
  if (secondCurrent%2==1)
  {
    for (float i=0; i<=10; i++)
    {
      fill(239, 212, 139, 30);
      circle(250, 340, i*15);
    }
  }

  blendMode(BLEND);
  popMatrix();
}
