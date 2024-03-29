/**
振り子のついた鳩時計
秒針の色が徐々に変化し、針が０に到達すると鳩が出てくる
*/

int x;

void setup()
{
  size(500,620);
  frameRate(60);
  colorMode(HSB,360,100,100,100);
  noStroke();
}

 
void draw() 
{  
  //リフレッシュ
  fill(121,82,31);
  rect(0,0,width,height);
  
  //時計本体
  fill(0,0,100);
  rect(100,130,300,300);
  triangle(100, 130, 250, 20, 400, 130);
  //窓
  fill(121,57,39);
  rect(225,110,50,40);
  circle(250,110,50);
  
  float h =hour()%12;
  float m =minute();
  float s =second();
  float arcStart=PI*1.5;
  
 // 時針
 fill(236,53,100,90);
  arc(250,300,120,120,arcStart,arcStart+radians(h*30));
   
  //分針
  fill(9,79,100,60);
  arc(250,300,160,160,arcStart,arcStart+radians(m*6));

  //秒針
  fill(44,79* (s / 60),99,50);
  arc(250,300,200,200,arcStart,arcStart+radians(s*6));
  
    
 if(s<=2)//秒針が0になると鳩が出てくる
 {
   //鳩の体
   fill(0,0,100);
   circle(250,105,20);
   ellipse(250,125,30,40);
   ellipse(240,127,18,33);
   ellipse(260,127,18,33);
   //鳩のくちばし
   fill(44,79,100);
   beginShape();
   vertex(250,103);
   vertex(245,106);
   vertex(250,109);
   vertex(255,106);
   endShape(CLOSE);
 }
 
//振り子
x += 3;

  if(x>360) 
  {
    x=0;
  }
  
  translate( width/2, 550 );
  
  fill(360,0,100);
  circle(200*sin(radians(x)),0,60);
}
