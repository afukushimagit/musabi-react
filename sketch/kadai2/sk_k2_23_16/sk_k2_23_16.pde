size(500, 500);
background(2, 40, 89); /* #022859, 濃紺 */
noStroke();
ellipseMode(CENTER);
rectMode(CENTER);

/* 4種の螺旋曲線を重ね合わせ、点を1つ描画するたびに原点周りの回転を施す  */

blendMode(ADD); /* 加算方式による混色 */
translate(width/2, height/2);
float theta = 0;

for (int i=0; i<2000; i++) {

  rotate(PI/16);
  fill(2, 40, 89, 45); /* #022859, 背景と同色、薄い */
  square(pow(theta, 2)*cos(theta), pow(theta, 2)*sin(theta), 10);

  rotate(PI/5);
  fill(217, 39, 39, 125); /* #d92727, 朱色、半透明 */
  square(pow(theta, 2)*cos(theta), pow(theta, 2)*sin(theta), 5);

  rotate(PI/7);
  fill(242, 25, 75, 25); /* #f2194b, 紅色、薄い */
  square(pow(theta, 2)*cos(theta), pow(theta, 2)*sin(theta), 20);

  rotate(PI/3);
  fill(124, 108, 46, 175); /* #7c6c2e, 黄土色、半透明 */
  circle(pow(theta, 5)*cos(theta)/5, pow(theta, 5)*sin(theta)/5, 5);

  theta += 0.01;
}
