
void candle()
{

  //size(600, 800);
  //background(10, 16, 43);

  pushMatrix();

  blendMode(BLEND);

  translate(100, 100);  //作った後に思いの外大きかったので調整
  scale(0.8);

  //燭台
  fill(15, 31, 58);
  stroke(159, 131, 53);
  strokeWeight(2);
  ellipse(250, 622, 150, 25);

  noStroke();
  fill(159, 131, 53);
  ellipse(250, 575, 45, 15);

  rect(238, 550, 25, 50);

  ellipse(250, 595, 65, 15);

  quad(240, 550, 230, 630, 270, 630, 260, 550);

  ellipse(250, 630, 40, 15);

  noFill();
  stroke(10, 16, 43);
  strokeWeight(2);
  bezier(175, 621.5, 200, 636.5, 300, 636.5, 325, 620);

  fill(159, 131, 53);
  beginShape();
  vertex(175, 623);
  bezierVertex(200, 639.5, 300, 639.5, 325, 623);
  bezierVertex(325, 670, 175, 670, 175, 623);
  endShape();

  //取手
  //noFill();
  stroke(159, 131, 53);
  strokeWeight(2);
  beginShape();
  vertex(270, 600);
  vertex(290, 600);
  bezierVertex(330, 570, 335, 580, 345, 590);

  vertex(360, 610);
  bezierVertex(370, 630, 300, 650, 300, 640);

  //vertex(323,625);

  bezierVertex(300, 650, 378, 640, 377, 610);
  vertex(362, 590);

  bezierVertex(345, 570, 330, 570, 300, 593);
  vertex(298, 595);
  vertex(270, 598);
  vertex(270, 600);

  endShape();

  //蝋燭
  noStroke();
  fill(231, 218, 203);
  rect(235, 375, 30, 200, 5);


  //炎

  fill(220, 164, 80);
  beginShape();
  vertex(250, 300);
  bezierVertex(230, 340, 230, 360, 250, 370);
  bezierVertex(270, 360, 270, 340, 250, 300);
  endShape();

  popMatrix();


//蝋燭が１秒毎に明滅するアニメーション
  if ( secondCurrent != secondPrev )
  {
    isSecondAnim = 1;  // アニメーション開始
    isSecondFrame = 400;

    // アニメーション初期化
  }
  if ( isSecondAnim == 1 )  // アニメーション中
  {
    // アニメーション中の処理を記述

    if ( isSecondFrame > 0)
    {
      drawlight();
      isSecondFrame --;
    } else
    {
      isSecondAnim = 0;
    }

    // アニメーション終了
  }
}
