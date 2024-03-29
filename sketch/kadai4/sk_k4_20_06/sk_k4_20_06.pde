void setup()
{
  size(1000, 1000);
  colorMode(RGB);
  noLoop();
  stroke(0);
  shikaku(0, 0, 1000,5);
  katachi(0,1000,5);
}
void shikaku(float a, float b, float m, int x) 
{
  fill(random(250),100,random(150));
  rect(a,b,m,m);
  katachi(a,b,m);
  float c = m/2;
  float d = map(x, 0, 4, 0.45, 0);
  x--;
  if (x >= 0) {
    if (random(1) > d) 
    {
      shikaku(a, b, c, x);
      shikaku(a+c, b, c, x);
      shikaku(a+c, b+c, c, x);
      shikaku(a, b+c, c, x);
    }
  }
}
 
void mousePressed() 
{
  redraw();
}
 
void katachi(float A, float B, float C) 
{
  float D = C/2;
  pushMatrix();
  translate(A+D,B+D);
  fill(random(250),100,random(150));
  if (random(1) > 1.0/2.0)
  {
  triangle(D, D,-D,-D, D,-D);
  }
  else if (random(1) > 1.0/2.0)
  {
  rect(D, -D, C,C);
  }
  else
  {
   ellipse(D,-D, C, C);
  }
  popMatrix();
}
void  keyPressed()
{
  if(keyCode  ==  ENTER)
  {
  save("a19_yoshida.png");
  }
}
