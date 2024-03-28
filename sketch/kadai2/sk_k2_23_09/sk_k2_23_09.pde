size(500, 500);
colorMode( HSB, 360, 100, 100 );
background( 180, 80, 35 ); //背景
noStroke();

pushMatrix();

//黒
blendMode( MULTIPLY );
//縦
for ( int iY= 0; iY < 500; iY += 100 )
{
  for ( int iX = 0; iX < 7; iX++ )
  {
    fill( 10, 100, 30 ); //濃
    rect( iX, 0, 10, 500 ); //線
    translate(15, 0); // X軸方向に15移動
  }
  translate(75, 0); // X軸方向に75移動
}
popMatrix();

pushMatrix();

//横
for ( int iY= 0; iY < 500; iY += 100 )
{
  for ( int iX = 0; iX < 7; iX ++ )
  {
    fill( 10, 100, 30 ); //濃
    rect( 0, iX, 500, 10 ); //線

    translate(0, 15); // Y軸方向に15移動
  }
  translate(0, 75); // Y軸方向に75移動
}

popMatrix();

//白
blendMode( ADD );
//縦
pushMatrix();
for ( int iY= 0; iY < 500; iY += 100 )
{
  for ( int iX = 0; iX < 7; iX++ )
  {
    fill( 60, 10, 80 ); //白
    rect( iX+3, 0, 4, 500 ); //線

    translate(15, 0); // X軸方向に15移動
  }
  translate(75, 0); // X軸方向に75移動
}
popMatrix();


//横
pushMatrix();
for ( int iY= 0; iY < 500; iY += 100 )
{
  for ( int iX = 0; iX < 7; iX ++ )
  {
    fill( 60, 10, 80 ); //白
    rect( 0, iX+3, 500, 4 ); //線

    translate(0, 15); // Y軸方向に15移動
  }
  translate(0, 75); // Y軸方向に75移動
}

popMatrix();

//黄色
blendMode( BLEND );
//縦
strokeWeight( 3 );
for ( int iX = 0; iX < 500; iX += 180 )
{
  stroke( 40, 50, 90 );
  line( iX+142, 0, iX+142, 500 );
}

//横
strokeWeight( 3 );
for ( int iX = 0; iX < 500; iX += 180 )
{
  stroke( 40, 50, 90 );
  line( 0, iX+142, 500, iX+142 );
}
