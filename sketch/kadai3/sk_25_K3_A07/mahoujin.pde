void mahoujin()
{
       if (ih<=3)
  {
   fR += 0.0106;
  fG += 0.0015;
  fB += 0.022;
  }
        else if ((4<=ih)&&(ih<=6))
  {
   fR += 0.0106*2;
  fG += 0.0015*2;
  fB += 0.022*2;
  }
        else if ((7<=ih)&&(ih<=9))
  {
   fR += 0.0106*5;
  fG += 0.0015*5;
  fB += 0.022*5;
  }
          else if ((10<=ih)&&(ih<=12))
  {
   fR += 0.0106*10;
  fG += 0.0015*10;
  fB += 0.022*10;
  }

  pushMatrix();
  scale(0.6);
  Dejoukun(500, 490, 0);
  popMatrix();

  pushMatrix();

  noFill();
  stroke(fR, fG, fB);

  strokeWeight(5);
  circle(300, 300, 450);

  strokeWeight(10);
  circle(300, 300, 420);

  circle(300, 300, 300);

  rectMode(CENTER);
  rect(300, 300, 200, 200);

  pushMatrix();
  rotate(radians(45));
  rect(425, 0, 200, 200);
  popMatrix();



  rectMode(CORNER);
  popMatrix();
}










//////////////////

void Dejoukun( int iX, int iY, float iDeg)
{
  fill(148, 93, 216);

  pushMatrix();

  translate( iX, iY );
  rotate( radians( iDeg ) );

  noStroke();  // fuchi nashi

  // finger
  fill( fR, fG, fB );
  ellipse( 100, -49, 104, 136 );

  // finger mask
  fill( 15, 31, 58 );
  ellipse( 190, -70, 200, 200 );

  // daen
  fill( fR, fG, fB );
  ellipse( 0, 30, 260, 200 );

  // mouth mask
  fill( 15, 31, 58);
  ellipse( 0, 4, 116, 186 );

  // ue daen mask
  fill( fR, fG, fB );
  ellipse( 0, -4, 200, 134 );

  // daen mask
  fill( 15, 31, 58);
  ellipse( 0, 4, 90, 60 );

  popMatrix();
}



//ルーン文字描画の関数。処理が重すぎたため、３つの関数に分けて一周描画している。ルーン文字は《dejoukun》と書いている
void dejoukun1(int iX, int iY)
{
  strokeWeight(6.5);
  pushMatrix();
  d(iX, iY);

  rotate(radians(15));
  translate(80, -85);
  e(iX, iY);

  rotate(radians(15));
  translate(70, -85);
  j(iX, iY);

  rotate(radians(15));
  translate(70, -85);
  o(iX, iY);

  rotate(radians(15));
  translate(70, -85);
  u(float(iX), float(iY));

  rotate(radians(15));
  translate(70, -80);
  k(float(iX), float(iY));

  rotate(radians(15));
  translate(60, -85);
  u(iX, iY);

  rotate(radians(15));
  translate(60, -85);
  n(iX, iY);

  rotate(radians(15));
  translate(60, -85);
  n(iX, iY);
  popMatrix();
}


void dejoukun2(int iX, int iY)
{
  strokeWeight(6.5);
  pushMatrix();
  rotate(radians(135));
  translate(-305, -730);
  d(iX, iY);

  rotate(radians(15));
  translate(80, -85);
  e(iX, iY);

  rotate(radians(15));
  translate(70, -85);
  j(iX, iY);

  rotate(radians(15));
  translate(70, -85);
  o(iX, iY);

  rotate(radians(15));
  translate(70, -85);
  u(float(iX), float(iY));

  rotate(radians(15));
  translate(70, -80);
  k(float(iX), float(iY));

  rotate(radians(15));
  translate(60, -85);
  u(iX, iY);

  rotate(radians(15));
  translate(60, -85);
  n(iX, iY);

  rotate(radians(15));
  translate(60, -85);
  n(iX, iY);
  popMatrix();
}

void dejoukun3(int iX, int iY)
{
  strokeWeight(6.5);
  pushMatrix();
  rotate(radians(268));
  translate(-615, -15);
  d(iX, iY);

  rotate(radians(15));
  translate(80, -85);
  e(iX, iY);

  rotate(radians(15));
  translate(70, -85);
  j(iX, iY);

  rotate(radians(15));
  translate(70, -85);
  o(iX, iY);

  rotate(radians(15));
  translate(70, -85);
  u(float(iX), float(iY));

  rotate(radians(15));
  translate(70, -80);
  k(float(iX), float(iY));

  /*
    rotate(radians(15));
   translate(60, -85);
   u(iX, iY);
   
   rotate(radians(15));
   translate(60, -85);
   n(iX, iY);
   
   rotate(radians(15));
   translate(60, -85);
   n(iX, iY);
   */
  popMatrix();
}





///////ルーンもじフォント//////////
void d (int iX, int iY)
{
  beginShape();
  vertex(iX, iY);
  vertex(iX+30, iY+30 );
  vertex(iX+30, iY);
  vertex(iX, iY+30);
  vertex(iX, iY);
  endShape();
}

void e (int iX, int iY)
{
  beginShape();
  vertex(iX, iY+30);
  vertex(iX, iY);
  vertex(iX+15, iY+10);
  vertex(iX+30, iY);
  vertex(iX+30, iY+30);
  endShape();
}

void j (int iX, int iY)
{
  beginShape();
  vertex(iX+15, iY-5);
  vertex(iX+15, iY+30);
  endShape();

  beginShape();
  vertex(iX+15, iY);
  vertex(iX+5, iY+15);
  vertex(iX+15, iY+25);
  vertex(iX+25, iY+15);
  vertex(iX+15, iY);
  endShape();
}

void o (int iX, int iY)
{
  beginShape();
  vertex(iX, iY+25);
  vertex(iX+25, iY+10);
  vertex(iX+12.5, iY);
  vertex(iX, iY+10);
  vertex(iX+25, iY+25);
  endShape();
}

void u (float fX, float fY)
{
  beginShape();
  vertex(fX, fY+30);
  vertex(fX, fY);
  arc(fX, fY+30, 40, 60, radians(0-90), radians(90-90));

  endShape();
}

void k (float fX, float fY)
{
  beginShape();
  vertex(fX, fY+30);
  vertex(fX, fY);
  arc(fX, fY, 40, 30, radians(0), radians(90));

  endShape();
}

void n (int iX, int iY)
{
  beginShape();
  vertex(iX+10, iY);
  vertex(iX+10, iY+30);
  endShape();

  beginShape();
  vertex(iX, iY+5);
  vertex(iX+20, iY+20);
  endShape();
}
