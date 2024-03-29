/**

12進数時計

*/
int xsize = 1000;
int ysize = 500;
float[] center = new float[2];
float[] goal = new float[2];
float[] brickSize = new float[2];
int i = 0;
int k = 0;
int n;
float angle;
float x;
float y;
float r;
float circleCenter[] = {xsize/5, xsize/2, xsize/5*4};
float circleRadius = 125;
String t;
float param;
boolean checked = false;
float divAmount[] = {12, 12};

int currentSec;
int formerSec = 0;
float second = 0;
float minute = 0;
float hour = 0;


void setup()
{
  size(1000, 500);
  frameRate( 60 );
  background(173, 157, 148);
  colorMode(RGB);

  //Defaultだと日本語が表示されないので...仕方なく...
  PFont font = createFont("游明朝 Light", 50);
  textFont(font);

  //print(PFont.list());
}

//---------------------------------Main---------------------------------//
void draw() { //Refresh, 極座標系で行う
  //連続的な秒数を取得
  getTimes();

  //画面初期化
  background(173, 157, 148);

  //背景の表示
  drawBackGround();

  //円の表示
  drawCircle(0);
  drawCircle(1);
  drawCircle(2);

  //seconds
  draw_seconds();
  draw_minutes();
  draw_hours();

}


//---------------------------------背景---------------------------------//
//レンガは1ブロックが画面サイズを縦24,横12(定義:divAmount)で割った大きさにする
void drawBackGround() {

  stroke(64, 18, 20, 20);

  brickSize[0] = xsize / divAmount[0];
  brickSize[1] = ysize / divAmount[1];

  for (i = 0; i< divAmount[0]; i++) {

    for (k=0; k< divAmount[1]; k++) {
      if (k % 2 == 1) {
        rect(i * brickSize[0] + brickSize[0]/2, k * brickSize[1], brickSize[0], brickSize[1]);
      } else {
        rect(i * brickSize[0], k * brickSize[1], brickSize[0], brickSize[1]);
      }
    }
  }
}


//---------------------------------秒数を連続的に変換---------------------------------//
void getTimes() {
  // 描画切り替わったときにsecondを初期化
  currentSec = second();
  if (currentSec != formerSec) {
    second = formerSec = currentSec;
  }
  
  //secondをframeRateごとに増加させる→1/n秒変数
  second += 1/frameRate;
  minute = minute() + second / 60;
  hour = hour() % 12 + minute / 60;

  //print( second + "\n");
}

//---------------------------------円の描画---------------------------------//
void drawCircle(int arg) {
  x = circleCenter[arg];
  y = ysize/2;
  //円
  fill(173, 157, 148, 100);
  circle(x, y, circleRadius*2);

  noFill();
  stroke(0, 0, 0);
  strokeWeight(0.75);
  circle(x, y, circleRadius*2);

  //五芒星
  stroke(255, 255, 255, 70);
  strokeWeight(2);
  r = circleRadius - 5;
  beginShape();
  for (i = 0; i < 5; i++) {
    vertex(x + r*cos(4 * PI * i/5 - PI/2), y + r*sin(4 * PI * i/5  - PI/2));
  }
  endShape(CLOSE);

  //時計の各パーツの表示
  textAlign(CENTER);
  switch(arg) {
  case 0:
    t = "Hours";
    break;
  case 1:
    t = "Minutes";
    break;
  case 2:
    t = "Seconds";
    break;
  }
  textSize(20);
  fill(255, 255, 255);
  text(t, x, y - circleRadius * 1.3);


  //数字の描画
  for (i = 0; i < 12; i++) {
    r = circleRadius * 1.1;
    angle = radians(30 * i - 90);
    goal[0] = x + (r * cos(angle));
    goal[1] = y + (r * sin(angle)) + 4;

    switch(i) {
    case 1:
      t = "I";
      break;
    case 2:
      t = "II";
      break;
    case 3:
      t = "III";
      break;
    case 4:
      t = "IV";
      break;
    case 5:
      t = "V";
      break;
    case 6:
      t = "VI";
      break;
    case 7:
      t = "VII";
      break;
    case 8:
      t = "VIII";
      break;
    case 9:
      t = "IX";
      break;
    case 10:
      t = "X";
      break;
    case 11:
      t = "XI";
      break;
    case 0:
      t = "XII";
      break;
    }
    textSize(15);
    text(t, goal[0], goal[1]);
  }

  noStroke();
  fill(95, 194, 103, 250);
  circle(xsize*0.412, ysize/5*4.305, 10);
  fill(207, 193, 87, 250);
  circle(xsize*0.412, ysize/5*4.455, 10);
  fill(209, 61, 66, 250);
  circle(xsize*0.412, ysize/5*4.6, 10);
  fill(0, 0, 0, 50);
  circle(xsize*0.557, ysize/5*4.455, 10);
  fill(255, 255, 255, 150);
  text("時刻の読み方→ \" (　 の数 - 1 )×12  +  (　 の数 - 1 ) \" 時 / 分 / 秒", xsize/2, ysize/5*4.5);
}



//軽量化はダルいのでやりません
//---------------------------------秒数の描画---------------------------------//
void draw_seconds() {

  //---------針の描画---------//
  //周期12
  x = circleCenter[2];
  y = ysize/2;
  r = circleRadius;
  angle = radians(30 * (second() % 12) - 90);
  goal[0] = x + (r * cos(angle));
  goal[1] = y + (r * sin(angle));

  stroke(0, 0, 0);
  strokeWeight(1);
  line(x, y, goal[0], goal[1]);

  //周期5
  r = circleRadius/3*2;
  angle = radians(6 * second - 90);
  goal[0] = x + (r * cos(angle));
  goal[1] = y + (r * sin(angle));

  stroke(100, 50, 50);
  strokeWeight(1);
  line(x, y, goal[0], goal[1]);

  //---------円点の描画---------//
  //周期12
  r = circleRadius * 0.9;
  noStroke();
  fill(0, 0, 0, 50);

  for (i = 0; i < (second() % 12 + 1); i++) {
    angle = radians(30 * i - 90);
    goal[0] = x + (r * cos(angle));
    goal[1] = y + (r * sin(angle));

    circle(goal[0], goal[1], 10);
  }
  noFill();

  //周期5
  r = circleRadius*0.6;
  noStroke();
  fill(95, 194, 103, 250);

  for (i = 0; i < (floor(second() / 12) + 1); i++) {
    angle = radians(72 * i - 90);
    goal[0] = x + (r * cos(angle));
    goal[1] = y + (r * sin(angle));

    circle(goal[0], goal[1], 15);
  }
  noFill();

  //---------背景の描画---------//
  r = circleRadius*2;
  fill(112,245,77, 40);
  noStroke();

  param = asin(1 - second / 30);
  //print(param + "\n");

  arc(x, y, r, r, param, PIE-param + 0.13, CHORD); //目視で0.13足して水平に修正しました 理由が謎です すみません...
  noFill();
}




//---------------------------------分数の描画---------------------------------//
void draw_minutes() {

  //---------針の描画---------//
  //周期12
  x = circleCenter[1];
  y = ysize/2;
  r = circleRadius;
  angle = radians(30 * (minute() % 12) - 90);
  goal[0] = x + (r * cos(angle));
  goal[1] = y + (r * sin(angle));

  stroke(0, 0, 0);
  strokeWeight(1);
  line(x, y, goal[0], goal[1]);

  //周期5
  r = circleRadius/3*2;
  n = (floor(minute() / 12));
  angle = radians(minute - 90);
  goal[0] = x + (r * cos(angle));
  goal[1] = y + (r * sin(angle));

  stroke(100, 50, 50);
  strokeWeight(1);
  line(x, y, goal[0], goal[1]);

  //---------円点の描画---------//
  //周期12
  r = circleRadius * 0.9;
  noStroke();
  fill(0, 0, 0, 50);

  for (i = 0; i < (minute() % 12 + 1); i++) {
    angle = radians(30 * i - 90);
    goal[0] = x + (r * cos(angle));
    goal[1] = y + (r * sin(angle));

    circle(goal[0], goal[1], 10);
  }
  noFill();

  //周期5
  r = circleRadius*0.6;
  noStroke();
  fill(207, 193, 87, 250);

  for (i = 0; i < (floor(minute() / 12) + 1); i++) {
    angle = radians(72 * i - 90);
    goal[0] = x + (r * cos(angle));
    goal[1] = y + (r * sin(angle));

    circle(goal[0], goal[1], 15);
  }
  noFill();

  //---------背景の描画---------//
  r = circleRadius*2;
  fill(212, 209, 59, 40);
  noStroke();

  param = asin(1 - minute / 30);

  arc(x, y, r, r, param, PIE-param + 0.13, CHORD);
  noFill();
}

//---------------------------------時数の描画---------------------------------//
void draw_hours() {

  //---------針の描画---------//
  //周期12
  x = circleCenter[0];
  y = ysize/2;
  r = circleRadius;
  angle = radians(30 * (hour() % 12) - 90);
  goal[0] = x + (r * cos(angle));
  goal[1] = y + (r * sin(angle));

  stroke(0, 0, 0);
  strokeWeight(1);
  line(x, y, goal[0], goal[1]);

  //周期2
  r = circleRadius/3*2;
  n = floor(hour() / 12);
  angle = radians(15 * hour - 90);
  goal[0] = x + (r * cos(angle));
  goal[1] = y + (r * sin(angle));

  stroke(100, 50, 50);
  strokeWeight(1);
  line(x, y, goal[0], goal[1]);

  //---------円点の描画---------//
  //周期12
  r = circleRadius * 0.9;
  noStroke();
  fill(0, 0, 0, 50);

  for (i = 0; i < (hour() % 12 + 1); i++) {
    angle = radians(30 * i - 90);
    goal[0] = x + (r * cos(angle));
    goal[1] = y + (r * sin(angle));

    circle(goal[0], goal[1], 10);
  }
  noFill();

  //周期2
  r = circleRadius*0.6;
  noStroke();
  fill(209, 61, 66, 250);

  for (i = 0; i < (floor(hour() / 6) + 1); i++) {
    angle = radians(180 * i - 90);
    goal[0] = x + (r * cos(angle));
    goal[1] = y + (r * sin(angle));

    circle(goal[0], goal[1], 15);
  }
  noFill();

  //---------背景の描画---------//
  r = circleRadius*2;
  fill(209, 61, 66, 20);
  noStroke();

  param = asin(1 - hour / 12);

  arc(x, y, r, r, param, PIE-param + 0.13, CHORD);
  noFill();
}
