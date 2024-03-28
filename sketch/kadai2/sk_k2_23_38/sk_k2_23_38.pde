//教会のステンドグラスをモチーフに、ランダムに変化する色鮮やかな背景と光の花弁を表現した。
size(500, 500);

background(0);//背景を黒に

blendMode(DIFFERENCE);//差の絶対値
for (int iX = 0; iX<170; iX++ )//背景の模様や色彩をランダム生成
{

  colorMode(HSB);//カラーモードをHSBに
  fill(random(360), 150, 300);
  rect(random(500), random(500), random(1, 300), random(1, 200));//ランダム長方形
  circle(random(500), random(500), random(3, 250));//ランダム円
  ellipse(random(500), random(500), random(1, 500), random(1, 500));//ランダム楕円
}

translate(250, 250);//基準を中心に
noFill();
strokeWeight(30);
for (int iLy=0; iLy<500; iLy++)//中心から放射状に伸びる罫線
{
  stroke(255);
  line(0, iLy, 0, 200);
  rotate(radians(36));
  rotate(radians(-18));
  strokeWeight(5);
  circle(0, 0, 150);//中心円と外輪
}

for ( int iCircle = 0; iCircle < 8; iCircle++ )//外周の花弁のような曲線
{
  strokeWeight(9);
  stroke(255);
  rotate(radians(45));
  circle(190, 0, 300);
}
