// === グローバル変数/定数 ===
float C = random(360);//色決定用乱数

// === 関数 ===
void bill( float standardX /*ビル左下のx座標*/, float standardY /*ビル左下のx座標*/, float iSize /*ビルの縮尺*/ )
{
  //変数ーーーーーーーーーーーーーーーーーーーーーーーーーーーー
  float window = random(20,30) * iSize;//窓１つの大きさ
  
  int windowX = ceil( random(1,4) );//窓の列数
  int windowY = ceil( random(2,5) );//窓の行数
  float gap = 6 * iSize;//窓の間隔
  
  float billD = 10 * iSize; // ビルの奥行き
  float billR = 20 * iSize; //ビルの観測角度
  
  //ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
    
  //線
  stroke(0,0,0);
  strokeWeight(1.8);
  
  //塗りの決定(壁)
  if( random(1) < 0.8 )
    {
      fill(random(C+50,C-50),random(20,40),random(80,95));
    }
    else
    {
      fill(random(C+50,C-50),random(60,80),random(70,85));
    }
    
  //前面
  rect( standardX-gap, standardY+gap, window*windowX + gap*(windowX+1), -( window*windowY + gap*(windowY+1) ) );
  
  //上面
  beginShape();
  vertex( standardX-gap, standardY+gap -( window*windowY + gap*(windowY+1) ) );//左下
  vertex( standardX-gap + window*windowX+gap*(windowX+1), standardY+gap -( window*windowY + gap*(windowY+1) ) );//右下
  vertex( standardX-gap + window*windowX+gap*(windowX+1) + billR, standardY+gap - billD -( window*windowY + gap*(windowY+1) ) );//右上
  vertex( standardX-gap + billR, standardY+gap - billD -( window*windowY + gap*(windowY+1) ) );//左上
  vertex( standardX-gap, standardY+gap -( window*windowY + gap*(windowY+1) ) );
  endShape();
  
  //横面
  beginShape();
  vertex( standardX-gap + window*windowX+gap*(windowX+1), standardY+gap );//左下
  vertex( standardX-gap + window*windowX+gap*(windowX+1) + billR, standardY+gap - billD);//右下
  vertex( standardX-gap + window*windowX+gap*(windowX+1) + billR, standardY+gap - billD - window*windowY - gap*(windowY+1) );//右上
  vertex( standardX-gap + window*windowX+gap*(windowX+1), standardY+gap - window*windowY - gap*(windowY+1) );//左上
  vertex( standardX-gap + window*windowX+gap*(windowX+1), standardY+gap );//左下
  endShape();
  
  //模様の決定ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
  
  if( random(1) < 0.5)
  {
    //塗りの決定(窓)
    fill(random(C-20,C+20),random(70),100);
    
    //窓
    strokeWeight(1.6);
    
    for(int i_X = 0; i_X < windowX; i_X++ )
    {
      for(int i_Y = 0; i_Y < windowY; i_Y++)
      {
        square( (standardX+window) + window*i_X + gap*i_X, standardY + window*(-i_Y) + gap*(-i_Y), -window );
      }
    }
  }
  else
  {
    //縦線模様
    strokeWeight(1.6);
    int linesX = ceil( random(1,5) );//本数
    
    
    line( standardX-gap + window*windowX+gap*(windowX+1), standardY+gap, standardX-gap + window*windowX+gap*(windowX+1), standardY+gap - window*windowY - gap*(windowY+1) );
    
    for( int i_l = 0; i_l < linesX; i_l++)
    {
      line( standardX-gap + ( window*windowX + gap*(windowX+1) )/(linesX+1)*(i_l+1), standardY+gap, standardX-gap + ( window*windowX + gap*(windowX+1) )/(linesX+1)*(i_l+1), standardY+gap-( window*windowY + gap*(windowY+1) ) );
      line( standardX-gap+window*windowX+gap*(windowX+1) + (billR)/(linesX+1)*(i_l+1) /*始点X*/, standardY+gap - (billD)/(linesX+1)*(i_l+1) /*始点Y*/, standardX-gap+window*windowX+gap*(windowX+1) + (billR)/(linesX+1)*(i_l+1) /*終点X*/, standardY+gap-window*windowY-gap*(windowY+1) - (billD)/(linesX+1)*(i_l+1) /*終点X*/);
    }
  }
}
