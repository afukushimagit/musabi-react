void setup()
{
  size(1000, 1000);
  background(0);
  smooth();
  frameRate(1);
}



void draw()
{
  translate(width/2, height/2); // 原点を画面の中心に移動

  noStroke();//画面をリセット
  fill(0, 1);
  rect(-500, -500, 1000, 1000);

  float s = second();//秒数を取得
  float m = minute();//分
  float h = hour();//時間


  //それぞれの針に対応するオブジェクトを描画する
  pushMatrix();

  //時対応の円
  rotate(radians(h*(360/12)));//時針が動く角度
  rotate(radians(165));//12時方向スタート
  stroke(255);
  circle(10, 10, 30);

  popMatrix();



  //分対応の四角形
  pushMatrix();

  rotate(radians(m*(360/60)));//分針が動く角度
  rotate(radians(165));//12時方向スタート
  quad(30, 30, 50, 40, 70, 70, 40, 50);

  popMatrix();


  //秒対応
  pushMatrix();

  rotate(radians(s*(360/60)));//秒針が動く角度
  rotate(radians(225));//12時方向スタート
  rect(80, 80, 80, 80);
  quad(180, 180, 200, 210, 320, 320, 210, 200);
  point(170, 170);

  popMatrix();
}
