size( 500, 500 );
colorMode( HSB, 100 );
background( 0 );
translate( 250, 250 );

strokeWeight( 0.75 );
noFill();

for (int iX=0; iX<500; iX+=2 )
{
  rotate( 2 );
  stroke( 40+iX*iX/2500, 100, 100 );  //色相を緑から変化するように調整
  ellipse( iX/1.4, 0, iX/1.5, iX/6 );  //中央から離れるほど直径が大きくなるように調整
}
