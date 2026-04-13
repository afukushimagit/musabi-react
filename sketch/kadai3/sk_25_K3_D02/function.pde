float oR;
float oG;
float oB;



/*砂時計の描画に使う変数*/

float sRX = 50; //rectのX座標
float sRY = 50; //rectのY座標
float sRW = 500; //rectの幅
float sRH = 900; //rectの高さ

float sLSX1 = 50;//line(1)の始点のX座標
float sLSY1 = 300;//line(1)の始点のY座標
float sLEX1 = 500;//line(1)の終点のX座標
float sLEY1 = 350;//line(1)の終点のY座標

float sLSX2 = 100;//line(2)の始点のX座標
float sLSY2 = 700;//line(2)の始点のY座標
float sLEX2 = 550;//line(2)の終点のX座標
float sLEY2 = 650;//line(2)の終点のY座標  

void drawSunadokei() //砂時計の描画
{
  noFill();
  rect( sRX, sRY, sRW, sRH );
  line(sLSX1,sLSY1,sLEX1,sLEY1);
  line(sLSX2,sLSY2,sLEX2,sLEY2);  
}

/*溜まっているオイルの描画に使う変数*/
float oH = 50 + secondCurrent*0.0847222222 + minuteCurrent*5.08333333; //オイルの水位
float oX = 50; //オイルの始点のX座標
float oY = 300; //オイルの左下のY座標

void drawOil() //溜まっているオイルの描画
{
  fill(oR,oG,oB);
  beginShape();
  vertex(oX,oH);
  vertex(550,oH);
  vertex(550,355);
  vertex(oX,oY);
  endShape();  
}

/*落ちていくオイルの描画に使う変数*/
int maxDrops = 100;
float[] dropX = new float[maxDrops];
float[] dropY = new float[maxDrops];
float[] dropSpeed = new float[maxDrops];
boolean[] dropActive = new boolean[maxDrops];
int[] dropPhase = new int[maxDrops];  // フェーズを記録
float[][] storedDrops = new float[1000][2]; // 落ちてきた粒の座標
int storedCount = 0;                        // たまった粒の数
boolean isOilSolid = false;                // 一つの塊になっているか



void dropOil() //落ちていくオイルの描画
{
  // 1秒に1粒発生
  if (frameCount % 30 == 0) 
  {
    for (int i = 0; i < maxDrops; i++) 
    {
      if (!dropActive[i]) 
      {
        dropX[i] = random(510, 540);
        dropY[i] = 360;
        dropSpeed[i] = random(1.5, 2.5);
        dropPhase[i] = 0; // 初期は落下中
        dropActive[i] = true;
        break;
      }
    }
  }

  for (int i = 0; i < maxDrops; i++) 
  {
    if (dropActive[i]) 
    {
      float x = dropX[i];

      if (dropPhase[i] == 0) 
      {
        // ▼ フェーズ0: 垂直に落ちる
        dropY[i] += dropSpeed[i];
        if (dropY[i] >= 655) 
        {
          dropPhase[i] = 1; // 斜線モードへ
        }

      } else if (dropPhase[i] == 1) 
      {
        // ▼ フェーズ1: 斜線のやや上を沿うように左下に流れる

        // 線のy座標
        float yLine = -1.0/9 * (x - 100) + 700;
        float yLimit = yLine - 10;

        dropX[i] -= 2.0;
        if (dropY[i] < yLimit) 
        {
          dropY[i] += 0.5;
        } else 
        {
          dropY[i] = yLimit;
        }

        // 左端に達したら再落下
        if (dropX[i] <= 100) 
        {
          dropPhase[i] = 2;
        }

      } 
      else if (dropPhase[i] == 2) 
      {
        // ▼ フェーズ2: 再度真下に落ちる
        dropY[i] += dropSpeed[i];
      }

      // 描画
      fill(oR, oG, oB, 100);
      noStroke();
      circle(dropX[i], dropY[i], 10);  // サイズ10に変更

      // 画面外に出たら消滅
      if (dropY[i] > 940) 
      {
        dropActive[i] = false;

        // 粒の位置を計算して格納（左下に順番に並べる）
        int col = storedCount % 10;      // 0〜9 列（横方向）
        int row = storedCount / 10;      // 上から何段目か

        float sx = 55 + col * 10;        // x座標（55, 65, ..., 145）
        float sy = 945 - row * 10;       // y座標（945から段ごとに上がる）

        storedDrops[storedCount][0] = sx;
        storedDrops[storedCount][1] = sy;
        storedCount++;
      }
    }
  }
}

/*溜まっていくオイルの描画に使う変数*/
float dDX = 55 ;
float dDY = 945 ;
int dDi;
int pI;

void droppedOil()
{
  for (int dDi = 0 ;dDi<pI;dDi++)
  {
      if ( dDX < 150)
    {
      circle(dDX,dDY,10);
    
      dDX += 10;
    }
    else
    {
      dDX = 55;
    
      if (minuteCurrent == 0)
      {
        dDY = 945;
      }
      else
      {
        dDY -= 10;
      }
    }
  }
  pI = dDi+1;
}

void drawStoredOil()
{
  if (!isOilSolid) 
  {
    for (int i = 0; i < storedCount; i++) 
    {
      fill(oR, oG, oB, 150);
      noStroke();
      circle(storedDrops[i][0], storedDrops[i][1], 10);
    }
  } else 
  {
    fill(oR, oG, oB);
    noStroke();
    ellipse(300, 970, 200, 40); // 中央に塊
  }
}

/*融合したオイルの描画で使う変数*/
float mX;
float mY;

void drawMargedOil() //融合したオイルの描画
{
  arc( 550, 950, mX, mY, radians( 180 ), radians( 270 ), PIE );  
}

/*角に移動していくオイルの描画に使う変数*/
float iX = 75;

void drawIdouOil() //角に移動していくオイルの描画
{
  if(iX<490)
  {
    ellipse(iX,925 , 50, 50);
    iX++;
  }
  else
  {
    iX = 75;
  }
    
}

float rR;

void reverse() 
{
  pushMatrix(); 
  for (int rR = 0; rR < 361; rR++)
  { 
    rotate(radians(rR));
  }
  popMatrix(); 
}
