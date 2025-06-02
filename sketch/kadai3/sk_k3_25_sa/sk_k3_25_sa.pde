
//６匹の恐竜が一生懸命パンケーキを作る。(秒）
//  ①　　　　０〜７s　　卵を割る
//　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　８〜9s　　移動
//  ②１０〜17s　　小麦粉を入れる
//　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　１８〜１9s　　移動
//  ③２０〜27s　　牛乳を入れる
//　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　2８〜29s　　移動
//  ④３０〜３7s　　混ぜる
//　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　３８〜３9s　　移動
//  ⑤４０〜４7s　　生地を焼く
//　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　４８〜４9s　　移動
//  ⑥５０〜５7s　　バターをのせる・食べる（？）
//　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　５８〜５9s　　移動
//
//役割分担をして頑張っているが、最後の子がどうしても食欲に負けて毎回パンケーキを食べてしまう。パンケーキがなくなる代わりに
//最後の子は元気になって、一つ食べるごとに、つのが１本生えてくる。（分）
//10個食べて、つのが１０本生えるとお腹がいっぱいになるので（10分）、左側の子に交代する。自分は上段の左端にいく。
//役割を一周すると、10分×６匹　で60分になる。　１時間も経つと流石にみんな食べすぎたことに気がつくので、最後の最後、
//毎時間59分にできるパンケーキは食べずに、新しいバターをのせて送り出す。そうして作られたパンケーキは、画面下側に
//並べられる。（時）
//1日にできるパンケーキは24個で、最後の１個が作られたと同時に、まとめて出荷される。

void setup() {
  size(800, 850);
  rectMode(CENTER);
  frameRate(1000);
}

void draw() {
  int s = second();
  int m = minute();
  int h = hour();

  colorMode(HSB, 360, 100, 100);

  color k = color(85, 64, 57);//恐竜の色
  color w = color(0, 0, 99);//白色
  color e = color(34, 18, 99);//白色
  color g = color(360, 0, 83, 50);//白身の色
  color y = color(41, 74, 99);//黄身の色

  background(62, 11, 99);

  //後ろ　灰色パンケーキ
  for (int d=55; d<=735; d+=60) {
    noStroke();
    for (int a=0; a>-25; a=a-1) {
      fill(48, 0, 82);
      ellipse(d, 3*a/3*0.3+20/3*0.3+760, 300/1.5*0.28+a*2/1.5*0.28, 230/1.5*0.28+a*3/1.5*0.28);
    }
    for (int a=0; a>-25; a=a-1) {
      fill(48, 0, 82);
      ellipse(d+30, 3*a/3*0.3+20/3*0.3+800, 300/1.5*0.28+a*2/1.5*0.28, 230/1.5*0.28+a*3/1.5*0.28);
    }
  }

  //前　色付きパンケーキ
  if (h<=12) {
    for (int d=55; d<=h*60; d+=60) {
      for (int a=0; a>-25; a=a-1) {
        fill(54+a/2.5, 64-a*1.5, 99+a);
        ellipse(d, 3*a/3*0.3+20/3*0.3+760, 300/1.5*0.28+a*2/1.5*0.28, 230/1.5*0.28+a*3/1.5*0.28);
      }//上　12個

      fill(57, 99, 99, 60);
      ellipse(d, -25*0.28+760, 140*0.28, 100*0.28);//溶けたバター
      for (int c=0; c<=5; c++) {
        fill(57, 99, 99);//溶ける前バター
        quad(d, -10*0.28+c*0.28+760, -30*0.28+d, -30*0.28+c*0.28+760, d, -50*0.28+c*0.28+760, 30*0.28+d, -30*0.28+c*0.28+760);
      }
    }
  } else if (12<h) {
    for (int d=55; d<=720; d+=60) {
      for (int a=0; a>-25; a=a-1) {
        fill(54+a/2.5, 64-a*1.5, 99+a);
        ellipse(d, 3*a/3*0.3+20/3*0.3+760, 300/1.5*0.28+a*2/1.5*0.28, 230/1.5*0.28+a*3/1.5*0.28);
      }//上　12個　（下が増えている時も上は表示）
      fill(57, 99, 99, 60);
      ellipse(d, -25*0.28+760, 140*0.28, 100*0.28);//上　溶けたバター
      for (int c=0; c<=5; c++) {
        fill(57, 99, 99);//上　溶ける前バター
        quad(d, -10*0.28+c*0.28+760, -30*0.28+d, -30*0.28+c*0.28+760, d, -50*0.28+c*0.28+760, 30*0.28+d, -30*0.28+c*0.28+760);
      }
    }
    for (int d=55; d<=h*60-12*60; d+=60) {
      for (int a=0; a>-25; a=a-1) {
        fill(54+a/2.5, 64-a*1.5, 99+a);
        ellipse(d+30, 3*a/3*0.3+20/3*0.3+800, 300/1.5*0.28+a*2/1.5*0.28, 230/1.5*0.28+a*3/1.5*0.28);
      }//下　12個

      fill(57, 99, 99, 60);
      ellipse(d+30, -25*0.28+800, 140*0.28, 100*0.28);//下　溶けたバター
      for (int c=0; c<=5; c++) {
        fill(57, 99, 99);//下　溶ける前バター
        quad(d+30, -10*0.28+c*0.28+800, -30*0.28+d+30, -30*0.28+c*0.28+800, d+30, -50*0.28+c*0.28+800, 30*0.28+d+30, -30*0.28+c*0.28+800);
      }
    }
  }

  //恐竜　上　左
  if (10<=m) {
    strokeWeight(25);
    stroke(359, 42, 99);//赤色つの
    //stroke(85,84,29);//緑つの
    line(115, 75, 130, 200);
    line(145, 75, 130, 200);
    line(85, 85, 130, 200);
    line(175, 85, 130, 200);
    line(60, 105, 130, 200);
    line(200, 105, 130, 200);
    line(43, 133, 130, 200);
    line(217, 133, 130, 200);
    line(33, 165, 130, 200);
    line(227, 165, 130, 200);
  }
  noStroke();
  fill(k);
  ellipse(130, 200, 200, 250);

  fill(w);
  ellipse(90, 120, 25, 35);//左　白目
  ellipse(170, 120, 25, 35);//右　白目
  fill(0, 0, 0);
  ellipse(90, 128, 15, 20);//左　黒目
  ellipse(170, 128, 15, 20);//右　黒目

  //卵割る
  fill(e);
  if (0<=s && s<8 && s%2==0 ) {
    fill(e);
    ellipse(130, 170, 50, 40);
  } else if (0<=s && s<8&&s%2==1) {
    fill(e);
    ellipse(120, 170, 50, 40);
    ellipse(140, 170, 50, 40);
    fill(85, 64, 57);
    rect(130, 170, 20, 40);
  } else if (8<=s&&s<10) {
    fill(e);
    ellipse(130, 170, 50, 40);
  }


  //つの 上　中
  if (20<=m) {
    strokeWeight(25);
    stroke(359, 42, 99);//赤色つの
    //stroke(85,84,29);//緑つの
    line(115+270, 75, 400, 200);
    line(145+270, 75, 400, 200);
    line(85+270, 85, 400, 200);
    line(175+270, 85, 400, 200);
    line(60+270, 105, 400, 200);
    line(200+270, 105, 400, 200);
    line(43+270, 133, 400, 200);
    line(217+270, 133, 400, 200);
    line(33+270, 165, 400, 200);
    line(227+270, 165, 400, 200);
  }
  fill(k);
  noStroke();
  ellipse(400, 200, 200, 250);//恐竜 上　中

  fill(w);
  ellipse(90+270, 120, 25, 35);//左　白目
  ellipse(170+270, 120, 25, 35);//右　白目
  fill(0, 0, 0);
  ellipse(90+270, 128, 15, 20);//左　黒目
  ellipse(170+270, 128, 15, 20);//右　黒目

  //つの　上　右
  if (30<=m) {
    strokeWeight(25);
    stroke(359, 42, 99);//赤色つの
    //stroke(85,84,29);//緑つの
    line(115+540, 75, 670, 200);
    line(145+540, 75, 670, 200);
    line(85+540, 85, 670, 200);
    line(175+540, 85, 670, 200);
    line(60+540, 105, 670, 200);
    line(200+540, 105, 670, 200);
    line(43+540, 133, 670, 200);
    line(217+540, 133, 670, 200);
    line(33+540, 165, 670, 200);
    line(227+540, 165, 670, 200);
  }
  fill(k);
  noStroke();
  ellipse(670, 200, 200, 250);//恐竜　上　右

  fill(w);
  ellipse(90+540, 120, 25, 35);//左　白目
  ellipse(170+540, 120, 25, 35);//右　白目

  fill(0, 0, 0);
  ellipse(90+540, 128, 15, 20);//左　黒目
  ellipse(170+540, 128, 15, 20);//右　黒目

  //つの　下　左　
  if (40<=m) {
    strokeWeight(25);
    stroke(359, 42, 99);//赤色つの
    //stroke(85,84,29);//緑つの
    line(115, 75+350, 130, 200+350);
    line(145, 75+350, 130, 200+350);
    line(85, 85+350, 130, 200+350);
    line(175, 85+350, 130, 200+350);
    line(60, 105+350, 130, 200+350);
    line(200, 105+350, 130, 200+350);
    line(43, 133+350, 130, 200+350);
    line(217, 133+350, 130, 200+350);
    line(33, 165+350, 130, 200+350);
    line(227, 165+350, 130, 200+350);
  }
  fill(k);
  noStroke();
  ellipse(130, 550, 200, 250);//恐竜　　下　左　

  fill(w);
  ellipse(90, 120+350, 25, 35);//左　白目
  ellipse(170, 120+350, 25, 35);//右　白目

  fill(0, 0, 0);
  ellipse(90, 128+350, 15, 20);//左　黒目
  ellipse(170, 128+350, 15, 20);//右　黒目



  //つの　下　中　
  if (50<=m) {
    strokeWeight(25);
    stroke(359, 42, 99);//赤色つの
    //stroke(85,84,29);//緑つの
    line(115+270, 75+350, 400, 200+350);
    line(145+270, 75+350, 400, 200+350);
    line(85+270, 85+350, 400, 200+350);
    line(175+270, 85+350, 400, 200+350);
    line(60+270, 105+350, 400, 200+350);
    line(200+270, 105+350, 400, 200+350);
    line(43+270, 133+350, 400, 200+350);
    line(217+270, 133+350, 400, 200+350);
    line(33+270, 165+350, 400, 200+350);
    line(227+270, 165+350, 400, 200+350);
  }
  fill(k);
  noStroke();
  ellipse(400, 550, 200, 250);//恐竜　下　中　

  fill(w);
  ellipse(90+270, 120+350, 25, 35);//左　白目
  ellipse(170+270, 120+350, 25, 35);//右　白目

  fill(0, 0, 0);
  ellipse(90+270, 128+350, 15, 20);//左　黒目
  ellipse(170+270, 128+350, 15, 20);//右　黒目

  //つの　下　右　1分ごとに１本つのが生える。10分（本）で
  strokeWeight(25);
  stroke(359, 42, 99);//赤色つの
  if (m%10==1) {
    line(115+540, 75+350, 670, 200+350);
  } else if (m%10==2) {
    line(115+540, 75+350, 670, 200+350);
    line(145+540, 75+350, 670, 200+350);
  } else if (m%10==3) {
    line(115+540, 75+350, 670, 200+350);
    line(145+540, 75+350, 670, 200+350);
    line(85+540, 85+350, 670, 200+350);
  } else if (m%10==4) {
    line(115+540, 75+350, 670, 200+350);
    line(145+540, 75+350, 670, 200+350);
    line(85+540, 85+350, 670, 200+350);
    line(175+540, 85+350, 670, 200+350);
  } else if (m%10==5) {
    line(115+540, 75+350, 670, 200+350);
    line(145+540, 75+350, 670, 200+350);
    line(85+540, 85+350, 670, 200+350);
    line(175+540, 85+350, 670, 200+350);
    line(60+540, 105+350, 670, 200+350);
  } else if (m%10==6) {
    line(115+540, 75+350, 670, 200+350);
    line(145+540, 75+350, 670, 200+350);
    line(85+540, 85+350, 670, 200+350);
    line(175+540, 85+350, 670, 200+350);
    line(60+540, 105+350, 670, 200+350);
    line(200+540, 105+350, 670, 200+350);
  } else if (m%10==7) {
    line(115+540, 75+350, 670, 200+350);
    line(145+540, 75+350, 670, 200+350);
    line(85+540, 85+350, 670, 200+350);
    line(175+540, 85+350, 670, 200+350);
    line(60+540, 105+350, 670, 200+350);
    line(200+540, 105+350, 670, 200+350);
    line(43+540, 133+350, 670, 200+350);
  } else if (m%10==8) {
    line(115+540, 75+350, 670, 200+350);
    line(145+540, 75+350, 670, 200+350);
    line(85+540, 85+350, 670, 200+350);
    line(175+540, 85+350, 670, 200+350);
    line(60+540, 105+350, 670, 200+350);
    line(200+540, 105+350, 670, 200+350);
    line(43+540, 133+350, 670, 200+350);
    line(217+540, 133+350, 670, 200+350);
  } else if (m%10==9) {
    line(115+540, 75+350, 670, 200+350);
    line(145+540, 75+350, 670, 200+350);
    line(85+540, 85+350, 670, 200+350);
    line(175+540, 85+350, 670, 200+350);
    line(60+540, 105+350, 670, 200+350);
    line(200+540, 105+350, 670, 200+350);
    line(43+540, 133+350, 670, 200+350);
    line(217+540, 133+350, 670, 200+350);
    line(33+540, 165+350, 670, 200+350);
  }
  fill(k);
  noStroke();
  ellipse(670, 550, 200, 250);//恐竜　下　右　

  fill(w);
  ellipse(90+540, 120+350, 25, 35);//左　白目
  ellipse(170+540, 120+350, 25, 35);//右　白目

  fill(0, 0, 0);
  ellipse(90+540, 128+350, 15, 20);//左　黒目
  ellipse(170+540, 128+350, 15, 20);//右　黒目


  strokeWeight(150);

  //レールの影
  stroke(0, 0, 42);
  line(0, 290, 800, 290);
  line(0, 640, 800, 640);

  //レール
  stroke(0, 0, 58);
  line(0, 275, 800, 275);
  line(0, 625, 800, 625);

  //レール凹凸　濃いグレー
  strokeWeight(10);
  stroke(0, 0, 42);
  line(0, 230, 800, 230);
  line(0, 320, 800, 320);
  line(0, 580, 800, 580);
  line(0, 670, 800, 670);

  //レール凹凸　薄いグレー
  strokeWeight(5);
  stroke(0, 0, 82);
  line(0, 225, 800, 225);
  line(0, 315, 800, 315);
  line(0, 575, 800, 575);
  line(0, 665, 800, 665);


  //動く皿　10秒ごとに動く（大きい動き）
  fill(w);
  noStroke();
  if (0<=s && s<=9) {
    translate(130, 275);
  } else if (10<=s && s<=19) {
    translate(400, 275);
  } else if (20<=s && s<=29) {
    translate(670, 275);
  } else if (30<=s && s<=39) {
    translate(130, 625);
  } else if (40<=s && s<=49) {
    translate(400, 625);
  } else if (50<=s && s<=59) {
    translate(670, 625);
  }

  //動く皿（小さい動き）　０〜７秒は停止、８、９秒で移動
  noStroke();
  if (s%10==8) {
    ellipse(100, 0, 160, 140);
  } else if (s%10==9) {
    ellipse(200, 0, 160, 140);
  } else {
    ellipse(0, 0, 160, 140);
  }

  //料理工程
  if (1<=s&&s<3) {
    fill(g);
    ellipse(-30, -20, 60, 50);
    fill(y);
    ellipse(-30, -30, 25, 20);//卵1個　割る
  } else if (3<=s&&s<5) {
    fill(g);
    ellipse(-30, -20, 60, 50);
    ellipse(30, -20, 60, 50);
    fill(y);
    ellipse(-30, -30, 25, 20);
    ellipse(30, -30, 25, 20);//卵２個　割る
  } else if (5<=s&&s<7) {
    fill(g);
    ellipse(-30, -20, 60, 50);
    ellipse(30, -20, 60, 50);
    ellipse(-30, 20, 60, 50);
    fill(y);
    ellipse(-30, -30, 25, 20);
    ellipse(30, -30, 25, 20);
    ellipse(-30, 10, 25, 20);//卵３個　割る
  } else if (7<=s&&s<8) {
    draweggs();//卵４個　割る
  } else if (8<=s && s<9) {
    translate(100, 0);
    draweggs();
  } else if (9<=s && s<10) {
    translate(100+100, 0);
    draweggs();////移動
  } else if (10<=s && s<11) {
    translate(0, 0);
    draweggs();
    drawflourpacup();//小麦粉準備
  } else if (11<=s&&s<12) {
    translate(0, 0);
    draweggs();
    for (int b=0; b<30; b++) {
      fill(41, 14, 99);
      ellipse(0, b-20, 2*b, b);
    }
    drawflourpacdown();//小麦粉　下に振る
  } else if (12<=s&&s<13) {
    translate(0, 0);
    draweggs();
    for (int b=0; b<30; b++) {
      fill(41, 14, 99);
      ellipse(0, b-20, 2*b, b);
    }
    drawflourpacup();//小麦粉　上に上げる
  } else if (13<=s&&s<14) {
    translate(0, 0);
    draweggs();
    for (int b=0; b<40; b++) {
      fill(41, 14, 99);
      ellipse(0, b-30, 2*b, b);
    }
    drawflourpacdown();//小麦粉　下に振る
  } else if (14<=s&&s<15) {
    translate(0, 0);
    draweggs();
    for (int b=0; b<40; b++) {
      fill(41, 14, 99);
      ellipse(0, b-30, 2*b, b);
    }
    drawflourpacup(); //小麦粉　上に上げる
  } else if (15<=s&&s<16) {
    translate(0, 0);
    draweggs();
    for (int b=0; b<50; b++) {
      fill(41, 14, 99);
      ellipse(0, b-40, 2*b, b);
    }
    drawflourpacdown();//小麦粉　下に振る
  } else if (16<=s&&s<17) {
    translate(0, 0);
    draweggs();
    for (int b=0; b<50; b++) {
      fill(41, 14, 99);
      ellipse(0, b-40, 2*b, b);
    }
    drawflourpacup();//小麦粉　上に上げる
  } else if (17<=s&&s<18) {
    translate(0, 0);
    drawflour();
    for (int b=0; b<50; b++) {
      fill(41, 14, 99);
      ellipse(0, b-35, 2*b, b);
    }

    drawflourpacdown(); //小麦粉　下に振る
  } else if (18<=s && s<19) {
    translate(100, 0);
    drawflour();
    translate(-100, 0);
    drawflourpacup(); //小麦粉　上に上げる ＆移動
  } else if (19<=s && s<20) {
    translate(100+100, 0);
    drawflour();
    translate(-200, 0);
    drawflourpacup();  //小麦粉　上にあげたまま ＆移動
  } else if (20<=s && s<21) {
    translate(0, 0);
    drawflour();
    drawmilkpacdown();//牛乳パック　止める
  } else if (21<=s && s<22) {
    translate(0, 0);
    drawflour();
    stroke(178, 11, 99);
    strokeWeight(10);
    line(0, -10, 0, -60);
    noStroke();
    drawmilkpacup();//牛乳パック 注ぐ
  } else if (22<=s && s<23) {
    translate(0, 0);
    drawflour();
    drawmilkpacdown();//牛乳パック　止める
  } else if (23<=s && s<24) {
    drawflour();
    stroke(178, 11, 99);
    strokeWeight(10);
    line(0, -10, 0, -60);
    noStroke();
    drawmilkpacup();//牛乳パック 注ぐ
  } else if (24<=s && s<25) {
    translate(0, 0);
    drawflour();
    drawmilkpacdown();//牛乳パック　止める
  } else if (25<=s && s<26) {
    translate(0, 0);
    drawflour();
    stroke(178, 11, 99);
    strokeWeight(10);
    line(0, -10, 0, -60);
    noStroke();
    drawmilkpacup();//牛乳パック 注ぐ
  } else if (26<=s && s<27) {
    translate(0, 0);
    drawflour();
    drawmilkpacdown();//牛乳パック　止める
  } else if (27<=s && s<28) {
    translate(0, 0);
    drawflour();
    stroke(178, 11, 99);
    strokeWeight(10);
    line(0, -10, 0, -60);
    noStroke();
    fill(178, 33, 99, 70);
    ellipse(0, 0, 120, 100);
    noStroke();
    drawmilkpacup();//牛乳パック 注ぐ＆牛乳がたまる
  } else if (28<=s && s<29) {
    translate(100, 0);
    drawflour();
    noStroke();
    fill(178, 33, 99, 70);
    ellipse(0, 0, 120, 100);
    translate(-100, 0);
    drawmilkpacdown();//牛乳パック　止めたまま＆移動
  } else if (29<=s && s<30) {
    translate(100+100, 0);
    drawflour();
    fill(178, 33, 99, 70);
    ellipse(0, 0, 120, 100);
    translate(-200, 0);
    drawmilkpacdown();//牛乳パック　止めたまま＆移動

    //下段に移動
  } else if (30<=s && s<31) {
    translate(0, 0);
    drawflour();
    noStroke();
    fill(178, 33, 99, 70);
    ellipse(0, 0, 120, 100);
    drawrightmixiser();//ハンドミキサー準備　右
  } else if (31<=s && s<32) {
    translate(0, 0);
    drawflour();
    noStroke();
    fill(178, 33, 99, 70);
    ellipse(0, 0, 120, 100);
    drawleftmixiser();//ハンドミキサー　左
  } else if (32<=s && s<33) {
    translate(0, 0);
    drawflour();
    noStroke();
    fill(178, 33, 99, 70);
    ellipse(0, 0, 120, 100);
    drawrightmixiser();//ハンドミキサー　右
  } else if (33<=s && s<34) {
    translate(0, 0);
    drawmaterial();
    drawleftmixiser();//ハンドミキサー　左＆生地混ざる
  } else if (34<=s && s<35) {
    translate(0, 0);
    drawmaterial();
    drawrightmixiser();//ハンドミキサー　右
  } else if (35<=s && s<36) {
    translate(0, 0);
    drawmaterial();
    drawleftmixiser();//ハンドミキサー　左
  } else if (36<=s && s<37) {
    translate(0, 0);
    drawmaterial();
    drawrightmixiser();//ハンドミキサー　右
  } else if (37<=s && s<38) {
    translate(0, 0);
    drawmaterial();
    drawleftmixiser();//ハンドミキサー　左
  } else if (38<=s && s<39) {
    translate(100, 0);
    drawmaterial();
    translate(-100, 0);
    drawrightmixiser();//ハンドミキサー　右&移動
  } else if (39<=s && s<40) {
    translate(100+100, 0);
    drawmaterial();
    translate(-200, 0);
    drawrightmixiser();//ハンドミキサー　右&移動
  } else if (40<=s && s<41) {
    translate(0, 0);
    drawmaterial();
    drawcheek();//ほっぺた　ふくらむ
  } else if (41<=s && s<42) {
    translate(0, 0);
    drawmaterial();
    drawfire();//炎を吹く
  } else if (42<=s && s<43) {
    translate(0, 0);
    drawmaterial();
    drawcheek();//ほっぺた　ふくらむ
  } else if (43<=s && s<44) {
    translate(0, 0);
    drawmaterial();
    drawfire();//炎を吹く
  } else if (44<=s && s<45) {
    translate(0, 0);
    drawmaterial();
    drawcheek();//ほっぺた　ふくらむ
  } else if (45<=s && s<46) {
    translate(0, 0);
    drawmaterial();
    drawfire();//炎を吹く
  } else if (46<=s && s<47) {
    translate(0, 0);
    drawcheek();
    drawpancake();//ほっぺた　ふくらむ＆パンケーキが焼ける
  } else if (47<=s && s<48) {
    translate(0, 0);
    drawfire();//炎を吹く
  } else if (48<=s && s<49) {
    translate(0, 0);
    drawcheek();
    translate(100, 0);
    drawpancake();//ほっぺた　ふくらむ＆焼けたパンケーキ移動
  } else if (49<=s && s<50) {
    translate(100+100, 0);
    drawpancake();
    translate(-280, -100);
    scale(0.4);
    drawfire();//小さく炎を吹く（余韻）＆焼けたパンケーキ移動
  } else if (50<=s&&s<51) {
    translate(0, 0);
    drawpancake();//焼けたパンケーキ移動してくる
  } else if (51<=s&&s<52) {
    translate(0, 0);
    drawpancake();
    for (int c=0; c<=25; c++) {
      fill(57, 99, 99);
      quad(0, -30+c, -30, -50+c, 0, -70+c, 30, -50+c);
    }//パンケーキにバターをのせる
  } else if (52<=s&&s<53) {
    drawpancake();
    fill(57, 99, 99, 60);
    ellipse(0, -25, 70, 40);
    for (int c=0; c<=20; c++) {
      fill(57, 99, 99);
      quad(0, -25+c, -30, -45+c, 0, -65+c, 30, -45+c);
    }//バターが溶ける　１
  } else if (53<=s&&s<54) {
    drawpancake();
    fill(57, 99, 99, 60);
    ellipse(0, -25, 90, 60);
    for (int c=0; c<=15; c++) {
      fill(57, 99, 99);
      quad(0, -20+c, -30, -40+c, 0, -60+c, 30, -40+c);
    }//バターが溶ける　２
  } else if (54<=s&&s<55) {
    drawpancake();
    fill(57, 99, 99, 60);
    ellipse(0, -25, 110, 80);
    for (int c=0; c<=10; c++) {
      fill(57, 99, 99);
      quad(0, -15+c, -30, -35+c, 0, -55+c, 30, -35+c);
    }//バターが溶ける　３
  } else if (55<=s&&s<56) {
    drawpancake();
    fill(57, 99, 99, 60);
    ellipse(0, -25, 140, 100);
    for (int c=0; c<=5; c++) {
      fill(57, 99, 99);
      quad(0, -10+c, -30, -30+c, 0, -50+c, 30, -30+c);
    }
  }//バターが溶ける　４

  //以下５６〜60秒
  //毎時間59分の時はバターが全て溶け、新しいバターをのせる。毎時間59分以外は、恐竜がパンケーキを食べてほっぺたが膨らむ。
  if (56<=s&&s<57) {
    if (m==59) {
      translate(0, 0);
      drawpancake();
      fill(57, 99, 99, 60);
      ellipse(0, -25, 155, 110);//バターが全て溶ける
    } else {
      translate(0, 0);
      drawcheek();//恐竜がパンケーキを食べてほっぺたが膨らむ。
    }
  }
  if (57<=s&&s<58) {
    if (m==59) {
      translate(0, 0);
      drawpancake();
      fill(57, 99, 99, 60);
      ellipse(0, -25, 155, 110);
      for (int c=0; c<=20; c++) {
        fill(57, 99, 99);
        quad(0, -25+c, -30, -45+c, 0, -65+c, 30, -45+c);//59分//新しいバターをのせる
      }
    } else {
      fill(w);
      ellipse(0, 0, 160, 140);//59分以外//空の皿
    }
  }
  if (58<=s&&s<59) {
    if (m==59) {
      translate(100, 0);
      drawbutteronthecake();//59分//完成したパンケーキ　移動
    } else {
      translate(100, 0);
      fill(w);
      ellipse(0, 0, 160, 140);//59分以外//空の皿　移動
    }
  }
  if (59<=s&&s<60) {
    if (m==59) {
      translate(200, 0);
      drawbutteronthecake();//59分//完成したパンケーキ 移動
    } else {
      translate(200, 0);
      fill(w);
      ellipse(0, 0, 160, 140);//59分以外//空の皿　移動
    }
  }
}//void draw 終わり


//卵4つセット
void draweggs() {
  fill(360, 0, 83, 50);
  ellipse(-30, -20, 60, 50);
  ellipse(30, -20, 60, 50);
  ellipse(-30, 20, 60, 50);
  ellipse(30, 20, 60, 50);
  fill(41, 74, 99);//黄身　４つセット
  ellipse(-30, -30, 25, 20);
  ellipse(30, -30, 25, 20);
  ellipse(-30, 10, 25, 20);
  ellipse(25, 10, 23, 18);
  ellipse(40, 30, 20, 17);
}

//パンケーキ　焼き上がり
void drawpancake() {
  scale(0.7);
  for (int a=0; a>-25; a=a-1) {
    fill(54+a/2.5, 64-a*1.5, 99+a);
    ellipse(0, 3*a/3+20/3-10, 300/1.5+a*2/1.5, 230/1.5+a*3/1.5);
  }
}

//小麦粉の山
void drawflour() {
  draweggs();
  for (int b=0; b<50; b++) {
    fill(41, 14, 99);
    ellipse(0, b-35, 2*b+20, b);
  }
}

//小麦粉の袋　上
void drawflourpacup() {
  fill(46, 40, 99);
  rotate(radians(40));
  quad(-30, -155, 30, -155, 30, -75, -30, -75);
  fill(12, 65, 99);
  quad(-30, -85, 30, -85, 30, -75, -30, -75);
  ellipse(0, -115, 50, 30);
}

//小麦粉の袋　下
void drawflourpacdown() {
  fill(46, 40, 99);
  rotate(radians(40));
  quad(-30, -140, 30, -140, 30, -60, -30, -60);
  fill(12, 65, 99);
  quad(-30, -70, 30, -70, 30, -60, -30, -60);
  ellipse(0, -100, 50, 30);
}

//牛乳パック　下
void drawmilkpacdown() {
  translate(0, -60);
  rotate(radians(-60));
  fill(213, 71, 99);
  quad(15, -10, 60, -10, 60, 90, 15, 90);
  fill(0, 0, 99);
  quad(15, -10, 60, -10, 60, 0, 15, 0);
  quad(15, 15, 60, 15, 60, 55, 15, 55);
  fill(213, 0, 77);
  triangle(0, 0, 15, 0, 15, 15);
}

//牛乳パック　上
void drawmilkpacup() {
  translate(0, -60);
  rotate(radians(-110));
  fill(213, 71, 99);
  quad(15, -10, 60, -10, 60, 90, 15, 90);
  fill(0, 0, 99);
  quad(15, -10, 60, -10, 60, 0, 15, 0);
  quad(15, 15, 60, 15, 60, 55, 15, 55);
  fill(213, 0, 77);
  triangle(0, 0, 15, 0, 15, 15);
}

//混ざった生地
void drawmaterial() {
  fill(54, 64, 99);
  ellipse(0, 0, 140, 120);
}

//泡立て器　右
void drawrightmixiser() {
  rotate(radians(30));
  noStroke();
  fill(213, 25, 41);
  quad(-6, -120, 6, -120, 6, -60, -6, -60);
  noFill();
  strokeWeight(1);
  stroke(0, 0, 0);
  ellipse(0, -35, 40, 50);
  ellipse(0, -35, 20, 50);
  line(0, -60, 0, -10);
}

//泡立て器　左
void drawleftmixiser() {
  rotate(radians(-30));
  noStroke();
  fill(213, 25, 41);
  quad(-6, -120, 6, -120, 6, -60, -6, -60);
  noFill();
  strokeWeight(1);
  stroke(0, 0, 0);
  ellipse(0, -35, 40, 50);
  ellipse(0, -35, 20, 50);
  line(0, -60, 0, -10);
}

//ほっぺた
void drawcheek() {
  fill(85, 64, 57);
  ellipse(-75, -130, 50, 50);
  ellipse(75, -130, 50, 50);
}

//炎
void drawfire() {
  for (int b=0; b<150; b++) {
    fill(20, 99, 99);
    ellipse(0, b/1.5-100, b, b);
  }
  scale(0.5);
  for (int b=0; b<150; b++) {
    fill(48, 99, 99);
    ellipse(0, b/1.5-100, b, b);
  }
}

//バターがのったパンケーキ
void drawbutteroncake() {
  drawpancake();
  fill(57, 99, 99, 60);
  ellipse(0, -25, 140, 100);
  for (int c=0; c<=20; c++) {
    fill(57, 99, 99);
    quad(0, -25+c, -30, -45+c, 0, -65+c, 30, -45+c);
  }
}

//新しいバターがのったパンケーキ
void drawbutteronthecake() {
  drawpancake();
  fill(57, 99, 99, 60);
  ellipse(0, -25, 155, 110);
  for (int c=0; c<=20; c++) {
    fill(57, 99, 99);
    quad(0, -25+c, -30, -45+c, 0, -65+c, 30, -45+c);
  }
}
