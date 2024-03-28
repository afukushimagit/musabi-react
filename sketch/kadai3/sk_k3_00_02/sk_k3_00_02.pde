/**
 シェルピンスキーのギャスケットを使った時計
 
 時間，分，秒のそれぞれ初期ドットを一番上に打つ.
 
 */
int[][] cell=new int[600][300];       // スクリーンサイズ分の配列.
int iFPS = 4;         // fps

int iFrameIdx;         // フレーム番号:0~iFPS

void setup()
{
  size(600, 300);
  colorMode( HSB, 6, 1, 1 );
  frameRate( iFPS );

  // 配列の初期化
  for (int iX=0; iX<cell.length; iX++)
  {
    for (int iY=0; iY<cell[iX].length; iY++)
    {
      cell[iX][iY]=0;
    }
  }
  iFrameIdx = 0;
}

void draw()
{
  fill(0, 0, 0.5);
  noStroke();
  rect(0, 0, width, height);  // スクリーンリフレッシュ

  int iSecond = second();
  int iDrawXSec = floor( width * ( iSecond / 60.0 ) );

  int iMinute = minute();
  int iDrawXMin = floor( width * ( iMinute / 60.0 ) );

  int iHour = hour();
  int iDrawXHour = floor( width * ( iHour / 24.0 ) );

  int iDrawXFrame = floor( width * ( iFrameIdx / float(iFPS) ) );

  // 初期状態：
  for (int iX=0; iX<width; iX++)
  {
    if ( iX==iDrawXSec )
    {
      cell[iX][0]= 1;
    }
    else if ( iX==iDrawXMin )
    {
      cell[iX][0]= 3;
    }
    else if ( iX==iDrawXHour )
    {
      cell[iX][0]= 5;
    }
    else if ( iX==iDrawXFrame )
    {
      cell[iX][0]= 0;
    }
    else
    {
      cell[iX][0]= 0;
    }
  }

  for (int iY=1; iY<height; iY++)  // ２行目から繰り返し開始．
  {
    for (int iX=0; iX<width; iX++)
    {
      if ( iX == 0 )             // スクリーン左端の処理.
      {
        cell[iX][iY] = ( 0 + cell[iX+1][iY-1] )%6;
      }
      else if ( iX == width-1 )  // スクリーン右端の処理.
      {
        cell[iX][iY] = ( cell[iX-1][iY-1] + 0 )%6;
      }
      else
      {
        // 隣接するセルの合計.
        cell[iX][iY] = ( cell[iX-1][iY-1] + cell[iX+1][iY-1] )%6;
      }

      if ( cell[iX][iY] > 0 )    // もしもセルの値が0以上なら.
      {

        if ( cell[iX][iY]==5 )
        {
          stroke( 0, 0, 1 );
        }
        else if ( cell[iX][iY]==1 )
        {
          stroke( 0, 0, 1 );
        }
        stroke( 0, 0, 1 );
        point( iX, iY );
      }
      else
      {
        stroke( 0, 0, (iX/float(width))*(iY/float(height))-0.2 );
        point( iX, iY );
      }
    }
  }

  // フレームアニメ用変数更新.
  if ( iFrameIdx >= iFPS )
  {
    iFrameIdx = 0;
  }
  else
  {
    iFrameIdx++;
  }
}
