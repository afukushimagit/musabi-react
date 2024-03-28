size(500, 500);
background(30);
stroke(240, 100);
strokeWeight(0.1);
noFill();
float r = 100;
float centx= width/2;
float centy= height/2;
float x, y;
float a, b, c, d, e, f;
float a2, b2, c2, d2, e2, f2;
float a3, b3, c3, d3, e3, f3;
for (float ang2 = 0; ang2 < 360; ang2 = ang2 + 360 / 12)
{
  for (float ang= 0; ang< 360; ang= ang+ 3)
  {
    float rad = radians(ang); //角度をラジアンに変換する
    float rad2 = radians(ang2);
    x = centx+ (r * cos(rad))*1.3;
    y = centy+ (r * sin(rad))*1.3;
    /*
    ↓の図形を円形に回転させて花びら的なものを作る
     bezier(centx, height*0.2, x-cos(rad)*70, y-sin(rad)*70-30, x-cos(rad)*50, y-sin(rad)*50-50, centx, centy);
     bezier(centx, 0, x-cos(rad)*50, y-sin(rad)*50-60, x-cos(rad)*20, y-sin(rad)*20-80, centx, centy);
     bezier(centx, height*-0.5, x, y-110, x-cos(rad)*-30, y-sin(rad)*-30-130, centx, centy);
     */
    a3 = centx+ height * cos(rad2-45);
    b3 = centy+ height * sin(rad2-45);
    c3 = x + 110 * cos(rad2);
    d3 = y + 110 * sin(rad2);
    e3 = x -cos(rad) * -30 + 130 * cos(rad2);
    f3 = y -sin(rad) * -30 + 130 * sin(rad2);
    bezier(a3, b3, c3, d3, e3, f3, centx, centy); //図形(大)
    a2 = centx+ height * 0.5 * cos(rad2 + 11.25);
    b2 = centy+ height * 0.5 * sin(rad2 +11.25);
    c2 = x -cos(rad) * 50 + 60 * cos(rad2);
    d2 = y -sin(rad) * 50 + 60 * sin(rad2);
    e2 = x -cos(rad) * 20 + 80 * cos(rad2);
    f2 = y -sin(rad) * 20 + 80 * sin(rad2);
    bezier(a2, b2, c2, d2, e2, f2, centx, centy);//図形(中)
    a = centx+ height * 0.3 * cos(rad2);
    //先端が中心(centx,centy)からheight*0.3離れて回転
    b = centy+ height * 0.3 * sin(rad2);
    c = x -cos(rad) * 70 + 30 * cos(rad2);
    d = y -sin(rad) * 70 + 30 * sin(rad2);
    e = x -cos(rad) * 50 + 50 * cos(rad2);
    f = y -sin(rad) * 50 + 50 * sin(rad2);
    bezier(a, b, c, d, e, f, centx, centy); //図形(小)
  }
}
