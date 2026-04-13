
//一時間おきに増える蝋燭の位置制御。手前と奥の空間を出すため、奥のほうが少し小さく描画される。

void hAnim()
{
  if (ih>=0)
  {
    pushMatrix();
    scale(0.65);
    translate(80, -70);
    candle();
    popMatrix();
  }

  if (ih>=1)
  {
    pushMatrix();
    scale(0.65);
    translate(255, -70);
    candle();
    popMatrix();
  }

  if (ih>=2)
  {
    pushMatrix();
    scale(0.7);
    translate(-100, -60);
    candle();
    popMatrix();
  }

  if (ih>=3)
  {
    pushMatrix();
    scale(0.7);
    translate(360, -60);
    candle();
    popMatrix();
  }

  if (ih>=4)
  {
    pushMatrix();
    scale(0.7);
    translate(-220, 10);
    candle();
    popMatrix();
  }

  if (ih>=5)
  {
    pushMatrix();
    scale(0.75);
    translate(430, -30);
    candle();
    popMatrix();
  }

  if (ih>=6)
  {
    pushMatrix();
    scale(0.8);
    translate(-210, 15);
    candle();
    popMatrix();
  }

  if (ih>=7)
  {
    pushMatrix();
    scale(0.8);
    translate(360, 8);
    candle();
    popMatrix();
  }

  if (ih>=8)
  {
    pushMatrix();
    scale(0.85);
    translate(-170, 60);
    candle();
    popMatrix();
  }

  if (ih>=9)
  {
    pushMatrix();
    scale(0.85);
    translate(280, 50);
    candle();
    popMatrix();
  }

  if (ih>=10)
  {
    pushMatrix();
    scale(0.9);
    translate(-52, 70);
    candle();
    popMatrix();
  }

  if (ih>=11)
  {
    pushMatrix();
    scale(0.9);
    translate(120, 70);
    candle();
    popMatrix();
  }
}
