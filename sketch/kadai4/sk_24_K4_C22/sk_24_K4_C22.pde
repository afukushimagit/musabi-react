/**************************************************************
レンガの壁に伸びるツタをテーマに制作しました。
サンプルコードを参考にしました。
ツタの形が変化,一部レンガの位置、丸さ、色が変化
葉をもう少し工夫したかったのですが無理でした
 **************************************************************/
/**
  デバッグ機能
    実行ウィンドウ内でマウスクリック：再描画
    '1'キー：１枚目のpng出力（~_01.png）
    '2'キー：２枚目のpng出力（~_02.png）
*/
// === 'S'キーを押した時の出力画像名 ===
//  "K4_[クラス][番号]_[苗字]"  ※拡張子(.png)は不要
String pngName = "K4_A12_fukushima";

// === グローバル変数/定数 ===

//色　ランダム
//レンガ　１
int[][] icol = {{ 130,128,129  },
                { 161,160,154  },                 
                { 156,155,151  },                 
                { 158,151,132  },
                { 157,152,145  },
                { 181,177,180  },
                { 168,167,180  },
                { 160,160,160  },
                { 189,189,189  },
                { 169,168,169  },
                { 149,149,158  },
                { 132,128,127  }
                                       };
                                       
//レンガ　２
int[][] icolll = {{ 127,129,133 },
                 {  107,105,108  },                 
                 { 124,125,127  },                 
                 { 145,148,154  },
                 { 130,130,140  },
                 { 178,174,174  }
                                       };
                                       
//窓上                
  int [][] Madoo = {{ 97,101,103,100 },
                   { 115,116,115,100 },                   
                   { 130,131,133,100 }, 
                   { 125,125,123,100 }
                                       };  
                                       
//窓下                
  int [][] Mado = {{ 97,101,103,250 },
                   { 115,116,115,250 },     
                   { 95,95,92,270,250 } ,                
                   { 130,131,133,250 }, 
                   { 125,125,123,250 }
                                       };   
                                   
   //ツタ  葉                            
int [][] Tu = {{ 155,156,87 },
               { 156,153,68 } ,   
               { 174,172,87 },
               { 153,156,89 },
               { 134,137,73 },
               { 185,182,127 },
               { 71,84,30 }
                             };    
                             
int [][] TuTa = {{ 127,136,99 },
                 { 44,49,23 },
                 { 69,74,47 },
                 { 84,96,58 },
                 { 124,135,111 }
                                  };


// === setupには変更を加えないこと ===
void setup()
{
  size(1000, 1000);    // Window Size
  noLoop();            // draw once.
  
}

void draw()
{ 
  // 再描画を行うため，背景色の描画もここに記述する．
  background( 242,244,247 );
  
  // === 再帰関数の呼び出しやその他の描画命令 ===
  
  fill( 45,43,33,200); //200なしで元
  rect(0,0,width,height);
  
  //レンガ　壁 　１と２で色を変える　　 
  strokeWeight(0.2);
 stroke( 73,75,73 );
  fill( 207,205,210,90 );
  
pushMatrix();
  scale(1.5); //小さめに作ってしまったので大きさ調整　　
  
  //１　広めのレンガ
  //１　
  for ( int iX = -55; iX < 1100;iX+= 102.5 )
{
int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );

  rect( iX, -4, 100 ,15 ,random(0,7),random(0,8),random(0,6),random(0,6) ); //１段
  rect( iX, 133, 98 ,15 ,random(0,7),random(0,5),random(0,6),random(0,9) ); //９段
   rect( iX, 461, 98 ,15 ,random(0,7),random(0,5),random(0,6),random(0,9) ); //２８
  rect( iX+30, 530, 98 ,15 ,random(0,7),random(0,5),random(0,6),random(0,9) ); //32
  rect( iX+30, 664, 98 ,15 ,random(0,7),random(0,5),random(0,6),random(0,9) );//40
}
//２
 for ( int iX = -55; iX < 1100;iX+= 102.5 )
{
int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );

   rect( iX, 48.5, 100 ,15 ,random(0,7),random(0,8),random(0,6),random(0,6) ); //４段
   rect( iX+55, 478, 98 ,15 ,random(0,7),random(0,5),random(0,6),random(0,9) );//２９
  rect( iX+30, 617, 98 ,15 ,random(0,7),random(0,5),random(0,6),random(0,9) );//３７
}

//２　中ぐらいのレンガ
//１
 for ( int iX = -40; iX < 1100;iX+= 73 )
{
  int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );

  rect( iX, 77.5, 70 ,15 ,random(0,7),random(0,8),random(0,6),random(0,6) ); //６段
     rect( iX-15, 560, 70 ,15 ,random(0,7),random(0,8),random(0,6),random(0,6) ); //３４
}

//２
 for ( int iX = -40; iX < 1100;iX+= 73 )
{
  int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );

  rect( iX, 13.5, 70 ,15 ,random(0,7),random(0,8),random(0,6),random(0,6) ); //２段
    rect( iX-20, 495, 70 ,15 ,random(0,7),random(0,8),random(0,6),random(0,6) );//３０
}

//３　中ぐらいのレンガ
//１
for ( int iX = -5; iX < 1100;iX+= 69 )
{
  int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );

  rect( iX+5, 30.3, random( 65.1 , 71 ) ,15 ,random(0,10),random(0,20),random(0,6),random(0,9) ); //３段
  rect( iX-15, 422, random( 65.1 , 68 ) ,15 ,random(0,10),random(0,20),random(0,6),random(0,9) );//２６
  rect( iX-10, 600, random( 65.1 , 68 ) ,15 ,random(0,10),random(0,20),random(0,6),random(0,9) ); //３６
}

//２
for ( int iX = -5; iX < 1100;iX+= 69 )
{
  int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );

  rect( iX, random( 114,116 ), random( 65.1 , 68 ) ,15 ,random(0,10),random(0,20),random(0,6),random(0,9) ); //８段
  rect( iX-18, 512, random( 65.1 , 68 ) ,15 ,random(0,10),random(0,20),random(0,6),random(0,9) ); //３１
  rect( iX+8, 647, random( 65.1 , 68 ) ,15 ,random(0,10),random(0,20),random(0,6),random(0,9) ); //39  
}

//中ぐらい　薄めのレンガ
//１
for ( int iX = -5; iX < 1100;iX+= 53 )
{
  int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );
  
  rect( iX+5, 65, 50 ,10 ,random(0,15),random(0,20),random(0,14),random(0,15) ); //５段
  
   pushMatrix();
  translate( -10,0 );
  rect( iX+9, 634, 50 ,random( 10,12 ) ,random(0,15),random(0,20),random(0,14),random(0,15) ); //３８
  popMatrix();
}

//２
for ( int iX = -5; iX < 1100;iX+= 53 )
{
  int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );
  
  pushMatrix();
  translate( -30,0 );
  rect( iX+5, random( 151,153 ), 50 ,random( 10,12 ) ,random(0,15),random(0,20),random(0,14),random(0,15) );//１０段
  popMatrix();
  
   pushMatrix();
  translate( -10,0 );
  rect( iX+9, 547, 50 ,random( 10,12 ) ,random(0,15),random(0,20),random(0,14),random(0,15) ); //３３
  popMatrix();
}

//中ぐらい　狭めのレンガ
//１
for ( int iX = -35; iX < 1100;iX+= 43 )
{
  int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );
  rect( iX+5, 94, 40 ,18.5 ,random(0,10),random(0,20),random(0,6),random(0,9) ); //７段
     rect( iX+20,579, 40 ,18.5 ,random(0,10),random(0,20),random(0,6),random(0,9) );//３５
}
//２
for ( int iX = -35; iX < 1100;iX+= 43 )
{
  int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );
rect( iX+20, 440, 40 ,18.5 ,random(0,10),random(0,20),random(0,6),random(0,9) );//２７
}

//窓上の装飾の見栄えを良くするために幅調整
//１１段
for ( int iX = -5; iX < 400;iX+= 53 )  
{
  int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );

 pushMatrix();
  translate( -10,0 );
  rect( iX+5, 165, 50 ,random( 10,12 ) ,random(0,15),random(0,20),random(0,14),random(0,15) ); 
  popMatrix();
}

//１２段
 for ( int iX = -40; iX < 370;iX+= 73 )
{
  int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );

   rect( iX, 178, 70 ,15 ,random(0,7),random(0,8),random(0,6),random(0,6) );
}

//１３段
for ( int iX = -5; iX < 330;iX+= 69 )
{
  int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );

  rect( iX, random( 195,196 ), random( 65.1 , 68 ) ,15 ,random(0,10),random(0,20),random(0,6),random(0,9) ); 
}

//１４段
for ( int iX = -35; iX < 310;iX+= 43 )
{
  int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );
  rect( iX+5, random( 212,213 ), 40 ,18.5 ,random(0,10),random(0,20),random(0,6),random(0,9) ); 
}

//１５段
 for ( int iX = -55; iX < 280;iX+= 102.5 )
{
int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );

   rect( iX, 233, 98 ,15 ,random(0,7),random(0,5),random(0,6),random(0,9) ); 
}

//１６段
 for ( int iX = -40; iX < 360;iX+= 73 )
{
  int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );

   rect( iX, 252, 70 ,15 ,random(0,7),random(0,8),random(0,6),random(0,6) );
}

 //１７段
for ( int iX = -40; iX < 360;iX+= 73 )
{
  int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );

  rect( iX-50, 269, 70 ,15 ,random(0,7),random(0,8),random(0,6),random(0,6) );
}

//１８段
for ( int iX = -5; iX < 340;iX+= 53 )
{
  int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );
  
    pushMatrix();
  translate( -10,0 );
  rect( iX+9, 286, 50 ,random( 10,12 ) ,random(0,15),random(0,20),random(0,14),random(0,15) ); 
  popMatrix();
}

//１９段
for ( int iX = -5; iX < 310;iX+= 69 )
{
  int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );

  rect( iX+5, 299.9, random( 65.1 , 68 ) ,15 ,random(0,10),random(0,20),random(0,6),random(0,9) );
}

//２０段
for ( int iX = -35; iX < 360;iX+= 43 )
{
  int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );

   rect( iX+5, 318, 40 ,18.5 ,random(0,10),random(0,20),random(0,6),random(0,9) );
}

//２１段
for ( int iX = -55; iX < 310;iX+= 102.5 )
{
int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );

    rect( iX, 338.5, 98 ,15 ,random(0,7),random(0,5),random(0,6),random(0,9) ); 
}

//２２段
 for ( int iX = -40; iX < 360;iX+= 73 )
{
  int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );

   rect( iX-50, 358, 70 ,15 ,random(0,7),random(0,8),random(0,6),random(0,6) ); 
}

//２３段
for ( int iX = -5; iX < 310;iX+= 69 )
{
  int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );

 rect( iX+5, 375.5, random( 65.1 , 68 ) ,15 ,random(0,10),random(0,20),random(0,6),random(0,9) ); 
}

//２４段
for ( int iX = -5; iX < 360;iX+= 53 )
{
  int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );

    pushMatrix();
  translate( -10,0 );
  rect( iX+9, 392, 50 ,random( 10,12 ) ,random(0,15),random(0,20),random(0,14),random(0,15) ); 
  popMatrix();
}

//２５段
for ( int iX = -5; iX < 390;iX+= 69 )
{
  int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );

  rect( iX+5, 405, random( 65.1 , 68 ) ,15 ,random(0,10),random(0,20),random(0,6),random(0,9) ); 
}
popMatrix();

//２３段
{
  int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );

 rect( 934, 562, 89 ,22.5 ,random(0,10),random(0,20),random(0,6),random(0,9) );
}

//２４段
{
  int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );

    pushMatrix();
  translate( -10,0 );
  rect( 558, 588, 35 ,random( 15,18 ) ,random(0,15),random(0,20),random(0,14),random(0,15) ); 
  popMatrix();
  
   pushMatrix();
  translate( -10,0 );
  rect( 906.5, 590, 75 ,random( 15,18 ) ,random(0,15),random(0,20),random(0,14),random(0,15) );
  popMatrix();
}

{
  int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );

    pushMatrix();
  translate( -10,0 );
  rect( 867, 590, 35 ,random( 15,18 ) ,random(0,15),random(0,20),random(0,14),random(0,15) ); 
  popMatrix();
  
   pushMatrix();
  translate( -10,0 );
  rect( 985, 590, 75 ,random( 15,18 ) ,random(0,15),random(0,20),random(0,14),random(0,15) );
  popMatrix();
}

 //２５段
 {
  int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );

 rect( 725.7, 614.9, random( 97.65 , 102 ) ,16 ,random(0,10),random(0,20),random(0,6),random(0,9) );
 rect( 935.7, 608.9, random( 97.65 , 102 ) ,22.5 ,random(0,10),random(0,20),random(0,6),random(0,9) );
 }
 
{
  int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );

 rect( 620.7, 614.9, random( 97.65 , 102 ) ,16 ,random(0,10),random(0,20),random(0,6),random(0,9) );
 rect( 830.7, 608.9, random( 97.65 , 102 ) ,22.5 ,random(0,10),random(0,20),random(0,6),random(0,9) );
 }
 
 pushMatrix();
 translate(-130,80);  //大きさ、位置調整
 scale(1.1);
 
 //窓上装飾　arc  i＋２４０
 fill( 154,150,151 );
 arc( 775,270,246,277,radians(180), radians(360) ); 
 
 fill(  109,106,110 );
  arc( 775,270,220,251,radians(180), radians(360) );
 
  //窓枠一番後ろ
  fill( 181,184,195 );  //191,196,215
  noStroke();
  arc( 775,270,206,237,radians(180), radians(360) ); 
  rect( 672,270,206,195 );
  
  //窓枠一番後ろにおちるレンガの影
  stroke(121,124,137,180);
  strokeWeight(6);
  noFill();
   //左側
  arc( 775,269,204,232,radians(180), radians(360) );
  line( 673,273.5,673,480 );
  //右側
  line( 877.1,273.5,877.1,480 );
  noStroke();
  
  //窓枠 ２番目　上
  noFill();
 stroke(0,100);
 strokeWeight(0);
  arc( 775,260,182,195,radians(180), radians(360) );
  
  fill( 213,216,232 ); //203,212,228
  noStroke();
  arc(775,260,180,193,radians(180), radians(360) );
  
  //下
  fill( 213,216,232 );
  noStroke();
  rect( 685,270,180,185 );
  
  //窓　上 ガラス
  fill( 34,53,72 );
  arc( 775, 250, 150, 150, radians(180), radians(360) );  //
  
  //窓　下　ガラス
   fill( 34,53,72 ); 
  rect(700,280,150,165);
  
  /////猫///////////////////////////////////////////////////
  //fill( 17,25,41 );
  pushMatrix();
  translate(-200,0);
  //fill( 28,45,65 ); 
  fill( 34,45,66 );
  popMatrix();
  
  //体
  ellipse( 810,415,40,70 );
  rect( 792,420,35,40 );
  
  //左
  pushMatrix(); 
  translate(395,1180);
  rotate(radians(-90));
  arc( 750,400,60,15,radians(180), radians(360) );
  popMatrix();
  
  //右
   pushMatrix(); 
  translate(1225,-320);
 rotate(radians(90));
  arc( 750,400,60,15,radians(180), radians(360) );
  popMatrix();
  
  //耳
 //左
  pushMatrix();
  rotate(radians(-10));
  translate(-75,60);
 ellipse(795,420,15,25); 
  popMatrix();
  rect( 786,350,20,20 );
  
   pushMatrix();
   rotate(radians(-90));
    translate(-1150,370);
    //fill(255);
  arc( 800,423,30,20,radians(180), radians(360) );
  popMatrix();
  
  //右
  pushMatrix();
  rotate(radians(10));
  translate(80,-222);
 ellipse(795,420,15,25); 
  popMatrix();
  rect( 786,350,20,20 );
  
    pushMatrix();
   rotate(radians(90));
    translate(-450,-1250);
  arc( 800,423,30,20,radians(180), radians(360) );
  popMatrix();
 
  //顔
   fill( 28,45,65 );
  ellipse(810,370,49,44);
  
 //ひげ
 //左　１
 pushMatrix();
 stroke( 255,100 ); 
 translate(-30,70);
 rotate( radians( -5 ));
 line( 770,375,795,375 );
 popMatrix();
  
  //左　２
  pushMatrix();
 stroke( 255,100 ); 
 translate(-54,148);
 rotate( radians( -10 ));
 line( 770,375,795,375 );
 popMatrix();
  
  //右　１
  pushMatrix();
 stroke( 255,100 ); 
 translate(88,-65);
 rotate( radians( 5 ));
 line( 770,375,790,375 );
 popMatrix();
 
   //右　２
  pushMatrix();
 stroke( 255,100 ); 
 translate( 129,-122.5 );
 rotate( radians( 10 ));
 line( 770,375,790,375 );
 popMatrix();
 
 //目
  noStroke();
  fill( 255,70 );
  arc( 800,370,9,6,radians(180), radians(360) ); 
  arc( 820,370,9,6,radians(180), radians(360) );
  
  //鼻
  arc( 810,375,3,3,radians(180), radians(360) );
  //popMatrix();
  
  //猫　隠す
  fill( 203,212,228 );
  rect( 788.2,445,45,12 );
  fill( 191,196,215 );
  rect( 780,455.2,55,6.5 );
  ////猫終わり//////////////////////////////////////////////
  
   //ガラスに映る　雲
  //左　１
  fill( 43,58,80 ); //42,57,80  47,59,80
  pushMatrix();
  translate(136,60);
   scale(0.8);
  ellipse( 729,315,10,5 );
  ellipse( 740,316,11,7 );
  ellipse( 760,312,20,14 );
  ellipse( 745,310,17,11 );
  arc( 750,316,40,21,radians(180), radians(360) );
  arc( 770,316,17,10,radians(180), radians(360) );
  arc( 750,316,15,9,radians(0), radians(180) );
   arc( 730,315,21,7,radians(0), radians(180) );
  stroke( 43,58,80 );
  line( 725,315,779,315 );
  popMatrix();
  
  //左　２
  arc( 750,335,17,9,radians(180), radians(360) );
  ellipse( 755,334,10,4 );
  line( 735,335,760,335 );
  
  //右　１
  arc( 830,320,27,9,radians(180), radians(360) );
  arc( 839,317,20,9,radians(180), radians(360) );
  circle(828,315,8);
  circle( 844,317,3 );
  line( 810,320,844,320 );
 
 //上窓　一番左
 stroke( 43,58,80 );
 fill( 43,58,80 );
 arc( 720,237,24,14,radians(180), radians(360) );
 arc( 730,240,29,9,radians(180), radians(360) );
 line( 710,240,750,240 );
  
 //上窓　右なか ///////雲おわり
  stroke( 43,58,80 );
 fill( 43,58,80 );
 circle( 805,214,8 );
 arc( 815,216,30,10,radians(180), radians(360) );
 arc( 805,210,25,9,radians(180), radians(360) );
 line( 790,210,837,210 );
  noStroke();
  
  //窓枠　上　３番目
   fill( 213,216,232 ); //203,212,228
   rect( 770,175,7,80 );
   
  //３　左
  pushMatrix();
 translate(-10,680);
 translate(30,-130);
rotate(radians(-40));
    rect( 760,175,7,80 );
  popMatrix();
  
  //３　右
  pushMatrix();
 translate(-10,5);
 translate(370,-440);
rotate(radians(40));
    rect( 760,175,7,85 );
  popMatrix();
   
  //窓枠　下　３番目
  //下　下
 rect( 765,280,15,175 );
 fill( 172,181,203 );
 rect( 771.5,270,2.5,186 ); //かげ
 
  //下　上
  fill( 213,216,232 );
  rect( 780,280,7,175 );
  
  //下　横
pushMatrix();
  translate(1160,-292.5);
 rotate(radians(90));
  rect( 650,390,6,80 );
  rect(650,295,6,80);
  popMatrix();
  
  //縁
    noFill();
    //上
   stroke( 34,53,72,60 ); //横
   line( 685,260,865,260 );

    //下
  stroke( 34,53,72,60 );
    line( 700,270,700,455 );//縦　１
  line( 764,270,765,455 ); //縦　２
  line( 787,270,787,455 ); //縦　３
  line( 849,270,849,455 );//縦　４
  
  stroke( 0,150 );
  line( 685,270,865,270 );//横　１
  stroke(0,70);
   line( 685,455,865,455 );//横　２
 
 line( 685,270,685,455 ); //縦　０
 line( 865,270,865,455 ); //縦　５
   noStroke();

  //窓　金具
//左上
  fill( 159,159,171,70 );
  rect( 690,273,17,4.5 );
  rect( 690,277.2,4.5,13 );
  
  //左下
  rect( 690,448,17,4.5 );
  rect( 690,435.2,4.5,13 );
  
  //右上
  rect( 843,273,17,4.5 );
  rect( 855.5,277.2,4.5,13 );
  
  //右下
  rect( 843,448,17,4.5 );
  rect( 855.5,435.2,4.5,13 );
 
  blendMode( MULTIPLY );
  
  
  
  //窓　中影
  fill( 79,83,84,40 );
arc(775, 270, 205, 245, radians(230), radians(360));
  triangle( 775,270,878,270,878,490 );
  
  //窓下　影
  beginShape(QUAD_STRIP); 
  fill( 79,83,84,40 );
vertex(880, 485);
vertex(650, 485);
vertex(840, 510);
vertex(610, 550);
vertex( 660,860 );
endShape();
   blendMode( BLEND );
  
  noFill();
  //レンガ１１段　調整
  {
  int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );

 pushMatrix();
  translate( -10,0 );
  rect( 880, 155, 48 ,random( 14,16 ) ,random(0,15),random(0,20),random(0,14),random(0,15) ); 
  popMatrix();
  
  pushMatrix();
  translate( -10,0 );
  rect( 1014, 155, 78 ,random( 14,16 ) ,random(0,15),random(0,20),random(0,14),random(0,15) ); 
  popMatrix();
  
  pushMatrix();
  translate( 53,-42 );
  quad( 630,195,650,195,630,210,630,210 );
  popMatrix();
}

{
  int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );

 pushMatrix();
  translate( -10,0 );
  rect( 932, 155, 78 ,random( 14,16 ) ,random(0,15),random(0,20),random(0,14),random(0,15) ); 
  popMatrix();
  
  pushMatrix();
  translate( -38,-49 );
  quad( 887,205,905,205,905,215,900,215 );
  popMatrix();
}
  
  //レンガ１２段　調整
  {
  int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );

   rect( 895, 173, 70 ,19 ,random(0,7),random(0,8),random(0,6),random(0,6) );//１２段
   
   pushMatrix();
  translate( 29,-23 );
  quad( 630,195,654,195,639,213,630,213 );
  popMatrix();
}

{
  int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );

rect( 970, 173, 70 ,19 ,random(0,7),random(0,8),random(0,6),random(0,6) );

   pushMatrix();
  translate( -18,-29 );
  quad( 887,205,910,205,910,219,902,219 );
  popMatrix();
}
  
  //１３段　調整
  {
  int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );

  rect( 584, 195, random( 65.1 , 68 ) ,19 ,random(0,10),random(0,20),random(0,6),random(0,9) );
   rect( 970, 195, random( 65.1 , 68 ) ,19 ,random(0,10),random(0,20),random(0,6),random(0,9) ); 
   pushMatrix();
   translate( 27,0 );
   quad( 630,195,640,195,630,215,630,215 );
popMatrix();
}

{
  int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );

   rect( 900, 195, random( 65.1 , 68 ) ,19 ,random(0,10),random(0,20),random(0,6),random(0,9) );
   pushMatrix();
   translate( -2.5,0 );
   quad( 887,195,900,195,900,215,896,215 );
popMatrix();
}
  
  //１４段　調整
  {
  int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );

  rect( 606, random( 220,223 ), 35 ,18.5 ,random(0,10),random(0,20),random(0,6),random(0,9) ); 
  pushMatrix();
translate( 230,120 );
rotate( radians( -10 ));
  rect( 640,219, 12 ,18, 0,0,0,random(9,14) ); 
popMatrix();
rect( 979, 220, 65 ,22.5 ,random(0,10),random(0,20),random(0,6),random(9,14) );
}

{
  int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );
pushMatrix();
translate( 53,-107 );
rotate( radians( 10 ));
  rect( 644, random( 220,221 ), 6 ,19  ); 
popMatrix();
rect( 919, 220, 55 ,22.5 ,random(0,10),random(0,20),random(0,6),random(0,9) );
}
  
  //１５段　調整
  {
int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );

   rect( 600, 245, 30 ,20.5 ,random(0,7),random(0,5),random(0,6),random(0,9) ); 
   rect( 901, 245.5, 28 ,20.5 ,random(0,7),random(0,5),random(0,6),random(0,9) );
}

{
int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );

 rect( 633, 245.5, 17 ,20.5 ,random(0,7),random(0,5),random(0,6),random(0,9) );
    rect( 936, 245.5, 98 ,20.5 ,random(0,7),random(0,5),random(0,6),random(0,9) );
}
  
  //１６段　調整
  {
  int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );

   rect( 662, 271, 10 ,20 ,random(0,7),random(0,8),random(0,6),random(0,6) );
   rect( 902, 271, 102 ,20 ,random(0,7),random(0,8),random(0,6),random(0,6) );
}

{
  int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );

   rect( 878, 272, 20 ,20 ,random(0,7),random(0,8),random(0,6),random(0,6) );
    rect( 1008, 271, 17 ,20 ,random(0,7),random(0,8),random(0,6),random(0,6) );
}

  //１７段　調整
  {
  int iColor = floor( random(icolll.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );

  rect( 593, 294, 79 ,21 ,random(0,7),random(0,8),random(0,6),random(0,6) ); 
  rect( 965, 294, 102 ,19 ,random(0,7),random(0,8),random(0,6),random(0,6) ); 
}

{
  int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );

 rect( 878.1, 294, 79 ,21 ,random(0,7),random(0,8),random(0,6),random(0,6) ); 
}
  
  //１８段　調整
  {
  int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );
  
    pushMatrix();
  translate( -10,0 );
  rect( 659, 317, 25 ,random( 15,18 ) ,random(0,15),random(0,20),random(0,14),random(0,15) ); 
  rect( 927, 316, 75 ,random( 15,18 ) ,random(0,15),random(0,20),random(0,14),random(0,15) ); 
  popMatrix();
}

{
  int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );
  
    pushMatrix();
  translate( -10,0 );
rect( 627, 317, 30 ,random( 15,18 ) ,random(0,15),random(0,20),random(0,14),random(0,15) ); 
rect( 887, 317, 35 ,random( 15,18 ) ,random(0,15),random(0,20),random(0,14),random(0,15) ); 
rect( 1005, 316, 75 ,random( 15,18 ) ,random(0,15),random(0,20),random(0,14),random(0,15) );
  popMatrix();
}
  
  //１９段　調整
{
  int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );

  rect( 589, 335.5, 85 ,22.5 ,random(0,10),random(0,20),random(0,6),random(0,9) );
  rect( 970, 335.5, 85 ,22.5 ,random(0,10),random(0,20),random(0,6),random(0,9) );
}

{
  int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );

  rect( 877.8, 335.5, 85 ,22.5 ,random(0,10),random(0,20),random(0,6),random(0,9) );
}

  //２０段　調整
{
  int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );

   rect( 662, 361, 11 ,25.75 ,random(0,10),0,0,random(0,9) );
   rect( 910, 361, 65 ,27.75 ,random(0,10),random(0,20),random(0,6),random(0,9) );
}

  {
  int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );

rect( 878, 361, 25 ,27.75 ,0,random(0,20),random(0,6),0 );
rect( 980, 361, 60 ,27.75 ,random(0,10),random(0,20),random(0,6),random(0,9) );
}
  
  //２１段　調整  
{
int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );

    rect( 602, 390, 72 ,24 ,random(0,7),0,0,random(0,9) ); 
     rect( 952, 390, 98 ,22.5 ,random(0,7),random(0,5),random(0,6),random(0,9) );
}

{
int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );

rect( 877, 390, 70 ,22.5 ,0,random(0,5),random(0,6),0 ); 
}
 
  //２２段　調整
{
  int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );

rect( 877.5, 419, 45 ,15 ,random(0,7),random(0,8),random(0,6),random(0,6) );
   rect( 592, 419, 46 ,15 ,random(0,7),random(0,8),random(0,6),random(0,6) );
rect( 1006, 419, 75 ,15 ,random(0,7),random(0,8),random(0,6),random(0,6) );
}

{
  int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );

rect( 642, 419, 30 ,15 ,random(0,7),random(0,8),random(0,6),random(0,6) );
rect( 928, 419, 75 ,15 ,random(0,7),random(0,8),random(0,6),random(0,6) );
}

//２３段　調整
{
  int iColor = floor( random(icol.length) );
fill(icol [iColor][0],icol[iColor][1], icol[iColor][2] );

 rect( 589, 437, 84 ,22.5 ,random(0,10),0,0,random(0,9) ); 
}

{
  int iColor = floor( random(icolll.length) );
fill(icolll [iColor][0],icolll[iColor][1], icolll[iColor][2] );

 rect( 877, 437, 84 ,22.5 ,0,random(0,20),random(0,14),0 ); 
}
noFill();
 noStroke();
 
  //レンガ　窓上　装飾　１７個
  strokeWeight(0.2);
 stroke( 73,75,73 );
 {
int iColor = floor( random(Madoo.length) ); 
fill(Madoo [iColor][0],Madoo[iColor][1],Madoo[iColor][2],Madoo[iColor][3] );

//左側
  pushMatrix();
  translate( 64,-66.8 );
  quad( 700,200,720,200,717,210,703,210 );
popMatrix();

 pushMatrix();
  translate( 1,262 );
  rotate(radians( -25 ));
  quad( 700,200,720,200,719,209,701,209 );
popMatrix();

pushMatrix();
  translate( 43,519 );
  rotate(radians( -44 ));
  quad( 700,200,720,200,719,209,701,209 );
popMatrix();

pushMatrix();
  translate( 177.5,756 );
  rotate(radians( -64 ));
  quad( 700,200,720,200,719,209,701,209 );
popMatrix();

pushMatrix();
  translate( 382,942 );
  rotate(radians( -84 ));
  quad( 700,200,724,200,723,209,701,209 );
popMatrix();

//右側
 pushMatrix();
   translate( 288,-366 );
  rotate(radians( 28 ));
  quad( 700,200,720,200,719,209,701,209 );
popMatrix();

pushMatrix();
   translate( 556.5,-498.5 );
  rotate(radians( 50 ));
  quad( 700,200,720,200,719,209,701,209 );
popMatrix();

pushMatrix();
   translate( 830,-520.9 );
  rotate(radians( 70 ));
  quad( 700,200,720,200,719,209,701,209 );
popMatrix();

pushMatrix();
   translate( 1045.5,-459 );
  rotate(radians( 86 ));
  quad( 700,200,715,200,715,209,700,209 );
popMatrix();
}
 
 //窓上　装飾
 {
int iColor = floor( random(Madoo.length) ); 
fill(Madoo [iColor][0],Madoo[iColor][1],Madoo[iColor][2],Madoo[iColor][3] );

 //左側
pushMatrix();
  translate( 13,158 );
  rotate(radians( -17.5 ));
  quad( 700,200,720,200,719,210,701,210 );
popMatrix();

 pushMatrix();
  translate( 9,386 );
  rotate(radians( -34 ));
  quad( 700,200,720,200,719,209,701,209 );
popMatrix();

pushMatrix();
  translate( 99.5,644 );
  rotate(radians( -54 ));
  quad( 700,200,720,200,717,209,703,209 );
popMatrix();

pushMatrix();
  translate( 272,856 );
  rotate(radians( -74 ));
  quad( 700,200,720,200,719,209,701,209 );
popMatrix();

//右側
pushMatrix();
  translate( 186,-273.5 );
  rotate(radians( 18 ));
  quad( 700,200,720,200,719,210,701,210 );
popMatrix();

pushMatrix();
   translate( 405,-437.5 );
  rotate(radians( 38 ));
  quad( 700,200,720,200,719,209,701,209 );
popMatrix();

pushMatrix();
   translate( 692.7,-520.9 );
  rotate(radians( 60 ));
  quad( 700,200,720,200,719,209,701,209 );
popMatrix();

pushMatrix();
   translate( 966.5,-495.3 );
  rotate(radians( 80 ));
  quad( 700,200,720,200,719,209,701,209 );
popMatrix();
}
  
  //レンガ　窓下　装飾 ９個　四隅の丸さランダム
  pushMatrix();
  translate( 7,0 );
  for ( int iX = 645; iX < 875;iX+= 35 )
{
int iColor = floor( random(Mado.length) );
fill(Mado [iColor][0],Mado[iColor][1],Mado[iColor][2],Mado[iColor][3] );
  
  rect( iX, 461.5, 35,23,random(0,7),random(0,8),random(0,6),random(0,6) );
}
popMatrix();
popMatrix();

  // 再帰的なツタ　葉
  //左側
  for( float fX = 60; fX < 360; fX += 120 )
  {
    pushMatrix();
    translate( -150,0 );
    drawLightning( 0, fX, 60, random( -20, 20 ), 20 ); // 最初の再帰呼び出し
    popMatrix();
    
    //影
    pushMatrix();
    translate( -150,200 );
    drawLightning( 0, fX, 60, random( -20, 20 ), 20 ); // 最初の再帰呼び出し　
    popMatrix();
  }

//右　下側　短いやつ 回転度１８０
for( float fX = 60; fX < 360; fX +=600 ) //
  {
    pushMatrix();
    translate( -350,450 );
    rotate(radians(-30 ));
    drawLightningg( width, fX+700, 60, random( -20, 20 ), 240,18 ); // 最初の再帰呼び出し　１５だとあんまり暴れない
     popMatrix();
  }
}

// === 再帰関数の定義 ===
//左側　ツタ　葉
void drawLightning( float fBeginX, float fBeginY, float fLength, float fRot, int iLevel )
{
  if ( iLevel > 0 )  // 再帰の継続条件
  {
    // 線の終点
    float fEndX = fBeginX + cos( radians( fRot ) ) * fLength;
    float fEndY = fBeginY + sin( radians( fRot ) ) * fLength;
    
    if ( iLevel > 3 )
    {
    strokeWeight( random( 4,7 ) );
    }
    else
    {
      strokeWeight( iLevel );
    }
  
    stroke( 63,52,18 ); 
    line( fBeginX, fBeginY, fEndX, fEndY ); // 線を描画
    
    // 子の回転
    float fNewRot = fRot + random( -40, 40 );
    
    // 真横に向いたら逆向きに戻す．
    if( fNewRot > 90 )
    {
      fNewRot += 40;  
    }
    else if( fNewRot < -90 )
    {
      fNewRot -= 40;
    }
    drawLightning( fEndX, fEndY, fLength * 0.99, fNewRot, iLevel - 1 ); // 再帰呼び出し
    
     if( random(1) < 0.6 )  // 60%で枝分かれ
     {
    drawLightning( fEndX, fEndY, fLength *0.4, -fNewRot-40, iLevel - 7 ); 
    
     if( random(1) < 0.7 )  // 70%で枝分かれ
     {
    drawLightning( fEndX, fEndY, fLength *0.6, -fNewRot, iLevel - 7 ); 
    
     }     
     }  
       else
  {
   
// 再帰の終了時に，終端に葉を描画する．
//葉
int iColor = floor( random(Tu.length) );
fill(Tu [iColor][0],Tu[iColor][1], Tu[iColor][2] );
noStroke();
//真ん中
  arc(fBeginX, fBeginY+20, 20, 40, radians(0), radians(180));
  arc(fBeginX, fBeginY+20, 20, 40, radians(180), radians(360));  
  pushMatrix();
  translate( -5.9,35 );
  triangle( fBeginX, fBeginY, fBeginX+12, fBeginY,fBeginX+6, fBeginY+12 ); //20
  popMatrix();
  
  //左
  pushMatrix();
  translate( -5,-9 );
   arc(fBeginX, fBeginY+20, 40, 20, radians(135), radians(315));
  popMatrix();
  
  //右
  pushMatrix();
  translate( 5,-9 );
  arc(fBeginX, fBeginY+20, 40, 20, radians(-140), radians(45));
  popMatrix();
  
 //葉の影
 pushMatrix();
 translate( -80,100 );
 fill( 82,88,99,200 );  // 94,96,100
 noStroke();
 
//真ん中
  arc(fBeginX, fBeginY+20, 20, 40, radians(0), radians(180));
  arc(fBeginX, fBeginY+20, 20, 40, radians(180), radians(360));  
  pushMatrix();
  translate( -5.9,35 );
  triangle( fBeginX, fBeginY, fBeginX+12, fBeginY,fBeginX+6, fBeginY+12 ); //20
  popMatrix();
  
  //左
  pushMatrix();
  translate( -5,-9 );
   arc(fBeginX, fBeginY+20, 40, 20, radians(135), radians(315));
  popMatrix();
  
  //右
  pushMatrix();
  translate( 5,-9 );
  arc(fBeginX, fBeginY+20, 40, 20, radians(-140), radians(45));
  popMatrix();
 popMatrix();
  noFill();
  }
}
}

//右上　ツタ　葉
void drawLightningg( float fBeginX, float fBeginY, float fLength, float fRot, float fBaseRot, int iLevel )
{
  if ( iLevel > 0 )  // 再帰の継続条件
  {
    // 線の終点
    float fEndX = fBeginX + cos( radians( fRot ) ) * fLength;
    float fEndY = fBeginY + sin( radians( fRot ) ) * fLength;
    
    if ( iLevel > 3 )
    {
    strokeWeight( random( 4,7 ) );
    }
    else
    {
      strokeWeight( iLevel );
    }
  
    stroke(0);
    line( fBeginX, fBeginY, fEndX, fEndY ); // 線を描画
    
    // 子の回転
    float fNewRot = fRot + random( -50, 60 );
    
    // 真横に向いたら逆向きに戻す．
    if( fNewRot > fBaseRot + 90 )
    {
      fNewRot -= 40;  
    }
    else if( fNewRot <fBaseRot -90 )
    {
      fNewRot += 40;
    }
    
    drawLightningg( fEndX, fEndY, fLength * 0.99, fNewRot, fBaseRot, iLevel - 1 ); // 再帰呼び出し
    
    if ( random(1) < 0.6 )  // 60%で枝分かれ
    {
      drawLightningg( fEndX, fEndY, fLength *0.4, fNewRot-40, fBaseRot, iLevel - 7 );

      if ( random(1) < 0.7 )  // 70%で枝分かれ
      {
        drawLightningg( fEndX, fEndY, fLength *0.6, fNewRot+60, fBaseRot, iLevel - 7 );
      }
    }
    
    //葉
int iColor = floor( random(TuTa.length) );
fill(TuTa [iColor][0],TuTa[iColor][1], TuTa[iColor][2] );
noStroke();

//真ん中
  arc(fBeginX, fBeginY+20, 20, 40, radians(0), radians(180));
  arc(fBeginX, fBeginY+20, 20, 40, radians(180), radians(360));  
  pushMatrix();
  translate( -5.9,35 );
  triangle( fBeginX, fBeginY, fBeginX+12, fBeginY,fBeginX+6, fBeginY+12 ); //20
  popMatrix();
  
  ////左
  pushMatrix();
  translate( -5,-9 );
   arc(fBeginX, fBeginY+20, 40, 20, radians(135), radians(315));
  popMatrix();
  
  //右
  pushMatrix();
  translate( 5,-9 );
  arc(fBeginX, fBeginY+20, 40, 20, radians(-140), radians(45));
  popMatrix();
  
 //葉の影
 pushMatrix();
 translate( -20,160 );
 fill( 82,88,99,100 );  // 94,96,100
 noStroke();
//真ん中
  arc(fBeginX, fBeginY+20, 20, 40, radians(0), radians(180));
  arc(fBeginX, fBeginY+20, 20, 40, radians(180), radians(360));  
  pushMatrix();
  translate( -5.9,35 );
  triangle( fBeginX, fBeginY, fBeginX+12, fBeginY,fBeginX+6, fBeginY+12 ); //20
  popMatrix();
  
  //左
  pushMatrix();
  translate( -5,-9 );
   arc(fBeginX, fBeginY+20, 40, 20, radians(135), radians(315));
  popMatrix();
  
  //右
  pushMatrix();
  translate( 5,-9 );
  arc(fBeginX, fBeginY+20, 40, 20, radians(-140), radians(45));
  popMatrix();
  
 popMatrix();
  }
}
