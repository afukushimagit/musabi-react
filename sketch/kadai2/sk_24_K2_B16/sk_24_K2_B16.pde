/**************************************************************
授業用ページのサンプルプログラムを参考にしました。
レース部分が特に難しかったです。
レトロで可愛い画面になるように意識して制作しました。
 **************************************************************/
size(500, 500);      // Window Size


// -----------------------------------
background( 90, 130, 160 );

//菱形
for ( int iY = 0; iY < 600; iY += 100 )
{
  for ( int iX = 0; iX < 600; iX += 100 )
  {
    pushMatrix();  //座標系を保存
    translate( iX, iY );  //中心点に座標系を移動
    rectMode( CENTER );
    
    noStroke();
    fill( 20, 60, 125 );
    
    rotate( radians ( 45 ));  //回転
    square( 0, 0, 40 );
    
    popMatrix();  //座標系をリセット
  }
}

//縦赤四角
for ( int iY = 0; iY < 600; iY += 100 )
{
  for ( int iX = 0; iX < 600; iX += 100 )
  {
    pushMatrix();  //座標系を保存
    translate( iX, iY );  //中心点に座標系を移動
    rectMode( CENTER );
    
    noStroke();
    fill( 168, 77, 97 );  //赤
    square( 0, 50, 20);
    
    popMatrix();  //座標系をリセット
  }
}

//横赤四角
for ( int iY = 0; iY < 600; iY += 100 )
{
  for ( int iX = 0; iX < 600; iX += 100 )
  {
    pushMatrix();  //座標系を保存
    translate( iX, iY );  //中心点に座標系を移動
    rectMode( CENTER );
    
    noStroke();
    fill( 168, 77, 97 );  //赤
    square( 50, 0, 20);
    
    popMatrix();  //座標系をリセット
  }
}

//縦の点線
for ( int iY = 5; iY < 600; iY += 20 )
{
  for ( int iX = 0; iX < 600; iX += 100 )
  {
    pushMatrix();  //座標系を保存
    translate( iX, iY );  //中心点に座標系を移動
    rectMode( CENTER );
    
    strokeWeight( 2 );
    stroke( 255, 200, 215);  //ピンク
    line( 50, 10, 50, 0 );
    
    popMatrix();  //座標系をリセット
  }
}

//横の点線
for ( int iY = 0; iY < 600; iY += 100 )
{
  for ( int iX = 5; iX < 600; iX += 20 )
  {
    pushMatrix();  //座標系を保存
    translate( iX, iY );  //中心点に座標系を移動
    rectMode( CENTER );
    
    strokeWeight( 2 );
    stroke( 255, 200, 215);  //ピンク
    line( 0, 50, 10, 50 );
    
    popMatrix();  //座標系をリセット
  }
}


//-----------------------------------------------
// 第４回授業のサンプルプログラム
//『花の模様をfor文で実現した例』『顔をスクリーンに並べて描画する』を応用

//花びら
for ( int iY = 50; iY < 500; iY += 100 )
{
  for ( int iX = 50; iX < 500; iX += 100 )
  {
    pushMatrix();  //座標系を保存
    translate( iX, iY );  //中心点に座標系を移動

    rectMode( CENTER );

      for( int i = 0; i < 9; i++ )
    {
      strokeWeight( 1 );
      stroke( 0 );
      fill( 255 );
      ellipse( 20, 0, 30, 15 ); 
      rotate( radians( 40 ) );
    }
    
    popMatrix();  //座標系をリセット
  }
}

//花の真ん中
for ( int iY = 50; iY < 500; iY += 100 )
{
  for ( int iX = 50; iX < 500; iX += 100 )
  {
    pushMatrix();  //座標系を保存
    translate( iX, iY );  //中心点に座標系を移動

    rectMode( CENTER );

      for( int i = 0; i < 9; i++ )
    {
      fill( 255, 250, 115 );
      circle( 0, 0, 20); 
    }
    
    popMatrix();  //座標系をリセット
  }
}
//-----------------------------------------------


//バッテン
for ( int iY = 100; iY < 500; iY += 100 )
{
  for ( int iX = 100; iX < 500; iX += 100 )
  {
    pushMatrix();  //座標系を保存
    translate( iX, iY );  //中心点に座標系を移動
    rectMode( CENTER );
    
    rotate( radians( 35 ) );// 回転
     for( int i = 0; i < 4; i++ )
    {
      strokeWeight( 2 );
      stroke( 255 );
      line( 0, 0, 33, 5 ); 
      rotate( radians( 90 ) );
    }
    
    popMatrix();  //座標系をリセット
  }
}

//レース(上)
for ( int iY = 0; iY < 100; iY += 100 )
{
  for ( int iX = 0; iX < 600; iX += 40 )
  {
    pushMatrix();  //座標系を保存
    translate( iX, iY );  //中心点に座標系を移動

    rectMode( CENTER );

      for( int i = 0; i < 10; i++ )
    {
      strokeWeight( 5 );
      stroke( 255 );
      noFill();
      ellipse( 10, 0, 20, 10 );
      rotate( radians( 36 ) );
    }
    
    popMatrix();  //座標系をリセット
  }
}
    noStroke();
    fill( 255 );
    rect( 0, 0, 1000, 17 );  //レースのふち
    
//レース(左)
for ( int iY = 0; iY < 600; iY += 40 )
{
  for ( int iX = 0; iX < 100; iX += 100 )
  {
    pushMatrix();  //座標系を保存
    translate( iX, iY );  //中心点に座標系を移動

    rectMode( CENTER );

      for( int i = 0; i < 10; i++ )
    {
      strokeWeight( 5 );
      stroke( 255 );
      noFill();
      ellipse( 10, 0, 20, 10 );
      rotate( radians( 36 ) );
    }
    
    popMatrix();  //座標系をリセット
  }
}
    noStroke();
    fill( 255 );
    rect( 0, 0, 11, 1000 );  //レースのふち
    
//レース(下)
for ( int iY = 499; iY < 500; iY += 70 )
{
  for ( int iX = 10; iX < 500; iX += 40 )
  {
    pushMatrix();  //座標系を保存
    translate( iX, iY );  //中心点に座標系を移動

    rectMode( CENTER );

      for( int i = 0; i < 10; i++ )
    {
      strokeWeight( 5 );
      stroke( 255 );
      noFill();
      ellipse( 10, 0, 20, 10 );
      rotate( radians( 36 ) );
    }
    
    popMatrix();  //座標系をリセット
  }
}
    noStroke();
    fill( 255 );
    rect( 500, 500, 1000, 17 );  //レースのふち
    
//レース(右)
for ( int iY = 10; iY < 500; iY += 40 )
{
  for ( int iX = 499; iX < 500; iX += 70 )
  {
    pushMatrix();  //座標系を保存
    translate( iX, iY );  //中心点に座標系を移動

    rectMode( CENTER );

      for( int i = 0; i < 10; i++ )
    {
      strokeWeight( 5 );
      stroke( 255 );
      noFill();
      ellipse( 10, 0, 20, 10 );
      rotate( radians( 36 ) );
    }
    
    popMatrix();  //座標系をリセット
  }
}
    noStroke();
    fill( 255 );
    rect( 500, 0, 13, 1000 );  //レースのふち
    
// -----------------------------------


// -----------------------------------
// "K2_[クラス][番号]_[苗字].png"
save("K2_A12_fukushima.png");
// -----------------------------------
