void setup()
{
  size(1000,1000);
  colorMode(RGB,255);
  background(55,155,0);
  //背景のグラデーション
  for(float g=0; g<=1000; g++)
  {
    noFill();
    stroke(255-g*0.2,255-g*0.1,0);//線の色:黄色～緑
    circle(500,500,g);
  }
  
  Okura(random(360),200,500,500);
}

//オクラの断面の描画
void Okura(float Oangle,float Olength,float OcoreX,float OcoreY)
{
  //スジの座標
  float OaX=Olength*cos(radians(Oangle))+OcoreX;
  float OaY=Olength*sin(radians(Oangle))+OcoreY;
  float ObX=Olength*cos(radians(Oangle+72))+OcoreX;
  float ObY=Olength*sin(radians(Oangle+72))+OcoreY;
  float OcX=Olength*cos(radians(Oangle+144))+OcoreX;
  float OcY=Olength*sin(radians(Oangle+144))+OcoreY;
  float OdX=Olength*cos(radians(Oangle+216))+OcoreX;
  float OdY=Olength*sin(radians(Oangle+216))+OcoreY;
  float OeX=Olength*cos(radians(Oangle+288))+OcoreX;
  float OeY=Olength*sin(radians(Oangle+288))+OcoreY;
  
  //分かれるスジの角度
  float Sangle=5; //このパラメーターを変えることで模様を変化させる
  
  //中心のスジの描画
  stroke(40,120,0);//スジの色
  strokeWeight(1.5);//スジの太さ
  line(OcoreX,OcoreY,OaX,OaY);
  line(OcoreX,OcoreY,ObX,ObY);
  line(OcoreX,OcoreY,OcX,OcY);
  line(OcoreX,OcoreY,OdX,OdY);
  line(OcoreX,OcoreY,OeX,OeY);
  
  //中心から分かれていくスジの描画
  if(Olength>30)//スジの長さが30以下なら再帰終了
  {
    Okura(Oangle+Sangle,Olength*0.5,OaX,OaY);
    Okura(Oangle-Sangle,Olength*0.5,OaX,OaY);
    Okura(Oangle+Sangle,Olength*0.5,ObX,ObY);
    Okura(Oangle-Sangle,Olength*0.5,ObX,ObY);
    Okura(Oangle+Sangle,Olength*0.5,OcX,OcY);
    Okura(Oangle-Sangle,Olength*0.5,OcX,OcY);
    Okura(Oangle+Sangle,Olength*0.5,OdX,OdY);
    Okura(Oangle-Sangle,Olength*0.5,OdX,OdY);
    Okura(Oangle+Sangle,Olength*0.5,OeX,OeY);
    Okura(Oangle-Sangle,Olength*0.5,OeX,OeY);
  }
  //輪郭を強調するスジの描画
  line(OaX,OaY,ObX,ObY);
  line(ObX,ObY,OcX,OcY);
  line(OcX,OcY,OdX,OdY);
  line(OdX,OdY,OeX,OeY);
  line(OeX,OeY,OaX,OaY);
}
