/**************************************************************
集まりによる時計
工場のような、ベルトコンベアによって流されるモノが集積されて時間を表す様子を書いた
それぞれ1,60,3600で割る必要がある
 **************************************************************/
// === 'S'キーを押した時の出力画像名 ===
//  "K3_[クラス][番号]_[苗字].png"
String pngName = "K3_A12_fukushima.png";



int hourCurrent;    
int minuteCurrent;  
int secondCurrent;   
float deltaTime;      
float deltaTimePerSec; 
int isHourAnim = 0;    
int isMinuteAnim = 0;
int isSecondAnim = 0;

void setup() {
  size(1000, 1000);
  background(220);
  frameRate( 30 );
}

void draw() {
  background(220);
  updateTimePre();

  float laneqsquare = 40*deltaTimePerSec;

  //レーン描画
  for (int i = 0; i < toDrawlane.length; i++) {
    drawlane(toDrawlane[i][0], toDrawlane[i][1], toDrawlane[i][2]);
  }

  //テンプレート　1/4円
  //上下
  for (int i = 0; i < Qud.length; i++) {
    qCircle(40 * Qud[i][0] + 27, 40 * Qud[i][1] + laneqsquare, Qud[i][2], Qud[i][3]);
  }
  //下上
  for (int i = 0; i < Qdu.length; i++) {
    qCircle(40 * Qdu[i][0] + 15, 40 * Qdu[i][1] - laneqsquare - 5, Qdu[i][2], Qdu[i][3]);
  }
  //左右
  for (int i = 0; i < Qlr.length; i++) {
    qCircle(40 * Qlr[i][0] + laneqsquare, 40 * Qlr[i][1] - 27, Qlr[i][2], Qlr[i][3]);
  }
  //右左
  for (int i = 0; i < Qrl.length; i++) {
    qCircle(40 * Qrl[i][0] - laneqsquare + 3, 40 * Qrl[i][1] - 12, Qrl[i][2], Qrl[i][3]);
  }

  //テンプレート　半円
  //上下
  for (int i = 0; i < Hud.length; i++) {
    hCircle(40 * Hud[i][0] + 27, 40 * Hud[i][1] + laneqsquare + 10, Hud[i][2], Hud[i][3]);
  }
  //下上
  for (int i = 0; i < Hdu.length; i++) {
    hCircle(40 * Hdu[i][0] + 27, 40 * Hdu[i][1] - laneqsquare, Hdu[i][2], Hdu[i][3]);
  }

  //左右
  for (int i = 0; i < Hlr.length; i++) {
    hCircle(40 * Hlr[i][0] + 7 + laneqsquare, 40 * Hlr[i][1] + 15, Hlr[i][2], Hlr[i][3]);
  }

  //右左
  for (int i = 0; i < Hrl.length; i++) {
    hCircle(40 * Hrl[i][0] - laneqsquare - 5, 40 * Hrl[i][1] + 15, Hrl[i][2], Hrl[i][3]);
  }

  //テンプレート　円
  //上下
  for (int i = 0; i < Cud.length; i++) {
    cCircle(40 * Cud[i][0] + 20, 40 * Cud[i][1] + 10 + laneqsquare, Cud[i][2], Cud[i][3]);
  }
  //下上
  for (int i = 0; i < Cdu.length; i++) {
    cCircle(40 * Cdu[i][0] + 20, 40 * Cdu[i][1] - 5 - laneqsquare, Cdu[i][2], Cdu[i][3]);
  }
  //左右
  for (int i = 0; i < Clr.length; i++) {
    cCircle(40 * Clr[i][0] + laneqsquare, 40 * Clr[i][1] + 20, Clr[i][2], Clr[i][3]);
  }
  //右左
  for (int i = 0; i < Crl.length; i++) {
    cCircle(40 * Crl[i][0] - laneqsquare - 5, 40 * Crl[i][1] + 20, Crl[i][2], Crl[i][3]);
  }

  //３円
  //上下
  for (int i = 0; i < Ctud.length; i++) {
    ctCircle(40 * Ctud[i][0] + 20, 40 * Ctud[i][1] + 10 + laneqsquare ,Ctud[i][2]);
  }
  //左右
  for (int i = 0; i < Ctlr.length; i++) {
    ctCircle(40 * Ctlr[i][0] + 7 + laneqsquare, 40 * Ctlr[i][1] + 20 ,Ctlr[i][2]);
  }




  //レーン角描画
  for (int i = 0; i < toDrawklane.length; i++) {
    drawklane(toDrawklane[i][0], toDrawklane[i][1], toDrawklane[i][2]);
  }

  //正方形描画
  for (int i = 0; i < toDrawsquare.length; i++) {
    drawsquare(toDrawsquare[i][0], toDrawsquare[i][1], toDrawsquare[i][2], toDrawsquare[i][3]);
  }

  cCircle(810, 324, 3, 4);
  cCircle(370, 494, 3, 1);
  cCircle(370, 544, 3, 2);
  cCircle(370, 594, 3, 5);
  ctCircle(680, 834, 0);

  fill(0);
  textSize(50);
  textAlign(BASELINE);
  text("×", 850, 340);
  text("×", 400, 510);
  text("×", 400, 560);
  text("×", 400, 610);
  text("×", 720, 850);
  textAlign(CENTER);
  text(secondCurrent, 920, 340);
  text(60*minuteCurrent+secondCurrent, 490, 510);
  text(60*minuteCurrent+secondCurrent, 490, 560);
  text(60*minuteCurrent+secondCurrent, 490, 610);
  text(3600*hourCurrent+60*minuteCurrent+secondCurrent, 760, 900);
  noFill();



  // 時間をデバッグ表示（ 提出前に非表示にすること．）
  /*
  fill( 0 );
  textSize(20);
  text( hourCurrent + ":" + minuteCurrent + ":" + secondCurrent, 10, 20);
  text( "deltaTimePerSec: " + deltaTimePerSec, 10, 40);
  text( "deltaTime: " + deltaTime, 10, 60);
  */

  // === Time Update ===
  updateTimePost();
}

// 正方形描画
void drawsquare(int sqX, int sqY, int sqwiX, int sqhiY) {
  strokeWeight(2);
  stroke(100);
  fill(252);
  rectMode(CORNER);
  rect(sqX * 40, sqY * 40, sqwiX, sqhiY, 10);
}

// レーン描画
void drawlane(int laX, int laY, int laXY) {
  strokeWeight(2);
  stroke(100);
  fill(160);
  rectMode(RADIUS);
  //if横着
  int lawiX = (laXY == 0) ? 15 : 20;
  int lahiY = (laXY == 0) ? 20 : 15;
  rect(20 + laX * 40, 20 + laY * 40, lawiX, lahiY);
}

// レーン角描画
void drawklane(int lakX, int lakY, int anglek) {
  float baseX = lakX * 40;
  float baseY = lakY * 40;
  float angleK = (anglek-1) * 90;

  pushMatrix();
  translate(baseX, baseY);
  rotate(radians(angleK));
  if (anglek % 10 == 1) {
    translate(-baseX, -baseY);
  } else if (anglek % 10 == 2) {
    translate(-baseX+40, -baseY);
  } else if (anglek % 10 == 3) {
    translate(-baseX+40, -baseY-40);
  } else if (anglek % 10 == 4) {
    translate(-baseX, -baseY-40);
  }

  beginShape();
  fill(120);
  vertex(baseX - 35, baseY);
  for (float theta = PI; theta >= HALF_PI; theta -= 0.01) {
    float rA = 5;
    vertex(cos(theta) * rA + baseX, sin(theta) * rA + baseY );
  }
  for (float theta = HALF_PI; theta <= PI; theta += 0.01) {
    float rB = 35;
    vertex(cos(theta) * rB + baseX, sin(theta) * rB + baseY);
  }
  endShape();
  popMatrix();
}

//1/4円
void qCircle(float qCircleX, float qCircleY, int qCircleR, int qColor) {
  // 四分の一円を描画
  pushMatrix();
  translate(qCircleX, qCircleY);
  if (qCircleR % 10 == 1) {
    rotate(HALF_PI);
  } else if (qCircleR % 10 == 2) {
    rotate(PI);
  } else if (qCircleR % 10 == 3) {
    rotate(PI + HALF_PI);
  }
  if (qColor % 10 == 0) {
    fill(30, 150, 200);
  } else if (qColor % 10 == 1) {
    fill(30, 10, 200);
  } else if (qColor % 10 == 2) {
    fill(180, 60, 255);
  }
  noStroke();
  arc(0, 0, 25, 25, HALF_PI, PI);
  popMatrix();
}

//1/2円
void hCircle(float hCircleX, float hCircleY, int hCircleR, int hColor) {
  pushMatrix();
  translate(hCircleX, hCircleY);
  if (hCircleR % 10 == 1) {
    rotate(HALF_PI);
  } else if (hCircleR % 10 == 2) {
    rotate(PI);
  } else if (hCircleR % 10 == 3) {
    rotate(PI + HALF_PI);
  }
  noStroke();
  {
    if (hColor % 10 == 0) {
      fill(30, 150, 200);
    } else if (hColor % 10 == 1) {
      fill(10, 220, 180);
    } else if (hColor % 10 == 2) {
      fill(30, 150, 200);
    } else if (hColor % 10 == 3) {
      fill(180, 60, 255);
    } else if (hColor % 10 == 4) {
      fill(30, 10, 200);
    } else if (hColor % 10 == 5) {
      fill(30, 150, 200);
    }
    arc(0, 0, 25, 25, 0, PI / 2); // 0度から90度まで
    if (hColor % 10 == 0) {
      fill(30, 10, 200);
    } else if (hColor % 10 == 1) {
      fill(10, 220, 180);
    } else if (hColor % 10 == 2) {
      fill(30, 150, 200);
    } else if (hColor % 10 == 3) {
      fill(180, 60, 255);
    } else if (hColor % 10 == 4) {
      fill(30, 10, 200);
    } else if (hColor % 10 == 5) {
      fill(30, 150, 200);
    }
    arc(0, 0, 25, 25, PI / 2, PI); // 90度から180度まで
  }
  popMatrix();
}

//円
void cCircle(float cCircleX, float cCircleY, int cCircleR, int cColor) {
  pushMatrix();
  translate(cCircleX, cCircleY); 
  if (cCircleR % 10 == 1) {
    rotate(HALF_PI);
  } else if (cCircleR % 10 == 2) {
    rotate(PI);
  } else if (cCircleR % 10 == 3) {
    rotate(PI + HALF_PI);
  }
  noStroke();
  {
    if (cColor % 10 == 0) {
      fill(10, 220, 180);
    } else if (cColor % 10 == 1) {
      fill(30, 150, 200);
    } else if (cColor % 10 == 2) {
      fill(30, 10, 200);
    } else if (cColor % 10 == 3) {
      fill(30, 10, 200);
    } else if (cColor % 10 == 4) {
      fill(180, 60, 255);
    } else if (cColor % 10 == 5) {
      fill(180, 60, 255);
    }
    arc(0, 0, 25, 25, 0, PI / 2); // 0度から90度まで
    if (cColor % 10 == 0) {
      fill(10, 220, 180);
    } else if (cColor % 10 == 1) {
      fill(30, 150, 200);
    } else if (cColor % 10 == 2) {
      fill(30, 10, 200);
    } else if (cColor % 10 == 3) {
      fill(180, 60, 255);
    } else if (cColor % 10 == 4) {
      fill(30, 10, 200);
    } else if (cColor % 10 == 5) {
      fill(180, 60, 255);
    }
    arc(0, 0, 25, 25, PI / 2, PI); // 90度から180度まで
    if (cColor % 10 == 0) {
      fill(10, 220, 180);
    } else if (cColor % 10 == 1) {
      fill(30, 150, 200);
    } else if (cColor % 10 == 2) {
      fill(30, 10, 200);
    } else if (cColor % 10 == 3) {
      fill(180, 60, 255);
    } else if (cColor % 10 == 4) {
      fill(30, 10, 200);
    } else if (cColor % 10 == 5) {
      fill(180, 60, 255);
    }
    arc(0, 0, 25, 25, PI, PI + PI / 2); // 180度から270度まで
    if (cColor % 10 == 0) {
      fill(10, 220, 180);
    } else if (cColor % 10 == 1) {
      fill(30, 150, 200);
    } else if (cColor % 10 == 2) {
      fill(30, 10, 200);
    } else if (cColor % 10 == 3) {
      fill(30, 10, 200);
    } else if (cColor % 10 == 4) {
      fill(180, 60, 255);
    } else if (cColor % 10 == 5) {
      fill(180, 60, 255);
    }
    arc(0, 0, 25, 25, PI + PI / 2, 2 * PI); // 270度から360度まで
  }
  popMatrix();
}

//3円
void ctCircle(float ctx, float cty ,int ctr) {
  pushMatrix();
  translate(ctx, cty); 
  if (ctr % 10 == 1) {
    rotate(HALF_PI);
  } else if (ctr % 10 == 2) {
    rotate(PI);
  } else if (ctr % 10 == 3) {
    rotate(PI + HALF_PI);
  }
  translate(-ctx, -cty);
  noStroke();
  float radius = 8;
  float angle = TWO_PI / 3;

  float x1 = ctx + cos(0) * radius * 2/3;
  float y1 = cty + sin(0) * radius * 2/3;
  float x2 = ctx + cos(angle) * radius * 2/3;
  float y2 = cty + sin(angle) * radius * 2/3;
  float x3 = ctx + cos(2 * angle) * radius * 2/3;
  float y3 = cty + sin(2 * angle) * radius * 2/3;

  // 円1
  fill(180, 60, 255);
  ellipse(x1, y1, radius * 2, radius * 2);

  // 円2
  fill(30, 150, 200);
  ellipse(x2, y2, radius * 2, radius * 2);

  // 円3
  fill(30, 10, 200);
  ellipse(x3, y3, radius * 2, radius * 2);
  popMatrix();
}
