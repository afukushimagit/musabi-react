/**
 赤色>時間/黄色>分/青色>秒
ひし形12個が30度ずつ回転する。
菱形1個=1時間単位(時、分、秒)
12*5=60だから5回回転すれば（青）1分、（黄）1時間になる。
1回転ごとに透明度が増す。
*/


int L;       
float angle;  

void setup(){
  size(1000,1000);
  L=80;         // 一辺の長さ
  angle=PI/12 ; // 'angle (= 15度)'を繰り返すので変数に設定
}

void draw(){
  background(255); 
  
  //hour
  stroke(200 ,0,0,30);    
  fill(200,0,0,10);  
  figure(width/2,height/4,hour());        //x,y,hour
  
  //minute
  stroke(250,200,0,30);
  fill(250,200,0,10);
  figure(3*width/4,2*height/3,minute());  //x,y,minute
  
  //second
  stroke(0,0,200,30);
  fill(0,0,200,20);
  figure(width/4,2*height/3,second());    //x,y,second
}

void figure(int x, int y,int time){

  pushMatrix();                    // 画面を回転
  translate(x,y);                  // (x,y)を原点にする
  for(int i=0; i<time;i++){        // 持ってくる時間ほど繰り返す //１回で30度ずつ移動し12回で１回転
    quad(0,0,-L*sin(angle),-L*cos(angle),0,-2*L*cos(angle),L*sin(angle),-L*cos(angle)); //菱形の下の頂点を原点に設定
    rotate(2*angle);         //角度回転(15*2)30度ずつ
  }                          // 毎フレームごと時間だけ描くのでforを使用　// 時間の分繰り返すためi<time
                             //12以上ではfillが１stack
  popMatrix();               //画面回転を終わらせる
  
}
