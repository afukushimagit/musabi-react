/**

ししおどしを表現した時計。
秒ごとに雫が落ち、分ごとにししおどしが動き、時間ごとに太陽、月、空の色などが変化する。朝焼け、夕焼けも表現している。

**/

int iX=0;
int iY=0;
int iZ=0;

void setup()
{
  size(500,500);
  frameRate(60);
}

void draw()
{
  drawbackground();
  drawbackground2();
  drawsun();
  drawmoon();
  drawground();
  drawkakehi();
  drawhachi();
  drawshishiodoshi();
  drawwater();
  drawlight();
}

//空の明るさを表現する関数。朝と夜に色が(144,215,236)か(0,0,80)に変化する
void drawbackground ()
{
  float iB = second()+60*minute()+3600*hour();
  
  if ( 4 <= hour() && hour() < 8)
  {
    background( (iB-14400)*144/14400 ,(iB-14400)*215/14400 ,80+(iB-14400)*156/14400);    
  }
  else if ( 8 <= hour() && hour() < 16 )
  {
    background(144,215,236);
  }
  else if (16 <= hour() && hour() < 20)
  {
    background( 144-(iB-57600)*144/14400 ,215-(iB-57600)*215/14400 ,236-(iB-57600)*156/14400);
  }
  else
  {
    background(0,0,80);
  }
}

//朝焼け、夕焼けを表現する関数。横のlineを複数縦に引くことで白→赤のグラデーションを表現している。
//そのままグラデーションにすると不自然なので、sinをかませることで地面に近づくほど更に赤くなるように
//不透明度を時間に合わせて変えることで太陽の浮き沈みを再現
void drawbackground2()
{
  float iB = second()+60*minute()+3600*hour();
  for (int y = 100; y <= 250; y ++)
  {
    float ia = sin(radians( (y-100)*90/150 ));
    if( 4 <= hour() && hour() < 6 )
    {
      stroke( 255, 255-ia*(y-100)*87/150, 255-ia*(y-100)*141/150,ia*((y-100)*255/150)*(iB-14400)/7200);
    }
    else if( 6 <= hour() && hour() < 8 )
    {
      stroke( 255, 255-ia*(y-100)*87/150, 255-ia*(y-100)*141/150,ia*((y-100)*255/150)*(1-(iB-21600)/7200));
    }
    else if( 16 <= hour() && hour() < 18 )
    {
      stroke( 255, 255-ia*(y-100)*87/150, 255-ia*(y-100)*141/150,ia*((y-100)*255/150)*(iB-57600)/7200);
    }
    else if( 18 <= hour() && hour() < 20 )
    {
      stroke( 255, 255-ia*(y-100)*87/150, 255-ia*(y-100)*141/150,ia*((y-100)*255/150)*(1-(iB-64800)/7200));
    }
    else
    {
      stroke(0,0,0,0);
    }
    line(0,y,500,y);
  }
}

//一日を秒数で表してなるべくなめらかに２４時間で太陽と月を一周させる関数,12時に太陽が、24時に月が上にいくように
void drawsun ()
{
  noStroke();
  fill(255,148,119);
  circle(250+200*cos(radians(90+(second()+60*minute()+3600*hour())/240)),250+200*sin(radians(90+(second()+60*minute()+3600*hour())/240)),40);
}

void drawmoon ()
{
  fill(255,255,163); 
  circle(250+200*cos(radians(270+(second()+60*minute()+3600*hour())/240)),250+200*sin(radians(270+(second()+60*minute()+3600*hour())/240)),40);
}

//地面を表現する関数。
void drawground ()
{
  fill(100,100,100);
  rect(0,250,500,250);
}

//筧（水が出る所）を表現する関数。
void drawkakehi()
{
  stroke(0,0,0,50);
  fill(130,172,35);
  rect(60,110,15,300);
  fill(145,141,64);
  beginShape();
  vertex(100,70);
  vertex(100,120);
  vertex(40,130);
  vertex(35,125);
  vertex(35,75);
  vertex(95,65);
  endShape(CLOSE);
  fill(130,172,35);
  beginShape();
  vertex(70,90);
  vertex(200,140);
  vertex(200,160);
  vertex(70,110);
  endShape();
  fill(222,184,135);
  ellipse(200,150,10,20);
}

//水の入っている鉢を表現する関数。
void drawhachi()
{
  fill(40,70,70);
  ellipse(175,410,290,230);
  ellipse(175,352,270,120);
  fill(40,100,110);
  ellipse(175,350,240,100);
}

//ししおどしを表現する関数。
void drawshishiodoshi()
{
  fill(130,172,35);
  rect(340,335,24,215);
  fill(128,128,128);
  ellipse(455,495,350,100);
  ellipse(470,460,250,80);
  fill(130,172,35);

  pushMatrix();

  //ししおどしを１分経つごとに動かす、４秒までは回転し、それ以降は元に戻るように
  translate(337,355);
  if( 0 <= second() && second() < 4 )
  {
    rotate(radians(-iY/8));
    iY ++;
  }
  else if( 4 <= second() && second() < 5 )
  {
    rotate(radians(-iY/8));
  }
  else if( 5 <= second() && iY/8>iZ )
  {
    rotate(radians(iZ-iY/8));
    iZ +=2 ;
  }
  else
  {
    iY = 0;
    iZ = 0;
  }

  beginShape();
  vertex(192-337,288-355);
  vertex(260-337,287-355);
  vertex(484-337,417-355);
  vertex(460-337,447-355);
  endShape(CLOSE);
  fill(222,184,135);
  ellipse(226-337,287-355,69,11);
  //ししおどしが倒れ切った時だけ水が流れているように見せる
  if( 3 <= second() && second() < 4 )
  {
    fill(100,150,160,125);
    arc(201-337,287-355,20,6,radians(100),radians(270));
  }
  else if( 4 <= second() && second() < 5 )
  {
    fill(100,150,160);
    arc(205-337,287-355,25,6,radians(90),radians(270));
  }
  popMatrix();
  
  fill(130,172,35);
  rect(310,340,30,210);
  fill(218,165,32);
  circle(325,360,5);
}

//水の落ち方の表現、筧の先端から出てししおどしの先端に当たったら消えるように
void drawwater()
{
  float iA;
  iA = 157+9.8*iX*iX/100 ;
  iX++ ;
  if (iA < 285)
  //157は筧のy座標、285はししおどしのy座標
  {
  fill(135,206,235);
  circle(200,iA,6);
  }
  else if (iX > 60)
  //フレームレートが60なので60になるごとにリセットし1秒を表現する
  {
    iX = 0 ;
  }
}

//昼の間は半透明の黄色をのせてだんだん明るく、夜の間は全体に半透明のグレーをのせてだんだん暗くなるように
void drawlight()
{
  float iB = second()+60*minute()+3600*hour();
  if ( 4 <= hour() && hour() < 8 )
  {
    fill(0,0,0,100-(iB-14400)*100/14400);
  }
  else if ( 8 <= hour() && hour() < 12 )
  {
    fill(255,255,255,(iB-28800)*40/14400);
  }
  else if ( 12 <= hour() && hour() < 16 )
  {
    fill(255,255,255,40-(iB-43200)*40/14400);
  }
  else if ( 16 <= hour() && hour() < 20 )
  {
    fill(0,0,0,(iB-57600)*100/14000);
  }
  else
  {
    fill(0,0,0,100);
  }
  square(0,0,500);
}
