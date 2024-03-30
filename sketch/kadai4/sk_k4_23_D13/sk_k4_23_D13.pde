/**
秋の情景をモチーフに、紅葉に包まれる山々をドラゴン曲線や木々の再帰表現を応用したランダム生成で表現した。
奥の山々や紅葉、銀杏の木々、山にかかる薄雲はドラゴン曲線の再帰と繰り返し文の組み合わせに加え、
一定の座標や直線の長さの範囲を一定の数値と乱数で制御することでランダムながら規則性をもって生成している。
また近景の木々は枝分かれの再帰表現を活用し、遠景よりも全体的な陰を強調して絵の緩急や区別を目指した。
一方で再帰の規則性から自然の雰囲気を醸し出すことを目標に線の繰り返し文によるグラデーションを応用して光源を設定し、
奥の山々の稜線や峡谷、手前の木々の立体感を表現するためトーンの段階に方向性を持たせた再帰表現を心がけた。
*/
void setup()
{
  size( 1000, 1000 );//サイズ指定

  noLoop();
  
  // 描画処理実行中テキスト
  textSize(40);
  fill(0);
  text("Now Genegating Image......Please Wait", 100, 500);
}

void draw()
{
  //背景のグラデーション
  for (float g=0; g<=1000; g++)
  {
    noFill();
    stroke(215-g*0.2, 255-g*0.1, 250);//空の色
    rect(0, 0, g, g);
  }
 
  noStroke();//左上の太陽
  fill(255);
  circle(0, 0, 70);


  fill(20, 150, 188);//海色
  rect(0, 600, width, 300);//背景の海

  star(width, height, 100);//ほんわか描画
  
  // 紅葉山の連続描画
  for ( int irock = 0; irock < 30; irock++ )
  {
    drawmountain( random(width), random( 800, 1000), random( width), random( 800, 1000), 7);
  }

  drawtree(width, height, random(60, 150), -90, 20);//手前の木々の出現座標
  drawtree(-50, height-random(300), random(100, 250), -90, 20);
  drawtree(width/2, height+350, random(50, 150), -90, 20);
}

//森山を生成
void drawmountain(float fBeginX, float fBeginY, float fEndX, float fEndY, int count)
{ 
  // 開始点から終了点への距離
  float fLength = sqrt( pow( fEndX - fBeginX, 2) + pow( fEndY - fBeginY, 2 ) );

  if ( fLength > 3 )
  {
    // 直角三角形のX軸方向の大きさ
    float fTriangleX = ( fEndX - fBeginX ) / 2;

    // 直角三角形のY軸方向の大きさ
    float fTriangleY = ( fBeginY - fEndY ) /2;  

    float fBeginToNewX = fTriangleX + fTriangleY;
    float fEndToNewY = fTriangleX + fTriangleY;

    // 新たに生成される点のXY座標値
    float fNewX = fBeginX + fBeginToNewX;
    float fNewY = fEndY + fEndToNewY;

    // 二つの線に再帰的に分割
    drawmountain( fBeginX, fBeginY, fNewX, fNewY, count );
    drawmountain( fEndX, fEndY, fNewX, fNewY, count );
  } else
  {
    colorMode(HSB);//カラーモードをHSBに

    strokeWeight(2);//山の霧か雲
    stroke(40, 30, 280, random(80));
    line( fBeginX, fBeginY, fEndX, fEndY);

    strokeWeight(4);//紅葉
    stroke(random(-10, 30), 190, random(170, 280));
    line( fBeginX-100, fBeginY+65, fEndX-100, fEndY+60 );

    strokeWeight(3);//黄色い葉っぱ
    stroke(random(30, 50), 240, random(180, 280));
    line( fBeginX, fBeginY+240, fEndX+5, fEndY+240 );

    strokeWeight(2);//山影
    stroke(150, 200, random(50, 150), random(200));
    line( fBeginX-90, fBeginY+220, fEndX-90, fEndY+180 );

    strokeWeight(1.4);//紅葉枝
    stroke(random(30, 40), 150, random(20, 250));
    line( fBeginX-100, fBeginY+70, fEndX-100, fEndY+80 );

    strokeWeight(2.4);//針葉樹
    stroke(random(40, 65), 140, random(30, 230));
    line( fBeginX-100, fBeginY+120, fEndX-100, fEndY+130 );

    strokeWeight(1.4);//滝
    stroke(105, 70, random(70, 280));
    line( fBeginX-200, fBeginY+370, fEndX-200, fEndY+440 );
  }
}

//手前の木々を生成
void drawtree(float fBeginX, float fBeginY, float fLength, float fDegree, int iLevel)
{

  float fEndX = fBeginX + fLength * cos( radians( fDegree ) );
  float fEndY = fBeginY + fLength * sin( radians( fDegree ) );

  line( fBeginX, fBeginY, fEndX, fEndY );
  if (iLevel>1)
  {
    stroke(random(5, 35), 220, random(245, 320));
    strokeWeight(random(1.4, 4.5));
    drawtree( fEndX, fEndY, fLength *random( 0.6, 0.9), fDegree + random(40), iLevel - 1 );//紅葉１
    drawtree( fEndX, fEndY, fLength * random(0.5, 0.9), fDegree -random( 30), iLevel - 1 );//紅葉２


    strokeWeight(random(3, 8));
    stroke(random(120, 150), 170, random(60, 120));
    drawtree( fEndX+10, fEndY+15, fLength * random(0.55, 0.7), fDegree +random( 30), iLevel -2);//木の陰
  }
}

//空の丸いほんわかを生成
void star (int iX, int iY, int iLevel)
{
  noStroke();

  fill(240, 255, 230, 90);
  circle(random(1000), random(380, 800), random(2, 36));

  if (iLevel>1)
  {
    star(iX, iY, iLevel-1);
  }
}
