/**
鳥の羽から着想を得て制作した。
細かく描写できる再帰の特長が羽の繊細さに活かせていればと思う。
根元の透けている部分も見せることで羽の影を表現した。
*/
void setup()
{
  size(1000, 1000);
  colorMode(RGB, 100, 100, 100, 100);
  background( 0, 0, 0 );
  noLoop();
  
  // 描画処理実行中テキスト
  textSize(40);
  fill(100);
  text("Now Genegating Image......Please Wait", 100, 500);
}
void draw()
{
  background( 0, 0, 0 );
  rotate( radians( -30 ) );//座標移動
  translate(200,-600);
  for( int umoux = 0; umoux < 8; umoux++ )//繰り返し
  {
     for( int umouy=0; umouy<15; umouy++ )
     {
        pushMatrix();
        translate(-umoux*random(250,320),-umouy*random(250,330));
        feather(500,0,550,90);
        popMatrix();
     }
  }
}
void feather(float fbeginx,float fbeginy,float fline,float degree)
{
  stroke(random(0, 10), random(30, 65), random(20, 65),20);//羽の色
  if (fline<10)//線分の長さ指定による先端の色変更
  {
    stroke(80+fline/60,70+fline/60,20-30/fline,50/fline);
  }
  float fEndX = fbeginx + 0.3*fline * cos( radians( degree ) );//羽幅
  float fEndY = fbeginy + fline * sin( radians( degree ) );//羽高さ
  line( fbeginx, fbeginy, fEndX, fEndY );//羽描画
  if (fline>10)
  {
    feather(fEndX,fEndY,fline*0.8,degree+5);
    feather(fEndX,fEndY,fline*0.8,degree-5);
  }
}
