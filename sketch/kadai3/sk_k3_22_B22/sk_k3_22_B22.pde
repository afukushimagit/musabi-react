/**真ん中の線がミリ秒を、中心から２本目の線が秒を、三本目の線が分を表している。
 四本目の線は１時間ごとにひとつずれる。*/
int ms, s, m, h;
int lastSecond = 0;
int iFrameCur;


void setup() {
  size(1000, 1000);
  iFrameCur = 0;
  frameRate(60);
  background(0);
}
void draw() {
  ms = millis() % 1000;
  s = second();
  m = minute();
  h = hour();


  fill(0, 4);
  noStroke();
  rect(0, 0, width, height);

  noFill();
  translate(width/2, height/2);

  pushMatrix();
  float ms_deg = 360 / 1000.0 * ms;//中心の線の回転の大きさ
  stroke(255);
  rotate( radians( ms_deg ) );
  line(0, 0, 0, height / 30);//中心からの距離
  popMatrix();

  pushMatrix();

  stroke(255);
  rotate( radians(s*(360/60)) );//二本目の線の回転の大きさ
  line(0, 80, 0, height/20);//中心からの距離
  popMatrix();

  pushMatrix();
  stroke(255);
  rotate( radians (m*(360/60)) );//三本目の線の回転の大きさ
  line(0, 160, 0, height / 10);//中心からの距離
  popMatrix();

  pushMatrix();
  stroke(255);
  rotate( radians(h*(360/12)));//四本目の線の回転の大きさ
  line(0, 200, 0, height / 3);//中心からの距離
  popMatrix();
}
//https://yoppa.org/proga10/1419.html https://yoppa.org/proga10/1429.htmlを参考に制作。
//時間を表す線を円形に配置し、差別化を図った。
