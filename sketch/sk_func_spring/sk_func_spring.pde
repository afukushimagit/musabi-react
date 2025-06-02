float fX = 0;
float fTargetX = 300;

void setup() 
{
  size(400, 200);
}

void draw() 
{
  background(204);
  
  // 位置更新
  fX = spring( fX, fTargetX, 0.1);
  
  ellipse( fX, height / 2, 30, 30);
}

// 現在位置と目的地から，新しい位置を返す．
float spring(float fXCurrent, float fTarget, float fEase) 
{
  return fXCurrent + (fTarget - fXCurrent) * fEase;
}
