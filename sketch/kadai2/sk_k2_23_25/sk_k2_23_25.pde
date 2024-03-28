size(500, 500);
noStroke();
background(255);  //背景を白くする

for (int iX=-40; iX<600; iX+=40)  //画面端の処理のためあえてはみ出す
{
  for (int iY=-40; iY<600; iY+=40)  //画面端の処理のためあえてはみ出す
  {
    fill((iX+iY)% 200);
    //白くなりすぎないグラデーション
    square(iX, iY, 20);


    beginShape();
    //千鳥格子の1単位分を描く
    vertex(iX, iY);
    vertex(iX, iY-10);
    vertex(iX+10, iY);
    vertex(iX+20, iY);
    vertex(iX+40, iY+20);
    vertex(iX+30, iY+20);
    vertex(iX+20, iY+10);
    vertex(iX+20, iY+20);
    vertex(iX+10, iY+20);
    vertex(iX+20, iY+30);
    vertex(iX+20, iY+40);
    vertex(iX, iY+20);
    vertex(iX, iY+10);
    vertex(iX, iY+10);
    vertex(iX-10, iY);
    endShape(CLOSE);
  }
}
