/*
時間経過により回転する歯車
歯車同士がかみ合うことにより、秒針も回転する（ように見えるように作成）
*/


int[] iQ = {0,-100};//歯車の歯の位置
int[] iC = {255,200,120,70};//色

void setup()
{
size(770,600);
frameRate(60);
}


void draw()
{
  translate(width/2,height/2);//初期位置(ここで全体の位置調整が出来る)
  background(iC[1]);
  
  //秒を表す歯車
  pushMatrix();//位置を保存  
  translate(210,-180);
  sDeg2();
  scale(0.5);
  Haguruma1();
  popMatrix();//位置をリセット
  
  //秒の歯車と嚙み合う歯車
  pushMatrix();//位置を保存  
  translate(250,-70);
  sDeg1_2();
  scale(0.5);
  Haguruma1();
  popMatrix();//位置をリセット

  //分の調整歯車
  pushMatrix();//位置を保存 
  translate(108,-50); 
  sDeg2();
  rotate(radians(6));
  scale(0.7);
  Haguruma2();
  popMatrix();//位置をリセット
  
  //分の歯車
  pushMatrix();//位置を保存 
  translate(245,100);
  rotate(radians(10));//かみ合うように角度調整
  sDeg2();
  scale(0.9);
  Haguruma2();
  popMatrix();//位置をリセット
  
  //分の歯車 + 時の歯車
  pushMatrix();//位置を保存 
  translate(245,98);
  rotate(radians(10));
  sDeg1_3();
  scale(0.79);
  Haguruma3();
  popMatrix();//位置をリセット
  
  
  //時の調整歯車
  pushMatrix();//位置を保存 
  translate(10,130);
 rotate(radians(10));
  sDeg1_2();
  scale(1);
  Haguruma3();
  popMatrix();//位置をリセット
  
  //時の歯車
  pushMatrix();//位置を保存 
  translate(-180,-80);
  rotate(radians(10));
  sDeg2();
  scale(1.4);
  Haguruma3();
  popMatrix();//位置をリセット
  
  //時の歯車 + 分の歯車
  pushMatrix();//位置を保存 
  translate(-180,-80);   
  scale(1.1);
  sDeg1_4();
  Haguruma2();
  popMatrix();//位置をリセット
  
  //秒針
  pushMatrix();//位置を保存  
  translate(210,-180);
  sDeg1();
  scale(0.5);
  Hari1();
  popMatrix();//位置をリセット
  
  //分針
  pushMatrix();//位置を保存  
  translate(245,98);
  mDeg();
  scale(0.9);
  Hari1();
  popMatrix();//位置をリセット
   
  //時針
  pushMatrix();//位置を保存  
  translate(-180,-80);
  hDeg();
  scale(1.2);
  Hari2();
  popMatrix();//位置をリセット
}




//歯車の回転（右回転）


void sDeg1()//秒(6度)
{  
  int iSecond = second();
  rotate(radians(6*iSecond));
}

void sDeg1_2()//秒(3度)
{  
  int iSecond = second();
  rotate(radians(3*iSecond));
}

void sDeg1_3()//秒(2秒で3度)
{  
  int iSecond = second()/2;
  rotate(radians(3*iSecond));
}

void sDeg1_4()//秒(3秒で3度)
{  
  int iSecond = second()/3;
  rotate(radians(3*iSecond));
}

void mDeg()//分
{  
  int iMinute = minute();
  rotate(radians(6*iMinute));
}

void hDeg()//時
{  
  int iHour = hour();
  rotate( radians( 30 * iHour  ) );
}


//歯車の回転（反時計回り）
void sDeg2()//秒（3度）
{  
  int iSecond = second();
  rotate(-radians(3*iSecond ));
}





//針の描写


void Hari1()//針１
{
  noStroke();
  //中の円の描写
  fill(iC[2]);
  circle(0,0,180);
  fill(iC[0]);
  circle(0,-50,75);
  fill(iC[2]);
  circle(0,-50,65);
  fill(iC[0]);
  circle(0,0,150);
  fill(iC[2]);
  circle(0,0,140);
  fill(iC[1]);
  circle(0,0,100);
  fill(iC[0]);
  circle(0,0,50);
  
  //針の描写
  fill(iC[0]);
  quad(iQ[0]-2,iQ[1]-50,iQ[0]+2,iQ[1]-50,iQ[0]+4,iQ[1]+75,iQ[0]-4,iQ[1]+75);
  
}

void Hari2()//針2
{
  noStroke();
  //中の円の描写
  fill(iC[2]);
  circle(0,0,180);
  fill(iC[0]);
  circle(0,-50,75);
  fill(iC[2]);
  circle(0,-50,65);
  fill(iC[0]);
  circle(0,0,150);
  fill(iC[2]);
  circle(0,0,140);
  fill(iC[1]);
  circle(0,0,100);
  fill(iC[0]);
  circle(iQ[0],iQ[1]+70,25);
  circle(0,0,50);
  
  //針の描写
  fill(iC[0]);
  quad(iQ[0]-2,iQ[1]-60,iQ[0]+2,iQ[1]-60,iQ[0]+10,iQ[1]+90,iQ[0]-10,iQ[1]+90);
  
}




//歯車の描写

void Haguruma1()//24針　細長い歯車
{  
  noStroke();
  fill(iC[3]);
  circle(0,0,200); 
  fill(iC[1]);
  circle(0,0,150);
  fill(iC[3]);
   for(int i = 0; i<24; i ++)
  {
    quad(iQ[0]-3,iQ[1]-30,iQ[0]+3,iQ[1]-30,iQ[0]+5,iQ[1]+50,iQ[0]-5,iQ[1]+50);//歯の描写
    rotate(radians(15));
  }
  fill(iC[3]);
  circle(0,0,120);
  fill(iC[1]);
  circle(0,0,80);
 
}


void Haguruma2()//12針　先が四角い歯車
{  
  noStroke();
  fill(iC[2]);
   for(int i = 0; i<12; i ++)
  {
    quad(iQ[0]-3,iQ[1]-25,iQ[0]+3,iQ[1]-25,iQ[0]+5,iQ[1],iQ[0]-5,iQ[1]);//歯の描写
    rotate(radians(30));
    square(iQ[0]-15,iQ[1]-10,30);
  }
  circle(0,0,205);
  fill(iC[1]);
  circle(0,0,100);
}


void Haguruma3()//12針 先が短い歯車
{ 
  noStroke();
  fill(iC[3]);
  for(int i = 0; i<12; i ++)
  {
    quad(iQ[0]-10,iQ[1]-15,iQ[0]+10,iQ[1]-15,iQ[0]+15,iQ[1],iQ[0]-15,iQ[1]);//歯の描写
    quad(iQ[0]+3,iQ[1]-30,iQ[0]-3,iQ[1]-30,iQ[0]-10,iQ[1]-14,iQ[0]+10,iQ[1]-14);//歯の描写(小さくなるところ)
    rotate(radians(30));
  }
  circle(0,0,205);
  fill(iC[1]);
  circle(0,0,100);
}
