size(500, 500);
colorMode(RGB, 255, 255, 255, 100);
background(0, 0, 0);
int a =30;//六角形小の辺
float b =15*sqrt(3);//高さ
int c =60;//六角形大の辺
float d =30*sqrt(3);//高さ
for (int y=0; y<530; y+=a)//重なるようずらす
{
  for (int x=0; x<=530; x+=d)
  {
    strokeWeight(random(1, 2));//線太さ
    stroke(250, 250, 250, 100);//白線
    quad(0+x, 0+y, b+x, -15+y, d+x, 0+y, b+x, 15+y);
    line(0+x, 0+y, 0+x, a+y);
    line(b+x, -15+y, b+x, 15+y);
    noStroke();
    fill(random(0, 240), random(0, 40), random(0, 30), 80);//赤寄りランダム
    beginShape();//六角形小
    vertex(0+x, 0+y);
    vertex(b+x, -15+y);
    vertex((2*b)+x, 0+y);
    vertex((2*b)+x, a+y);
    vertex(b+x, 45+y);
    vertex(0+x, a+y);
    endShape(CLOSE);
  }
}
translate(-b, 15);//六角形小と交互にする
for (int t=0; t<530; t+=60)
{
  for (int p=0; p<=530; p+=(4*b)-1.5)//六角形と位置がずれるため微調整
  {
    fill(random(0, 0), random(30, 50), random(90, 120), random(0, 60));
    beginShape();//六角形大
    vertex(0+p, 0+t);
    vertex(d+p, -30+t);
    vertex((2*d)+p, 0+t);
    vertex((2*d)+p, c+t);
    vertex(d+p, 90+t);
    vertex(0+p, c+t);
    endShape(CLOSE);
  }
}
