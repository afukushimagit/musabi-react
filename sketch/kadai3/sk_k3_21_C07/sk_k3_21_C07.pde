

void setup()
{
  size(400, 800);
  colorMode(RGB);
  background(79, 94, 117);
  frameRate(50);
  smooth();
}

void draw()
{
  float s = second();//秒数
  float m = minute();//分数
  float h = hour();//時間
  noStroke();

  if (s<59) {
    fill(200, 211, 221);
    circle( random(s*7), random(height), 0.5 + random(2) );
  } else {
    fill(79, 94, 117);
    rect(0, 0, 400, 1000);
  }
  // 星（左から右へ６０秒かけて増殖、５９秒でリセットのループ）

  fill(251, 203, 114);
  arc(h*16.7, 200, 100, 100, 200, 300);
  fill(79, 94, 117);
  circle(h*16.7+30, 180, 100 );//月(24時間かけて左から右へ移動)


  stroke(79, 94, 117);

  fill(45, 44, 45);
  rect(0, 400, 80, 400);
  rect(0, 350, 40, 50);
  rect(0, 200, 10, 150);
  //一番左のビル

  if (m<=5&& m>=0) {
    fill(251, 203, 114);
  } else {
    fill(251-random(51), 203+random(116), 114+random(107));
  }
  for (int a=0; a<50; a++)
    rect(-10, 430+a*35, 15, 15);//窓１、（5分ごとに窓の明かりが遷移する）

  if (m<=10&& m>5) {
    fill(251, 203, 114);
  } else {
    fill(251-random(51), 203+random(116), 114+random(107));
  }
  for (int a=0; a<50; a++)
    rect(10, 430+a*35, 15, 15);//窓２、１０分目

  if (m<=15&& m>10) {
    fill(251, 203, 114);
  } else {
    fill(251-random(51), 203+random(106), 114+random(107));
  }
  for (int a=0; a<50; a++)
    rect(30, 430+a*35, 15, 15);//窓３、１５分目

  if (m<=20 && m>15) {
    fill(251, 203, 114);
  } else {
    fill(251-random(51), 203+random(96), 114+random(107));
  }
  for (int a=0; a<50; a++)
    rect(50, 430+a*35, 15, 15);
  //窓４、２０分目

  fill(45, 44, 45);
  rect(80, 500, 20, 500);//隙間

  rect(100, 450, 100, 400);//左から２番目のビル

  if (m<=25&& m>20) {
    fill(251, 203, 114);
  } else {
    fill(251-random(51), 203+random(86), 114+random(107));
  }
  for (int a=0; a<50; a++)
    rect(123, 480+a*35, 15, 15);//窓５、２５分目

  if (m<=30&& m>25) {
    fill(251, 203, 114);
  } else {
    fill(251-random(51), 203+random(76), 114+random(107));
  }
  for (int a=0; a<50; a++)
    rect(143, 480+a*35, 15, 15);//窓６、３０分目

  if (m<=35&& m>30) {
    fill(251, 203, 114);
  } else {
    fill(251-random(51), 203+random(66), 114+random(107));
  }
  for (int a=0; a<50; a++)
    rect(163, 480+a*35, 15, 15);
  //窓７、３５分目

  fill(45, 44, 45);
  rect(200, 600, 25, 300);//隙間

  rect(225, 480, 130, 400);//右から２番目のビル
  fill(251, 203, 114);

  if (m<=40&& m>35) {
    fill(251, 203, 114);
  } else {
    fill(251-random(51), 203+random(56), 114+random(107));
  }
  rect(245, 500, 10, 400);//窓８、４０分目

  if (m<=45&& m>40) {
    fill(251, 203, 114);
  } else {
    fill(251-random(51), 203+random(45), 114+random(107));
  }
  rect(270, 500, 10, 400);//窓９、４５分目

  if (m<=50&& m>45) {
    fill(251, 203, 114);
  } else {
    fill(251-random(51), 203+random(36), 114+random(107));
  }
  rect(295, 500, 10, 400);//窓１０、５０分目

  if (m<=55&& m>50) {
    fill(251, 203, 114);
  } else {
    fill(251-random(51), 203+random(26), 114+random(107));
  }
  rect(320, 500, 10, 400);
  ;//窓１１、５５分目

  fill(45, 44, 45);
  rect(355, 350, 100, 450);//一番右のビル

  for (int a=0; a<3; a++) {
    for (int b=0; b<50; b++) {
      if (m<=59 && m>55) {
        fill(251, 203, 114);
      } else {
        fill(251-random(51), 203+random(18), 114+random(107));
      }
      rect(380+20*a, 380+b*40, 30, 15);
    }
  }//窓１２、最後
}
