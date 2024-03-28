size(500, 500);
colorMode(RGB, 255);//カラーモード（RGB、500段階）
background(60, 128, 90);//背景 みどり

float X=0;//x軸に繰り返すための変数
float Y=30;//y軸に繰り返すための変数
float r=50;//基準となる円弧の直径
float kakudo=0;//角度の変数
float x=0;//渦巻きの中心x
float y=0;//渦巻きの中心y
float P=0;//y軸に繰り返した時のx軸のズレ

stroke(255);//線は白
strokeWeight(4);
noFill();

for (int iy=0; iy<6; iy++)//y軸の繰り返し
{
  for (int ix=0; ix<20; ix++)//x軸の繰り返し
  {
    x=X;
    y=Y;
    for (int  iu=0; iu<4; iu++)//渦巻き1
    {
      arc(x, y, r, r, radians( kakudo ), radians( kakudo +180 ), OPEN);
      x=x+(r/4)*cos(radians(kakudo));
      y=y+(r/4)*sin(radians(kakudo));
      kakudo=kakudo+180;
      r=r/2;
    }
    r=40;
    kakudo=kakudo+90;
    x=x+25*cos(radians(kakudo-45))+(r/2)*cos(radians(kakudo+20));
    y=y+25*sin(radians(kakudo-45))+(r/2)*sin(radians(kakudo));
    for (int  iu=0; iu<4; iu++)//渦巻き2
    {
      arc(x, y, r, r, radians( kakudo + 180 ), radians( kakudo + 360 ), OPEN);
      x=x+(r/4)*cos(radians(kakudo));
      y=y+(r/4)*sin(radians(kakudo));
      kakudo=kakudo+180;
      r=r/2;
    }
    r=20;
    kakudo=kakudo-90;
    x=x+20*cos(radians(kakudo))+(r/2)*cos(radians(kakudo));
    y=y+20*sin(radians(kakudo))+(r/2)*sin(radians(kakudo));
    for (int  iu=0; iu<4; iu++)//渦巻き3
    {
      arc(x, y, r, r, radians( kakudo + 180 ), radians( kakudo + 360 ), OPEN);
      x=x+(r/4)*cos(radians(kakudo));
      y=y+(r/4)*sin(radians(kakudo));
      kakudo=kakudo+180;
      r=r/2;
    }
    X=X+49.5;
    r=50;
    kakudo=kakudo+180;
  }
  P=P-40;
  X=P;
  Y=Y+110;
}
