/**
右から吹く風になびかれる、不思議な木を作りました。
実行するたびに葉っぱの色と、木全体の形が変わります。
運がいいと再起が一回で終わってしまうこともあるので、もしそうなってしまったらもう一度実行してみてください。
実行するたびに大きな変化のある形にしたく、この木を制作しました。
また、課題３で配列を用いて時計に色の変化をつけたことが楽しかったので、
今回は関数の作成を使用して色を変えることに挑戦してみました。
*/
void setup()
{
  size(1000, 1000);
  colorMode(HSB, 360, 1.0, 1.0, 1.0);
  background(185, 0.6, 0.8); //Blue
  
  for(int i = 1; i < 22; i++) //Sky
  {
    noStroke();
    fill(45, 0.1, 1.0, 0.15); //Light Brown gradation
    rect(0, 0, width, 40*i);
  }
  
  noStroke();
  fill(114, 0.5, 0.7); //Green
  ellipse(width/2, 1040, 1200, 400); //Hill
  
  strangetree(width/2, 850, 200, 450, 10, 250);
}

void strangetree(float fX, float fBeginY, float fverL, float fholL, float fsW, float fW)
{
  //Stroke setting
  stroke(31, 0.2, 0.6); //Brown
  strokeWeight(fsW);
  
  // Vertical line
  float fEndY = fBeginY - fverL; //Calculate upper Y
  line(fX, fBeginY, fX, fEndY);
  
  // Horizontal line
  float fLeft = fX - fholL/2; //Calculate left X
  float fRight = fX + fholL/2; //Calculate rightX
  strokeWeight(fsW * 0.9);
  line(fLeft, fEndY, fRight, fEndY);
  
  int fRR = int (random(9));
  int fRL = int (random(9));
  float fNextEndY = fEndY - fverL * 0.9;
  
  // Continue or Stop growing tree?
  if( fholL > 5 )
  { 
    if( fRR >= 6 && fRL >= 6) //Both brach Stop
    {
      line(fRight, fEndY, fRight, fNextEndY);
      line(fLeft, fEndY, fLeft, fNextEndY);
      //Right leaves
      maru(fRight, fNextEndY-fW/2, fW, fRR);
      maru(fRight-fW*0.5, fNextEndY+fW*0.3, fW*0.6, fRL); //Smaller
      maru(fRight-fW*0.8, fNextEndY+fW*0.8, fW*0.4, fRR); //Smallest
      //Left leaves
      maru(fLeft, fNextEndY-fW/2, fW, fRL);
      maru(fLeft-fW*0.5, fNextEndY+fW*0.3, fW*0.6, fRR); //Smaller
      maru(fLeft-fW*0.8, fNextEndY+fW*0.8, fW*0.4, fRL); //Smallest
    }
    else if( fRR >= 6) //Right branch Stop
    {
      line(fRight, fEndY, fRight, fNextEndY);
      //Right leaves
      maru(fRight, fNextEndY-fW/2, fW, fRR);
      maru(fRight-fW*0.5, fNextEndY+fW*0.3, fW*0.6, fRL);
      maru(fRight-fW*0.8, fNextEndY+fW*0.8, fW*0.4, fRR);
      //Left continue
      strangetree(fLeft, fEndY, fverL * 0.75, fholL * 0.5, fsW * 0.75, fW * 0.6);
    }
    else if( fRL >= 6) //Left branch Stop
    {
      line(fLeft, fEndY, fLeft, fNextEndY);
      //Left leaves
      maru(fLeft, fNextEndY-fW/2, fW, fRL);
      maru(fLeft-fW*0.5, fNextEndY+fW*0.3, fW*0.6, fRR);
      maru(fLeft-fW*0.8, fNextEndY+fW*0.8, fW*0.4, fRL);
      //Right continue
      strangetree(fRight, fEndY, fverL * 0.75, fholL * 0.5, fsW * 0.75, fW * 0.6);
    }
    else //Both branch Continue
    {
      strangetree(fLeft, fEndY, fverL * 0.75, fholL * 0.5, fsW * 0.75, fW * 0.6);
      strangetree(fRight, fEndY, fverL * 0.75, fholL * 0.5, fsW * 0.75, fW * 0.6);
      //Left leaves on branch
      maru(fLeft, fEndY, fW*0.75, fRL);
      maru(fLeft-fW*0.5, fEndY+fW*0.4, fW*0.2, fRR);
      //Right leaves on branch
      maru(fRight, fEndY, fW*0.75, fRR);
      maru(fRight-fW*0.5, fEndY+fW*0.4, fW*0.2, fRL);
    }
  }
  // End growing tree
  else
  {
    line(fLeft, fEndY, fLeft, fEndY - fverL * 0.9);
    line(fRight, fEndY, fRight, fEndY - fverL * 0.9);
    //Right leaves
    maru(fRight, fEndY - fverL * 0.9, fW, fRR);
    maru(fRight, fNextEndY-fW*1.5, fW*0.6, fRL);
    //Left leaves
    maru(fLeft, fEndY - fverL * 0.9, fW, fRL);
    maru(fLeft, fNextEndY-fW*1.5, fW*0.6, fRR);
  }
}

//decide leaf color
void maru(float X, float Y, float W, float Random)
{
  noStroke();
  if (Random == 6 || Random == 0)
  {
    fill(0, 0, 0.4, 0.8); //Black
  }
  else if(Random == 7 || Random <= 2)
  {
    fill(0, 0.5, 0.9, 0.8); //Red
  }
  else if(Random == 8 || Random <= 4)
  {
    fill(185, 0.6, 0.8, 0.8); //Blue
  }
  else if(Random == 9 || Random == 5)
  {
    fill(114, 0.5, 0.7, 0.8); //Green
  }
  circle(X, Y, W);
}
