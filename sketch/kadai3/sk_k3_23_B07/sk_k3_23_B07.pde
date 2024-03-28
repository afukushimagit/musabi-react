/**
 
 自動販売機型のデジタル時計
 秒単位で自動販売機のボタンの色が変わる
 分が切り替わった後、飲料の番号を選択するスクリーンの数字がが変わる。
 時が切り替わった後、ドリンクポスターの飲み物の色が変わる。
 
 */
void setup()
{
  size (500, 705);
  background(#E8BEBE);
  translate( 0, 20 );
  fill(0);
  rect (30, 40, 330, 475, 20); //大きいガラス
  rect (385, 275, 90, 140); //番号枠
  rect (30, 560, 330, 85, 20); //出口

  fill(255, 50);
  rect (30, 560, 330, 65, 20); //出口透明

  fill(0);
  rect (432, 560, 35, 30, 5); //小銭
  rect (385, 60, 90, 180);

  fill(0);
  ellipse (417, 468, 63, 63);
  ellipse (456, 454, 35, 35);
  rect (418, 436, 35, 20);
  fill(200);
  ellipse (456, 454, 26, 26); //小銭
  ellipse (407, 469, 15, 15);
  rect (410, 463, 24, 4);

  noStroke();
  rect (409, 462, 27, 4);
  ellipse (420, 466, 26, 6);
  fill(50);
  rect (446, 451, 20, 4);

  stroke(10);
  fill(255);
  rect (395, 283, 70, 50, 5);
  rect (395, 345, 15, 15, 3);
  rect (411, 345, 15, 15, 3);
  rect (427, 345, 15, 15, 3);
  rect (395, 361, 15, 15, 3);
  rect (411, 361, 15, 15, 3);
  rect (427, 361, 15, 15, 3);
  rect (395, 377, 15, 15, 3);
  rect (411, 377, 15, 15, 3);
  rect (427, 377, 15, 15, 3);
  rect (395, 393, 15, 15, 3);
  rect (411, 393, 15, 15, 3);
  rect (427, 393, 15, 15, 3); //番号




  fill(225);
  rect (30, 164, 330, 31);
  rect (30, 320, 330, 31);
  rect (30, 470, 330, 31); //ボタン台


  for (int a =57; a<310; a+=62) //3階ボタン
  {
    fill(60);
    rect (a, 170, 30, 10);
  }

  for (int a =57; a<310; a+=62) //2階ボタン
  {
    fill(60);
    rect (a, 326, 30, 10);
  }

  for (int a =57; a<310; a+=62) //1階ボタン
  {
    fill(60);
    rect (a, 476, 30, 10);
  }


  for (int a =78; a<330; a+=62) //3階光
  {
    fill(#FF2929);
    ellipse (a, 175, 8, 8);
  }
  for (int a =78; a<330; a+=62) //2階光
  {
    fill(#FF2929);
    ellipse (a, 331, 8, 8);
  }
  for (int a =78; a<330; a+=62) //1階光
  {
    fill(#FF2929);
    ellipse (a, 481, 8, 8);
  }


  for (int b =55; b<305; b+=62) // 飲み物1
  {
    fill(255);
    rect (b, 88, 35, 60);
  }
  for (int c=73; c<323; c+=62) // 飲み物2
  {
    fill(255);
    ellipse (c, 90, 35, 15);
  }


  for (int b =55; b<305; b+=62) // 飲み物2-1
  {
    fill(255);
    rect (b, 244, 35, 60);
  }
  for (int c=73; c<323; c+=62) // 飲み物2-2
  {
    fill(255);
    ellipse (c, 246, 35, 15);
  }


  for (int b =55; b<305; b+=62) // 飲み物3-1
  {
    fill(255);
    rect (b, 395, 35, 60);
  }
  for (int c=73; c<323; c+=62) // 飲み物3-2
  {
    fill(255);
    ellipse (c, 396, 35, 15);
  }


  for (int a =73; a<325; a+=62) // 蓋１
  {
    fill (#B4B4B4);
    ellipse (a, 90, 28, 9);
  }
  for (int b =73; b<323; b+=62) // 蓋2
  {
    fill (#B4B4B4);
    ellipse (b, 246, 28, 9);
  }
  for (int c=73; c<323; c+=62) // 蓋3
  {
    fill (#B4B4B4);
    ellipse (c, 396, 28, 9);
  }



  noStroke();
  for (int a =73; a<325; a+=62) // 飲み物3
  {
    fill(255);
    ellipse (a, 147, 34, 18);
  }

  noStroke();
  for (int a =73; a<325; a+=62) // 飲み物2-3
  {
    fill(255);
    ellipse (a, 304, 34, 18);
  }

  noStroke();
  for (int a =73; a<325; a+=62) // 飲み物3-3
  {
    fill(255);
    ellipse (a, 454, 34, 18);
  }


  for (int a =57; a<325; a+=62) // ラベル
  {
    fill(170);
    rect (a, 108, 32, 25);
  }

  for (int a =73; a<325; a+=62) // ラベル
  {
    fill(170);
    ellipse(a, 133, 32, 15);
  }

  for (int a =73; a<325; a+=62) // ラベル
  {
    fill(255);
    ellipse(a, 110, 34, 17);
  }



  for (int b =57; b<325; b+=62) // ラベル2
  {
    fill(170);
    rect (b, 265, 32, 25);
  }

  for (int b =73; b<325; b+=62) // ラベル2
  {
    fill(170);
    ellipse(b, 290, 32, 15);
  }

  for (int b =73; b<325; b+=62) // ラベル2
  {
    fill(255);
    ellipse(b, 266, 34, 17);
  }


  for (int c =57; c<325; c+=62) // ラベル3
  {
    fill(170);
    rect (c, 414, 32, 25);
  }

  for (int c =73; c<325; c+=62) // ラベル3
  {
    fill(170);
    ellipse(c, 440, 32, 15);
  }

  for (int c =73; c<325; c+=62) // ラベル3
  {
    fill(255);
    ellipse(c, 416, 34, 17);
  }


  fill(#A75D4E);
  textSize(45);
  text("Take Drink", 30, 33); //自販機タイトル


  noStroke();
  fill(100);
  textSize(15);
  text("1", 399, 358);
  text("2", 415, 358);
  text("3", 431, 358);
  text("4", 399, 374);
  text("5", 415, 374);
  text("6", 431, 374);
  text("7", 399, 390);
  text("8", 415, 390);
  text("9", 431, 390);
  text("0", 415, 406); //　番号ボタン

  fill(#B9B9B9, 105);
  quad(170, 40, 40, 164, 100, 164, 230, 40);
  quad(270, 40, 30, 270, 30, 350, 350, 40);
  quad(150, 517, 290, 517, 360, 450, 360, 300); //ガラス表現
}

void draw()
{
  translate( 0, 20 );
  fill(255);
  rect (395, 283, 70, 50, 5);
  fill(0);
  textSize( 40 );
  text( minute(), 410, 320 );

  //　ポスター広告
  rect (385, 60, 90, 180);
  noStroke();
  fill(#FAE5B8, 230);
  rect (387, 179, 87, 60); //砂
  fill(#B4EEF7, 230);
  rect (387, 62, 87, 90); //空
  fill(255);
  rect (387, 115, 15, 50);
  ellipse (404, 140, 30, 50);
  ellipse (424, 140, 40, 35); //雲
  fill(#72CEDE);
  rect (387, 150, 87, 40); //海
  fill(255, 200);
  ellipse (398, 188, 20, 15);
  ellipse (409, 188, 22, 14);
  ellipse (425, 190, 21, 15);
  ellipse (430, 189, 20, 15);
  ellipse (445, 187, 20, 15);
  ellipse (463, 188, 23, 15); //泡

  fill(#3B909B);
  textSize(13);
  text("summer", 392, 85);
  textSize(28);
  text("DRINK", 390, 110); //　広告タイトル


  fill(245, 100);
  stroke(10);
  rect (411, 150, 39, 60);
  ellipse (431, 150, 39, 15);
  ellipse (431, 210, 39, 18); //グラス


  int iHour = hour();
  int iHourFrame = 60 * 60 * 60;

  noStroke();
  fill(#FFA17E *iHour, 230);
  rect (414, 170, 34, 40);
  ellipse (431, 208, 34, 18);
  fill(#FFA17E*iHour);
  ellipse (431, 170, 34, 18); //ドリンクの中身

  stroke(10);
  fill(#DB2A2A);
  ellipse (410, 215, 15, 15); //チェリー
  line(404, 200, 408, 211); //チェリーのヘタ

  strokeWeight( 2);
  stroke(#984526, 150);
  line(462, 120, 418, 213); //ストロー
  strokeWeight(1);


  noStroke();
  fill(255, 90);
  quad(435, 158, 435, 219, 445, 216, 445, 155);


  noStroke();
  int iSecond = second();

  fill(#FF5A39 * iSecond - 90);
  for (int a =78; a<330; a+=62) //3階光
  {
    ellipse (a, 175, 8, 8);
  }


  for (int a =78; a<330; a+=62) //2階光
  {
    ellipse (a, 331, 8, 8);
  }


  for (int a =78; a<330; a+=62) //1階光
  {
    ellipse (a, 481, 8, 8);
  }
}
