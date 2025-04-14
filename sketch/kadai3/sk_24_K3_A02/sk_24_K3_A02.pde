/**************************************************************
釣りをテーマに作りました。1秒ごとに波紋が出て10秒ごとに竿が動き、
分が変わると魚を釣り上げ時間が変わるとでかい猫が魚を食いにやってきます。
30分までは潮が満ちて行って31分からは引いていきます。引くときは潮の跡が残ります。
魚の形は３種類あり、釣れにくい魚もいます。ごくまれにデ情くんも釣れます。
 **************************************************************/
/*
  デバッグ機能
    'S'キー：png出力
    'H'キー：時が変わったときのアニメーション再生
    'M'キー：分が変わったときのアニメーション再生
*/
// === 'S'キーを押した時の出力画像名 ===
//  "K3_[クラス][番号]_[苗字].png"
String pngName = "K3_A12_fukushima.png";

// === アニメーション用変数/定数 ===
float rodTimer = 0;    //各種タイマー
float catTimer = 0;
float fishTimer = 0;
float kaoTimer = 0;
float hamonTimer = 0;
float hamonsTimer = 0;
float ffffffish;
float [] Fc = new float[3] ;
float sF;
// === Time Handling ===

int hourCurrent;       // 現在の時（0~23）
int minuteCurrent;     // 現在の分（0~59）
int secondCurrent;     // 現在の秒（0~59）
float deltaTime;       // 前フレームからの経過時間（秒,0~1）
float deltaTimePerSec; // 前回の秒が切り替わってからの経過時間（秒,0~1）
int animeH = 0;    // 各種アニメーションフラグ（1:アニメーション中）
int animeM = 0;
int animeM2 = 0;
int animeM3 = 0;
int animeS = 0;
int animeSs = 0;
  
void setup()
{
  size( 800, 600 );
  frameRate( 60 );  // フレームレートの指定
  
  initTime();
}

void draw()
{  
  // === Time Update ===
  updateTimePre();
  
  // 画面をクリア
  fill( 204  );
  noStroke();
  rect( 0, 0, width, height );  
  // === アニメーションを記述 ===
  
  flag();
  drawbackground();
  drawhuman();
  drawrod();
  drawhamon();
  drawcat();
  drawfish();
  drawbox();
  
  /* 時間をデバッグ表示（ 提出前に非表示にすること．）
  fill( 0 );
  textSize(20);
  text( hourCurrent + ":" + minuteCurrent + ":" + secondCurrent, 10, 20);
  text( "deltaTimePerSec: " + deltaTimePerSec, 10, 40);
  text( "deltaTime: " + deltaTime, 10, 60);
  */
  // === Time Update ===
  updateTimePost();
}

//関数達＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

void flag()//分ごとのアニメーションの管理
{ 
  if ( minuteCurrent!= minutePrev )
  {
    animeM = 1;  // アニメーション開始
    animeM2 = 1;
    animeM3 = 1;
    animeSs = 1;
    // アニメーション初期化
    rodTimer = 0;
    fishTimer = 0;
    kaoTimer = 0;
    hamonsTimer = 0;
  } 
}

void drawbackground()//背景を書く
{
  noStroke();
  
  //空
  fill(190,220,250);
  rect(0,0,800,600);
  //岩肌
  fill(140);
  rect(0,420,330,200);
  noStroke();
  //海
  fill(70,100,190);
  if(minuteCurrent<=30)
  {
  rect(330,500-minuteCurrent*2,550,250);
  }
  else
  {
    rect(330,380+minuteCurrent*2,550,250);
    fill(118,118,140);
    rect(325,440,5,(minuteCurrent-30)*2);
  }
  //椅子
  strokeWeight(1.5);
  fill(200,175,50);
  beginShape();
  vertex(256,390);
  vertex(253,420);
  vertex(258,420);
  vertex(259,410);
  vertex(286,410);
  vertex(287,420);
  vertex(292,420);
  vertex(289,390);
  vertex(284,390);
  vertex(285,405);
  vertex(260,405);
  vertex(261,390);
  endShape();
  fill(100);
  rect(250,380,45,10); 
}

void drawhuman()//人間を描く
{
  strokeWeight(2);
  //体
  fill(0);
  beginShape();
  vertex(287,312);
  vertex(271,323);
  vertex(256,368);
  vertex(268,382);
  vertex(307,376);
  vertex(302,412);
  vertex(303,420);
  vertex(322,420);
  vertex(324,411);
  vertex(320,410);
  vertex(321,363);
  vertex(316,360);
  vertex(285,364);
  vertex(288,347);
  vertex(282,342);
  vertex(310,372);
  vertex(318,360);
  vertex(309,353);
  vertex(299,327);
  vertex(295,303);
  endShape();
  
  if( animeM == 1 )  // アニメーション中
  { float kF;
    if( kaoTimer <= 1 )
    {
      kF =kaoTimer;
      pushMatrix();
      translate(292,314);
      rotate(-sin((kF-0.15)*PI)/5);
      
      //顔
      fill(0);
      stroke(0);
      beginShape();
      vertex(305-292,300-314);
      vertex(300-292,318-314);
      vertex(284-292,311-314);
      vertex(283-292,299-314);
      endShape();
      //帽子
      fill(120,180,140);
      stroke(0);
      beginShape();
      vertex(320-292,302-314);
      vertex(277-292,297-314);
      vertex(281-292,292-314);
      vertex(284-292,281-314);
      vertex(306-292,284-314);
      vertex(308-292,296-314);
      vertex(322-292,298-314);
      vertex(320-292,302-314);
      endShape();      
      popMatrix();
      
      kaoTimer += deltaTime; 
    }
    else //それ以外の時
    {
      drawNormalHead();
      animeM=0;
    }
  }
  else //それ以外の時
  {
    drawNormalHead();
  }
}

void drawNormalHead()
{
  //顔
  fill(0);
  stroke(0);
  beginShape();
  vertex(305,300);
  vertex(300,318);
  vertex(284,311);
  vertex(283,299);
  endShape();
  //帽子
  fill(120,180,140);
  stroke(0);
  beginShape();
  vertex(320,302);
  vertex(277,297);
  vertex(281,292);
  vertex(284,281);
  vertex(306,284);
  vertex(308,296);
  vertex(322,298);
  vertex(320,302);
  endShape();
}

void drawrod()//釣り竿の描写
{  

  if( animeM2 == 1 )  // アニメーション中
  { float rF;
    if( rodTimer <= 1 )
    {
      rF = rodTimer;
      pushMatrix();
      translate(310,370);
      rotate(-sin(rF*PI)/4);
      //竿
      strokeWeight(3);
      noFill();
      bezier(0,0,-0,-10-sin(rF*PI)*80,130,-150-sin(rF*PI)*60,290,-160);
      //糸
      strokeWeight(1);
      stroke(240);
      bezier(290,-160,290+sin(rF*PI)*150,130-sin(rF*PI)*30,290-sin(rF*PI)*200,-270+sin(rF*PI)*50,290-sin(rF*PI)*20,140-sin(rF*PI)*120);
      
      popMatrix();
      
      rodTimer += deltaTime;
    }
    else
    {
      strokeWeight(3);
      noFill();
      bezier(310,370,300,360,440,220,600,210);
    
      strokeWeight(1);
      stroke(240);
      bezier(600,210,600,350,600,310,600,510);
      animeM2 = 0;
    }
  }
    // 10秒ごとのアニメーション
  else if ( secondCurrent % 10 == 0 )
  {
    float iX = 0;
    if (deltaTimePerSec<=0.1)
    {
      strokeWeight(3);
      noFill();
      bezier(310,370,300,360,440,220,600,215);
      
      strokeWeight(1);
      stroke(240);
      bezier(600,215,600,350,600,310,600,510);
    }
    else if (deltaTimePerSec<=0.2)
    {
      iX += 5*(deltaTimePerSec -0.1)*10/9*10;
      
      strokeWeight(3);
      noFill();
      bezier(310,370,300,360,440,220,600,215-iX);
      
      strokeWeight(1);
      stroke(240);
      bezier(600,215-iX,600,350,600,310,600,510);
    }
    else
    {
      strokeWeight(3);
      noFill();
      bezier(310,370,300,360,440,220,600,210);
      
      strokeWeight(1);
      stroke(240);
      bezier(600,210,600,350,600,310,600,510);
    }
  }
  else
  {
    strokeWeight(3);
    noFill();
    bezier(310,370,300,360,440,220,600,210);
  
    strokeWeight(1);
    stroke(240);
    bezier(600,210,600,350,600,310,600,510);
  }
}

void drawhamon()//波紋を書く
{
  if (minuteCurrent ==minutePrev)
  {
    if (secondCurrent !=secondPrev )
    {
      animeS = 1;
      hamonTimer = 0;
    }
    if (animeS == 1)
    {
      float hF;
      if(hamonTimer<0.5)
      {
        hF=hamonTimer;
        strokeWeight(1);
        stroke(255,255,240,255-hF*400);
        ellipse(600,513,hF*100,hF*40);
        hamonTimer +=deltaTime;
      }
    }
  }
    if (animeSs == 1)
  {
    float hF;
    if(hamonsTimer<0.6)
    {
      hF=hamonsTimer;
      strokeWeight(1);
      stroke(255,255,240,255-hF*450);
      ellipse(600,513,hF*550,hF*65);
      hamonsTimer +=deltaTime;
    } 
    else
    {
     animeSs =0; 
    }
  }
}

void drawcat()//猫
{
  // 時が変化した時のアニメーション
  if ( hourCurrent != hourPrev )
  {
    animeH = 1;  // アニメーションの開始
    // アニメーション初期化
    catTimer =0;
  }
  
  if ( animeH == 1 )
  {
    float cF;
    if(catTimer<=2)
    { 
      cF =(catTimer)*75-150;
     
   
      stroke(0);
      fill(0);
      beginShape();//顔
      vertex(105+cF,250);
      vertex(94+cF,253);
      vertex(78+cF,235);
      vertex(77+cF,260);
      vertex(74+cF,274);
      vertex(82+cF,287);
      vertex(105+cF,292);//
      vertex(128+cF,287);
      vertex(136+cF,274);
      vertex(133+cF,260);
      vertex(134+cF,235);
      vertex(118+cF,253);
      vertex(105+cF,250);
      endShape();
    
      beginShape();//目
      vertex(92+cF,287);
      vertex(82+cF,315);
      vertex(70+cF,420);
      vertex(140+cF,420);
      vertex(128+cF,315);
      vertex(118+cF,287);
      endShape();
    
      stroke(255);
      strokeWeight(3);
      line(97+cF,271,78+cF,271);
      line(113+cF,271,132+cF,271);
      catTimer += deltaTime;
   }
   else if (catTimer<=3)
   {
     
      stroke(0);
      fill(0);
      beginShape();
      vertex(105,250);
      vertex(94,253);
      vertex(78,235);
      vertex(77,260);
      vertex(74,274);
      vertex(82,287);
      vertex(105,292);//
      vertex(128,287);
      vertex(136,274);
      vertex(133,260);
      vertex(134,235);
      vertex(118,253);
      vertex(105,250);
      endShape();
  
      beginShape();
      vertex(92,287);
      vertex(82,315);
      vertex(70,420);
      vertex(140,420);
      vertex(128,315);
      vertex(118,287);
      endShape();
      
      stroke(255);
      strokeWeight(3);
      line(97,271,78,271);
      line(113,271,132,271);
      catTimer += deltaTime;
   }
   else if(catTimer<=5)
   {
     stroke(0);
     fill(0);
     beginShape();
     vertex(90,300);
     vertex(75,320);
     vertex(70,360);
     vertex(55,420);
     vertex(155,420);
     vertex(140,360);
     vertex(135,320);
     vertex(120,300);
     endShape();
      
     noFill();
     strokeWeight(7);
     bezier(115,303,90,285,160,230,145,265);
     catTimer += deltaTime;
   }
   else if(catTimer<=8)
   {
     stroke(0);
     fill(0);
     beginShape();
     vertex(105,250);
     vertex(94,253);
     vertex(78,235);
     vertex(77,260);
     vertex(74,274);
     vertex(82,287);
     vertex(105,292);//
     vertex(128,287);
     vertex(136,274);
     vertex(133,260);
     vertex(134,235);
     vertex(118,253);
     vertex(105,250);
     endShape();
  
     beginShape();
     vertex(92,287);
     vertex(82,315);
     vertex(70,420);
     vertex(140,420);
     vertex(128,315);
     vertex(118,287);
     endShape();
      
     noFill();
     stroke(255);
     strokeWeight(3);
     beginShape();
     vertex(97,271);
     vertex(87,263);
     vertex(78,270);
     endShape();
     beginShape();
     vertex(113,271);
     vertex(124,263);
     vertex(132,270);
     endShape();
     strokeWeight(1);
     catTimer += deltaTime;
   }
   else if (catTimer<=10)
   { cF =-(catTimer-8)*75;
     
   
    stroke(0);
    fill(0);
    beginShape();
    vertex(105+cF,250);
    vertex(94+cF,253);
    vertex(78+cF,235);
    vertex(77+cF,260);
    vertex(74+cF,274);
    vertex(82+cF,287);
    vertex(105+cF,292);//
    vertex(128+cF,287);
    vertex(136+cF,274);
    vertex(133+cF,260);
    vertex(134+cF,235);
    vertex(118+cF,253);
    vertex(105+cF,250);
    endShape();
  
    beginShape();
    vertex(92+cF,287);
    vertex(82+cF,315);
    vertex(70+cF,420);
    vertex(140+cF,420);
    vertex(128+cF,315);
    vertex(118+cF,287);
    endShape();
  
    noFill();
    stroke(255);
    strokeWeight(3);
    beginShape();
    vertex(97+cF,271);
    vertex(87+cF,263);
    vertex(78+cF,270);
    endShape();
    beginShape();
    vertex(113+cF,271);
    vertex(124+cF,263);
    vertex(132+cF,270);
    endShape();
    catTimer += deltaTime;
   }
   else 
   {
     animeH = 0;  // アニメーション終了
    }
  }
}


void drawfish()//魚
{
  
  if(fishTimer==0)
  {
    ffffffish = random(0,10);
    Fc[0]=random(60,200);
    Fc[1]=random(60,200);
    Fc[2]=random(60,200);
  }
  
    if( animeM3 == 1 )  // アニメーション中
  { 
    if( fishTimer <= 2 )
    {
      sF=fishTimer;
      stroke(230);
  
      
      if(ffffffish <=6.5) 
      {
        fish1();
      }
      else if(ffffffish <=9)
      {
        fish2();
      }
      else if(ffffffish <=9.9)
      {
       fish3(); 
      }
      else dejou();
    
      fishTimer += deltaTime;
    }
    else 
    {
     animeM3 =0; 
    }
  }
}

void fish1()
{
  
      if(sF<=1.71)
      {
      
      pushMatrix();
      translate(-sF*300,600*sF*(sF-1.85));
      
      pushMatrix();
      translate(600,525);
      if(sF<=1.7)rotate(-sF*PI/1.7);
      else rotate(PI);
      translate(-600,-525);
      pushMatrix();
     translate(600,500);
     strokeWeight(1.5);
     fill(Fc[0],Fc[1],Fc[2]);
     beginShape();
     vertex(2,-6);
     vertex(-14,3);
     vertex(-7,44);
     vertex(-17,54);
     vertex(-3,48);
     vertex(15,55);
     vertex(3,42);
     vertex(7,38);
     vertex(15,7);
     vertex(1,2);
     vertex(-1,17);
     vertex(2,-6);
     endShape();
     fill(0);
     circle(7,13,6);
     popMatrix();      
      popMatrix();
      popMatrix();    
    }
}

void fish2()
{
      if(sF<=1.71)
      {
      
      pushMatrix();
      translate(-sF*300,600*sF*(sF-1.85));
      
      pushMatrix();
      translate(600,525);
      if(sF<=1.7)rotate(-sF*PI/1.7);
      else rotate(PI);
      translate(-600,-525);
      pushMatrix();
      translate(600,500);
      strokeWeight(1.5);
      fill(Fc[0],Fc[1],Fc[2]);
      beginShape();
      vertex(-1,0);
      vertex(-7,8);
      vertex(-11,45);
      vertex(-2,56);
      vertex(-13,65);
      vertex(-2,62);
      vertex(13,66);
      vertex(5,58);
      vertex(14,50);
      vertex(25,12);
      vertex(2,-4);
      vertex(-1,0);
      vertex(1,14);
      endShape();
      fill(0);
      circle(9,13,6);
      popMatrix();      
      popMatrix();
      popMatrix();
    }
}

void fish3()
{
  
      if(sF<=1.71)
      {
      
      pushMatrix();
      translate(-sF*300,600*sF*(sF-1.85));
      
      pushMatrix();
      translate(600,525);
      if(sF<=1.7)rotate(-sF*PI/1.7);
      else rotate(PI);
      translate(-600,-525);
      pushMatrix();
      translate(600,500);
      strokeWeight(1.5);
      fill(Fc[0],Fc[1],Fc[2]);
      beginShape();
      vertex(0,5);
      vertex(3,-2);
      vertex(9,18);
      vertex(5,65);
      vertex(12,75);
      vertex(13,82);
      vertex(-2,72);
      vertex(-14,78);
      vertex(-3,65);
      vertex(-7,21);
      vertex(-3,0);
      vertex(0,5);
      fill(0);
      endShape();
      circle(2,13,6);
      popMatrix();
      popMatrix();
      popMatrix();    
    }
}

void dejou()
{
  
      if(sF<=1.71)
      {
      
      pushMatrix();
      translate(-sF*500,600*sF*(sF-1.85));
      
      pushMatrix();
      translate(600,525);
      if(sF<=1.7)rotate(-sF*PI/1.7);
      else rotate(PI);
      translate(-600,-525);
      pushMatrix();
     translate(450,300);
     strokeWeight(1.5);
     fill(Fc[0],Fc[1],Fc[2]);

      fill( 0 );
      noStroke();
      scale(0.8);
      ellipse( 298, 150, 103, 132 );
      fill( 190,220,250 );
      ellipse( 368, 132, 155, 190 );
      fill( 0 );
      ellipse( 200, 230, 253, 200 );
      fill( 190,220,250 );
      ellipse( 198, 202, 116, 186 );
      fill( 0 );
      ellipse( 198, 196, 200, 134 );
      fill( 190,220,250 );
      ellipse( 198, 204, 89, 58 );

     popMatrix();      
      popMatrix();
      popMatrix();    
    }
}

void drawbox()
{
  strokeWeight(1.5);
  stroke(0);
  fill(130,160,210);
  beginShape();
  vertex(35,330);
  vertex(20,330);
  vertex(22,338);
  vertex(30,340);
  vertex(40,420);
  vertex(170,420);
  vertex(180,340);
  vertex(188,338);
  vertex(190,330);
  vertex(175,330);
  vertex(170,334);
  vertex(40,334);
  vertex(35,330);
  endShape();
}
