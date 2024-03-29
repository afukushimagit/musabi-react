/**

棒人間が24時間歩き続ける時計
秒で棒人間が歩き、分で雲、時で太陽・月などが変化していく

*/

float iRatateDegS;             // 太陽の回転角
float iRatateDegM;             // 月の回転角

void setup()
{
  size(600,450);
  colorMode(RGB);
  frameRate(30);
  iRatateDegS = 0;
  iRatateDegM = 0;
}

void draw()
{
  float s = second();//秒数を取得
  float m = minute();//分
  float h = hour();//時間
  
  if( h < 24 )//18~24時の間
  {
    //背景
    fill( 40, 40, 112 );//紺
    noStroke();
    rect( 0, 0, width, height );
  
    // 月の描画
    iRatateDegM  = 180/11*( h - 18 ); //1時間180/11度ごと回転（月）
    fill( 255, 255, 0 );
    circle( 300-280*cos(radians(iRatateDegM)), 400-280*sin(radians(iRatateDegM)), 70 );
    fill( 40, 40, 112 );
    circle( 320-280*cos(radians(iRatateDegM)), 390-280*sin(radians(iRatateDegM)), 70 );
  }
  
  if( h < 18)//6~18時の間
  { 
    //背景
    fill( 30, 175, 255 );//青
    noStroke();
    rect( 0, 0, width, height );
    
    //太陽の描画
    iRatateDegS  = 180/11*( h - 6 ); //1時間180/11度ごと回転（太陽）
    fill( 255, 255, 180 );
    circle( 300-280*cos(radians(iRatateDegS)), 400-280*sin(radians(iRatateDegS)), 65 );
  }
  
  if( h < 6)//0~6時の間
  {
    fill( 40,  40, 112 );
    noStroke();
    rect( 0, 0, width, height ); //紺の背景
    
    // 月の描画
    iRatateDegM  = 180/11*(h+6); //1時間180/11度ごと回転（月）
    fill( 255, 255, 0 );
    circle( 300-280*cos(radians(iRatateDegM)), 400-280*sin(radians(iRatateDegM)), 70 );
    fill( 40, 40, 112 );
    circle( 320-280*cos(radians(iRatateDegM)), 390-280*sin(radians(iRatateDegM)), 70 );
  }
 
  //1分ごと左に動く雲
  fill(255);
  ellipse( 600-10*m, 200, 80, 45);
  ellipse( 600-10*m-35, 205, 40, 25);
  ellipse( 600-10*m-30, 195, 25, 25);
  ellipse( 600-10*m-10, 180, 40, 45);
  ellipse( 600-10*m+40, 208, 40, 20);
   
   //地面
  fill(0);
  rect( 0, 400, 600, 450 );
  
  //1秒ずつ右に進み1分間で右端に到達する棒人間
  stroke(0);
  if( s%2 == 0 )//偶数秒の棒人間
  {
    strokeWeight(1.6);
    line( 10*(s+1), 380, 10*s, 400 );
    line( 10*(s+1), 380, 10*(s+2), 400 );
    line( 10*(s+1), 360, 10*s, 380 );
    line( 10*(s+1), 360, 10*(s+2), 380 );
    circle(10*(s+1), 352, 16 );
    strokeWeight(2);
    line( 10*(s+1), 360, 10*(s+1), 380 );
  }
  else//奇数秒の棒人間
  {
    strokeWeight(2);
    line( 10*(s+1), 359, 10*(s+1), 400 );
    circle(10*(s+1), 351, 16 );
  }
}
