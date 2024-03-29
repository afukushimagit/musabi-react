void setup()
{
  size(1000,1000);
  background(#C4E6FF);
  translate(width/2,height/2);
  kernel(0, 0, 330, 5); //範囲と繰り返し回数
  rectMode(RADIUS); 

  float RectX      = width/2;
  float RectY      = height/2;
  float RectWidth  = width/3;
  float RectHeight = height/3;
  
  barrier(RectX-RectX, RectY-RectY, RectWidth, RectHeight);  //(0,0,RectWidth, RectHeight)にしたかった
}

void barrier(float RectX, float RectY, float RectWidth, float RectHeight)
{ 
  stroke(255,210);
  noFill();
  rect(RectX, RectY, RectWidth, RectHeight);//敢えて塗り無しで線を薄く
  
  if( RectWidth > random(1,20)) //再帰終了を設定
  {
    barrier(RectX-RectWidth, RectY-RectHeight, RectWidth/3, RectHeight/3); //左上
    barrier(RectX-RectWidth, RectY, RectWidth/3, RectHeight/3);            //左
    barrier(RectX-RectWidth, RectY+RectHeight, RectWidth/3, RectHeight/3); //左下
    barrier(RectX, RectY-RectHeight, RectWidth /3, RectHeight/3);          //上
    barrier(RectX, RectY+RectHeight, RectWidth/3, RectHeight/3);           //下
    barrier(RectX+RectWidth, RectY-RectHeight, RectWidth/3, RectHeight/3); //右上
    barrier(RectX+RectWidth, RectY, RectWidth/3, RectHeight/3);            //右
    barrier(RectX+RectWidth, RectY+RectHeight, RectWidth/3, RectHeight/3); //右下
  }
}

//nは繰り返しの数
void kernel(float x, float y, float z, float n)
{
  stroke(255,50);//薄く縁取り
  fill(random(255),random(255),random(255),100);//ランダムで色設定
  ellipse(x, y, z*2, z*2);
  if(n <= 1) return;
  float newK = z/2;
  kernel(x+newK, y, newK, n-1); //右円
  kernel(x, y+newK, newK, n-1); //下円
  kernel(x-newK, y, newK, n-1); //左円
  kernel(x, y-newK, newK, n-1); //上円
}
