/**
テーマは繋がる波模様です。課題２のパターンの作成が楽しかったので、今回はパターンに回転とサイズの変化加えて新しい形を作る試みをしました。
円弧の面白いところはうまく接続部分が合うと大きさや向きに関わらず繋がって見えるところです。
正方形に区切られたパターンは、左右上下のパターンとつながり正方形の枠を超えて広がります。
*/
int iDraw;    // 描画フラグ(0or1)
int iImageNo;   // 画像番号


void setup()
{
  size(1000, 1000);
  iDraw=1;
  //noLoop();
}

void draw()
{
  if( iDraw == 1 )
  {
    background(240,240,255);//少しだけ青みがかった白
    shikaku(0,0,1000,4);//(a,b,m,x)の初期値
    
    iDraw = 0;  // 描画フラグを0へ
  }
}

void shikaku(float a, float b, float m, int x) 
{
  noStroke();
  fill(240,240,255);
  rect(a,b,m,m);//最初は(0,0,1000,1000)の正方形
  moyou(a,b,m);//最初は(0,0,1000)が（A ,B,C）の初期値
  float c = m/2;
  x--;
  float d = map(x, 0, 3, 0.3, 0);//xが0,1,2,3の時、dは0.3,0.2,0.1,0
  
  if (x >= 0) //xが3から0までの4回
  {
    if (random(1) >= d) //０以上１未満のランダム数がdより大きい時4分割する(初めは必ず4分割される)
    {
      shikaku(a, b, c, x);//左上、mの値が半分になる(以下同様)
      shikaku(a+c, b, c, x);//右上、
      shikaku(a+c, b+c, c, x);//右下
      shikaku(a, b+c, c, x);//左下
    }
  }
  
}

void moyou(float A, float B, float C) 
{
  stroke(100,100,255);//青
  strokeWeight(7);
  strokeCap(SQUARE);
  noFill();
  float D = 2*C;//半径をrectの幅にする  
  int E = (int)random(4);

  if(C==500)//正方形のサイズが500の時
  {
    if(E==0)//25%の確率で
    {
       for (int nami=0; nami<32; nami++)//32本の円弧を
      {
        arc(A,B,D,D,radians(0),radians(90),OPEN);//左上を中心として描く
        D=D-C/16;
       }
    }
    else if(E==1)
    {
      for (int nami=0; nami<32; nami++)
      {
        arc(A+C,B,D,D,radians(90),radians(180),OPEN);//右上を中心として描く
        D=D-C/16;
      }
    }
    else if(E==2)
    {
      for (int nami=0; nami<32; nami++)
      {
        arc(A+C,B+C,D,D,radians(180),radians(270),OPEN);//右下を中心として描く
        D=D-C/16;
      }
    }
    else if(E==3)
    {
      for (int nami=0; nami<32; nami++)
      {
        arc(A,B+C,D,D,radians(270),radians(360),OPEN);//左下を中心として描く
        D=D-C/16;
      }
    }
  }
  
  else if(C==250)//正方形のサイズが250の時
  {
    if(E==0)
    {
       for (int nami=0; nami<16; nami++)//16本の円弧を
      {
        arc(A,B,D,D,radians(0),radians(90),OPEN);//左上を中心として描く
        D=D-C/8;
       }
    }
     else if(E==1)
    {
      for (int nami=0; nami<16; nami++)
      {
        arc(A+C,B,D,D,radians(90),radians(180),OPEN);//右上を中心として描く
        D=D-C/8;
      }
    }
    else if(E==2)
    {
      for (int nami=0; nami<16; nami++)
      {
        arc(A+C,B+C,D,D,radians(180),radians(270),OPEN);//右下を中心として描く
        D=D-C/8;
      }
    }
    else if(E==3)
    {
      for (int nami=0; nami<16; nami++)
      {
        arc(A,B+C,D,D,radians(270),radians(360),OPEN);//左下を中心として描く
        D=D-C/8;
      }
    }  
  }
  
  else if(C==125)//正方形のサイズが125の時
  {
    if(E==0)
    {
       for (int nami=0; nami<8; nami++)//8本の円弧を
      {
        arc(A,B,D,D,radians(0),radians(90),OPEN);//左上を中心として描く
        D=D-C/4;
       }
    }
     else if(E==1)
    {
      for (int nami=0; nami<8; nami++)
      {
        arc(A+C,B,D,D,radians(90),radians(180),OPEN);//右上を中心として描く
        D=D-C/4;
      }
    }
    else if(E==2)
    {
      for (int nami=0; nami<8; nami++)
      {
        arc(A+C,B+C,D,D,radians(180),radians(270),OPEN);//右下を中心として描く
        D=D-C/4;
      }
    }
    else if(E==3)
    {
      for (int nami=0; nami<8; nami++)
      {
        arc(A,B+C,D,D,radians(270),radians(360),OPEN);//左下を中心として描く
        D=D-C/4;
      }
    }  
  }
  
  else//その他の正方形のサイズ（62.5）の時
  {
    if(E==0)
    {
       for (int nami=0; nami<4; nami++)//4本の円弧を
      {
        arc(A,B,D,D,radians(0),radians(90),OPEN);//左上を中心として描く
        D=D-C/2;
       }
    }
     else if(E==1)
    {
      for (int nami=0; nami<4; nami++)
      {
        arc(A+C,B,D,D,radians(90),radians(180),OPEN);//右上を中心として描く
        D=D-C/2;
      }
    }
    else if(E==2)
    {
      for (int nami=0; nami<4; nami++)
      {
        arc(A+C,B+C,D,D,radians(180),radians(270),OPEN);//右下を中心として描く
        D=D-C/2;
      }
    }
    else if(E==3)
    {
      for (int nami=0; nami<4; nami++)
      {
        arc(A,B+C,D,D,radians(270),radians(360),OPEN);//左下を中心として描く
        D=D-C/2;
      }
    }    
  }
  
}

void keyPressed()
{
  if (key == ENTER)
  {
    iDraw = 1;
  }
}

void mouseClicked()
{
  if( mouseButton == RIGHT )
  {
    save( "sakuhin" + iImageNo + ".png" );
    iImageNo++;
  }
}
