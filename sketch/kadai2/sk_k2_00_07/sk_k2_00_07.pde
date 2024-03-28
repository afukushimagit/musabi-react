size(500, 500);
colorMode(RGB, 100);//RGB 100dankai
background(0);//black haikei
stroke(10, 55, 60);//green?
strokeWeight(2);
noFill();//sikakuno sendakenisuru
int a=15;
int c=4*a;
for (int y=-1; y<500; y++)
{
  for (int x=-2; x<500; x=x+2)
  {
    quad(c*x+0, c*y+40, c*x+20, c*y+10, c*x+60, c*y+10, c*x+40, c*y+40);//sikaku_a1
    quad(c*x+0, c*y+40, c*x+20, c*y+70, c*x+60, c*y+70, c*x+40, c*y+40);//sikaku_b1
    quad(c*x+60, c*y+10, c*x+100, c*y+10, c*x+120, c*y+-20, c*x+80, c*y+-20);//sikaku_a2
    quad(c*x+60, c*y+70, c*x+80, c*y+100, c*x+120, c*y+100, c*x+100, c*y+70);//sikaku_b2
    line(y*60, 0, y*60, 500);//tate
    line(c*x+0, c*y+40, c*x+60, c*y+10);//naname_ue
    line(c*x+0, c*y+40, c*x+60, c*y+70);//naname_sita
    line(c*x+60, c*y+10, c*x+120, c*y+-20);//naname_ue2
    line(c*x+60, c*y+70, c*x+120, c*y+100);//naname_sita2
  }
}
