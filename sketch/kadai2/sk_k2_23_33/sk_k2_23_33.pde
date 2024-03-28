size(500, 500);
translate(width/2.0, height/2.0);  //座標を中心に移動
blendMode( SUBTRACT );

int n = 150000;               //試行回数
float p = width/5.0;       //xの拡大率
float q = height/5.0;      //yの拡大率
float X = 0;                      //xの初期値
float Y = 0;                      //yの初期値
float x, y;

for (int i=0; i<n/3; i++) {    //全試行の1/3を赤点でプロット
  x = sin(Y)+cos(3*X);
  y = sin(X)+cos(Y);
  X = x;
  Y = y;
  stroke(255, 0, 0);
  point(x*p, y*q);
}

for (int i=0; i<2*n/3; i++) {   //その上から2/3を緑点で減算
  x = sin(Y)+cos(3*X);
  y = sin(X)+cos(Y);
  X = x;
  Y = y;
  stroke(0, 255, 0);
  point(x*p, y*q);
}

for (int i=0; i<n; i++) {            //さらに全部を青点で減算
  x = sin(Y)+cos(3*X);
  y = sin(X)+cos(Y);
  X = x;
  Y = y;
  stroke(0, 0, 255);
  point(x*p, y*q);
}
