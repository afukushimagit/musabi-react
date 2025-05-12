/**************************************************************
沢山並ぶピザを描きました。参考作品の時計の奴とパックマンみたいな奴から着想を得ました。
サラミ、バジル、切り方は多少数値が違うだけでほとんど同じコードになっています。
ランダムを多用しているので一期一会なピザたちです。
 **************************************************************/
size(500, 500);      // Window Size
background(255);
// -----------------------------------

for (int i = 50; i < 500; i += 100) { // 横に並べる

  for (int j = 50; j < 500; j += 100) { // 縦に並べる
    //ピザ生地とケチャップ
    strokeWeight(4);
    stroke(200,150,100);
    fill(230,80,50);
    circle( i, j,90);

    //チーズ
    noStroke();
    fill(240,220,145);
    circle(i,j,random(75,81));
    
    //バジル
    int bzr = int(random(6,11));       //バジルの数
    int bzrzr = int(random(0.45));     //バジルの一枚目の角度
    
    for(int b =0;b<bzr; b++){
          ellipseMode(RADIUS);
      float B_angle = 360 / bzr * b;
      int bx = i + int(sin(radians(B_angle + bzrzr))*23)+int(random(-4,4));
      int by = j + int(cos(radians(B_angle + bzrzr))*23)+int(random(-4,4));
      //バジルを回転させながら配置
      pushMatrix();
      translate(bx,by);
      rotate(radians(random(0,180)));
      fill(45,120,50);
      ellipse(0,0,random(9,12),random(2,5));
      popMatrix();
      ellipseMode(CENTER);
    
    }
    
    //サラミ
    int srm = int(random(4,8));      //サラミの数
    int srmzr = int(random(0.45));   //サラミの一枚目の角度
    //サラミを配置
    for(int s =0;s<srm; s++){
      float S_angle = 360 / srm * s;
      int sx = i + int(sin(radians(S_angle + srmzr))*25)+int(random(-6,6));
      int sy = j + int(cos(radians(S_angle + srmzr))*25)+int(random(-6,6));
      fill(180,25,25);
      circle(sx,sy,random(17,20));
      
    }
    
    
    //ピザ切り分け　chatgptを参考に手を加えました(上のバジルやサラミのコードもこのコードから)
    strokeWeight(3);
    stroke(255);
    int kazu =int(random(4,8));    //切り分ける数
    int zure =int(random(0,120));  //切り分け始めの線の角度をランダムにずらす
    
    for (int p = 0; p < kazu; p++) {
      // 角度を計算
      float P_angle = 360 / kazu * p; // 放射状に等分された角度
      // 切りおわる座標を計算
      float end_x = i + cos(radians(P_angle+zure)) * 48;
      float end_y = j + sin(radians(P_angle+zure)) * 48;
      //切る
      line(i, j, end_x, end_y);
      
    }
    
  }
  
}





// -----------------------------------


// -----------------------------------
save("K2_A12_Fukushima.png");
// -----------------------------------
