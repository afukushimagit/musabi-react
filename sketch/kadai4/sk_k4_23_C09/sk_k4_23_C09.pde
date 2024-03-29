int magicpower = (int)random(6,9);
//高い数字を引けると複雑な魔方陣ができやすくなる
float[] iRGB1 = { random(50,255), random(50,255), random(50,255), random(100,200) };
float[] iRGB2 = { random(100,255), random(100,255), random(100,255), random(100,200) };

 void setup()
{
  size( 1000, 1000 );
  background(0);
  translate(width/2,height/2);
  drawMagicCircle( 0,0,375,magicpower );
}

//魔法陣を描く再起関数
void drawMagicCircle( float iCenterX, float iCenterY, float iRadius ,int iLevel )
{
  float randomstrokeWeight = iRadius/100*random(5) + iRadius/100 ;
  //円の太さを円の半径を参考にしてランダムで決める
  float nextCircleRadius = iRadius/random(1.1, 1.5);
  //再起した後に描画する円のサイズを決める
  stroke( iRGB1[0], iRGB1[1], iRGB1[2] );
  strokeWeight(randomstrokeWeight);
  fill(0,0,0,100);
  circle(iCenterX, iCenterY, 2*iRadius );
  noFill();

/*図形の模様を描画する。それぞれ一定の確率で半透明の円に沿ったベアリングのような円、円の原点を中心とした複数個の三角形、謎の線が描画される。*/
  pushMatrix();
  int irandom = (int)random(1,100);
  int iShapes = (int)random(3,7);
  int iRotateRadians = 360/iShapes;
  translate(iCenterX, iCenterY);
  stroke( iRGB2[0], iRGB2[1], iRGB2[2] );
  strokeWeight(randomstrokeWeight/5+iLevel/5);
  if (irandom < 20 && iLevel > 4 )
  //ベアリングのような円を描画する、中心に近いほど図形的に美しくなくなるのでiLevelが5以上の時のみ確率で描画する。
  {
    for (int iX = 0; iX < iShapes; iX ++)
    {
      circle(0, (iRadius+nextCircleRadius)/2, iRadius-nextCircleRadius);
      circle(0, (iRadius+nextCircleRadius)/2, (iRadius-nextCircleRadius)/1.5);
      rotate(radians(iRotateRadians));
    }
  }
  else if (irandom < 20 )
  //三角形を複数個描画する。数によって六芒星など様々な形になる。
  {
    for (int iX = 0; iX < iShapes; iX ++)
    {
      float iTriangleinCircle = iRadius/2;
      triangle(0 , 2*iTriangleinCircle ,iTriangleinCircle * sqrt(3) ,-iTriangleinCircle ,-iTriangleinCircle * sqrt(3) ,-iTriangleinCircle);
      rotate(radians(iRotateRadians));
    }
  }
  else if (irandom < 50 && iLevel>2 )
  //機械のような謎の線を描画する。
  {
    for (int iX = 0; iX < iShapes; iX ++)
    {
      line(iRadius ,0 ,(iRadius + nextCircleRadius)/2 ,0 );
      arc(0 ,0 ,iRadius + nextCircleRadius ,iRadius + nextCircleRadius ,radians(0) ,radians(iRotateRadians/2));
      pushMatrix();
      rotate(radians(iRotateRadians/2));
      line((iRadius + nextCircleRadius)/2 ,0 ,nextCircleRadius ,0 );
      popMatrix();
      rotate(radians(iRotateRadians));
    }
  }
  else
  {
  }
  popMatrix();
    
/*魔法陣を再起して描画する。*/
  float recursionprobability = (random(100));

  if( iLevel > 1 )
  //前描いた円より小さい円を描画する
  {
    drawMagicCircle( iCenterX, iCenterY, nextCircleRadius , iLevel - 1 );
  }
  if( 3 < iLevel && iLevel < magicpower )
  //iLevelが５以上の時、描画した円の円周上のどこかに確率で１個または２個の魔法陣を追加して描画する。描画された魔法陣もiLevelが５以上であればさらに再起して描画される。
  {
    if (recursionprobability < 40)
    {
      float irandomradians = random(360);
      drawMagicCircle( iCenterX + iRadius*cos(radians(irandomradians)) ,iCenterY + iRadius*sin(radians(irandomradians))   ,iRadius/random(2,4) ,iLevel - 1);
    }
    else if (recursionprobability < 60)
    {
      float irandomradians = random(360);
      drawMagicCircle( iCenterX + iRadius*cos(radians(irandomradians)) ,iCenterY + iRadius*sin(radians(irandomradians))   ,iRadius/random(1.4,3) ,iLevel - 1);
      float irandomradians2 = random(360);
      drawMagicCircle( iCenterX + iRadius*cos(radians(irandomradians2)) ,iCenterY + iRadius*sin(radians(irandomradians2))   ,iRadius/random(1.4,3) ,iLevel - 1);
    }
  }
}
