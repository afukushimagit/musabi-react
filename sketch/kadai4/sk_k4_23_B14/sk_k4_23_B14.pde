/**
　点と曲線で構成された人工的な構造物が独自の生態系を築いている。
　我々はこの個体群を観察している。
　構造物は路線図から着想したため、路線体と呼ぶことにする。
　モードの切り替えによって2つの系統の静止画が出力される。
　モードAでは路線体を格子上に配置し、モードBでは任意の地点に路線体の始点を置く。
　結果として、前者は巨視的な視点から、後者は微視的な視点から個体群を観測しているようにみえる。
　どちらにおいても描画のたびに異なる静止画が得られる。
　路線体と視界の描画には再帰関数を用いた。
*/
/* モードA/Bの切り替え */
boolean modeA = true;

/* モードAの変数 */
int row,col;
int rowSize,colSize;

/* A/B共通の変数 */
int railNum;
float[] x_rail;
float[] y_rail;

color[] railColors = {
  color(200,50,50), color(50,180,80), color(0,80,179),
  color(243,152,0), color(147,112,219), color(60,179,113),
  color(199,100,66), color(0,161,233), color(227,215,163), 
  color(0,155,159), color(234,85,50), color(233,83,136),
};

int railMin;
int railMax;
float xdif;
float ydif;
float xScale;
float yScale;

float xoff;
float xadd;
float yadd;


void setup() {
  size(1000,1000);
  
  if (modeA) {
    /* モードAの変数を初期化 */
    rowSize = 25;
    colSize = 25;
    row = width/rowSize;
    col = height/colSize;
    
    railNum = railColors.length*5;
    railMin = 10;
    railMax = 30;
    xdif = 5;
    ydif = 5;
    xScale = row;
    yScale = col;
    
  } else {
    /* モードBの変数を初期化 */
    railNum = railColors.length*4;
    railMin = 5;
    railMax = 15;
    xdif = 50;
    ydif = 50;
    xScale = width;
    yScale = height;
  }
  
  xoff = 0;
  xadd = 0;
  yadd = 0;
  
  x_rail = new float[railNum];
  y_rail = new float[railNum];
  for (int i=0;i<railNum;i++) {
    x_rail[i] = 0;
    y_rail[i] = 0;
  }
  
  noLoop();
}

void draw() {
  background(255);
 
  for (int i=0;i<x_rail.length;i++) {
    /* 路線体の始点の位置を定める */
    x_rail[i] = noise(i+random(0,10))*xScale;
    y_rail[i] = noise(i+random(0,10))*yScale;
    
    /* 始点を格子上に配置する(モードA) */
    if (modeA) {
      x_rail[i] = round(x_rail[i])*rowSize;
      y_rail[i] = round(y_rail[i])*colSize;
    }
    
    /* １体の路線体を描画する */
    recursiveRail(x_rail[i],y_rail[i],round(random(railMin,railMax)),color(railColors[i%railColors.length],35));
  }
  
  recursiveLight(ceil(dist(0,0,width,height)));
}

/* 視界を描画する再帰関数 */
void recursiveLight(int n) {
  noFill();
  strokeWeight(2);
  
  /* 視界の明るさを表現する */
  stroke(0,pow(1.005,n));
  circle(width/2,height/2,n);
  
  /* 直径を少しずつ絞り円を描いていく */
  if(n>0) {
    recursiveLight(n-1);
  }
}

/* 路線体を描画する再帰関数 */
void recursiveRail(float x,float y,int n, color c) {

  /* 次に描く点の位置を決定する */
  xadd = xdif*noise(xoff)*pow(-1,round(random(0,1)));
  yadd = ydif*noise(xoff+10)*pow(-1,round(random(0,1)));
  
  /* 次点を格子上に配置する(モードA) */
  if (modeA) {
    xadd = round(xadd)*rowSize;
    yadd = round(yadd)*colSize;
  }
  
  stroke(c);
  noFill();
  
  /* 曲線の描画 */
  strokeWeight(noise(xoff)*5);
  bezier(x,y,x+xadd,y,x,y+yadd,x+xadd,y+yadd);
  
  
  /* 始点と次点の描画 */
  fill(255);
  strokeWeight(noise(xoff+2)*5);
  circle(x,y,noise(xoff)*10);
  
  strokeWeight(noise(xoff+4)*5);
  circle(x+xadd,y+yadd,noise(xoff+1)*10);
  
  
  /* 「・ー・」を数珠のように繋げていく */
  if (n>0) {
    recursiveRail(x+xadd,y+yadd,n-1,c);
    xoff += random(0,1);
  }
  
}
