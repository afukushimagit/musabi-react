/**
再帰の木からプリント回路のような模様を連想して目指した。
回路の縦横斜めと流れを変える規則性と不規則性が混じった性質が再帰に適しているのではないかと考えた。
加算によって四つ角→その間→中央という順に密度と明度が減り、建造物のような奥行き感や一本ごとの重なりを表した。
*/
float R;
float X;
void setup()
{
  background(0);
  strokeWeight(2);
  stroke(93, 187, 173);
  blendMode(SCREEN);
  size( 1000, 1000 );
  translate(500, 500);
  rectMode(CENTER);
  //無理矢理四方向から描画する
  for (int iX=-500; iX<500; iX+=random(1, 10))
  {
    Circuit( iX, -500, random(50, 100), -90, 3 );
  }
  rotate(radians(90));
  for (int iX=-500; iX<500; iX+=random(1, 10))
  {
    Circuit( iX, -500, random(50, 100), -90, 3 );
  }
  rotate(radians(90));
  for (int iX=-500; iX<500; iX+=random(1, 10))
  {
    Circuit( iX, -500, random(50, 100), -90, 3 );
  }
  rotate(radians(90));
  for (int iX=-500; iX<500; iX+=random(1, 10))
  {
    Circuit( iX, -500, random(50, 100), -90, 3 );
  }
}
void Circuit( float f1X, float f1Y, float fBer, float fR, int iLevel )
{
  float f2X = f1X ;
  float f2Y = f1Y + fBer;
  //再帰一回（直進→左右斜め→直進）の内、左右をランダムに決める
  X = random(2);
  if (X<=1)//左に折れる
  {
    float f3X = f2X - fBer/2 * cos(radians(45));
    float f3Y = f2Y + fBer/2 * cos(radians(45));
    float f4X = f3X;
    float f4Y = f3Y + fBer;
    line( f1X, f1Y, f2X, f2Y );
    line(f2X, f2Y, f3X, f3Y);
    line(f3X, f3Y, f4X, f4Y);
    if ( iLevel > 1 )
    {
      Circuit( f4X, f4Y, fBer * 0.5, fR, iLevel - 1 );
    } else
    {
      fill(0);
      circle(f4X, f4Y, 8);
    }
  } else //右に折れる
  {
    float f3X = f2X + fBer/2 * cos(radians(45));
    float f3Y = f2Y + fBer/2 * cos(radians(45));
    float f4X = f3X;
    float f4Y = f3Y + fBer;
    line( f1X, f1Y, f2X, f2Y );
    line(f2X, f2Y, f3X, f3Y);
    line(f3X, f3Y, f4X, f4Y);
    if ( iLevel > 1 )
    {
      Circuit( f4X, f4Y, fBer * 0.5, fR, iLevel - 1 );
    } else
    {
      fill(0);
      circle(f4X, f4Y, 8);
    }
  }
}
