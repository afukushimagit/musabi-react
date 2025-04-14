/**************************************************************
服やハンカチの柄を作りました。
色んな正方形を使って、ランダムないろを付けて見ました。
20年まえ流行した模様です、今でも好きです。
**************************************************************/
size( 500, 500 );// Window Size
background(255);
rectMode( CENTER );//座標変換
blendMode(SUBTRACT);//合成モード

for ( int iY = 0; iY <=500; iY += 100 )
{
  for ( int iX = 0; iX <= 500; iX += 100 )
  {//すべてのかたちのx,y座標変換

    stroke(random(20, 80), random(10, 20), random(0, 100));
    strokeWeight(2);
    pushMatrix();
    fill(random(20, 80), random(10, 20), random(0, 100));
    translate( iX+49.5, iY);
    rotate( radians( 45) );
    square( 0, 0, 25);

    popMatrix();
    stroke(random(20, 80), random(10, 20), random(0, 100));
    strokeWeight(2);
    pushMatrix();
    fill(random(20, 80), random(10, 20), random(0, 100));
    translate( iX, iY+49.5);
    rotate( radians( 45) );
    square( 0, 0, 25);

    popMatrix();
    stroke(random(20, 80), random(10, 20), random(0, 100));
    strokeWeight(2);
    pushMatrix();
    fill(random(20, 80), random(10, 20), random(0, 100));
    translate( iX+49.5, iY);
    rotate( radians( 45) );
    square( 0, 0, 25);
    //小さい正方形、黄色と緑
    popMatrix();
    stroke(random(20, 80), random(0), random(0, 20));
    strokeWeight(2);
    pushMatrix();
    fill(random(20, 80), random(10, 20), random(0, 100));
    translate( iX, iY );
    rotate( radians( 45) );
    square( 0, 0, 70 );
    popMatrix();
    //大きい正方形、黄色と緑

    stroke(0, random(20, 40), random(10, 20));
    strokeWeight(3);
    pushMatrix();
    noFill();
    translate( iX+45, iY );
    rotate( radians( 45) );
    square( 0, 0, 70 );
    popMatrix();

    stroke(0, random(20, 40), random(10, 20));
    strokeWeight(3);
    pushMatrix();
    noFill();
    translate( iX+55, iY );
    rotate( radians( 45) );
    square( 0, 0, 70 );
    popMatrix();
    //大きい正方形のアウトラインだけ、ピンク
  }
}

save("K2_A12_fukushima.png");
