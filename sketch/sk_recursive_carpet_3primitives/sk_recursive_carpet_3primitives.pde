void setup()
{
  size( 600, 600 );
  noLoop();  // アニメーションしない
}

void draw()
{
  drawCarpet( width/2, height/2, width, height, 5 );  // 最初の再帰呼び出し
}

/**
  再帰関数：矩形を9つの小さな矩形に再帰的に分割する．
*/
void drawCarpet( float fCenterX, float fCenterY, float fWidth, float fHeight, int iLevel )
{  
  if( iLevel > 0 )
  {
    // 中央に描画する矩形の大きさ
    float fRectW = fWidth/3;
    float fRectH = fHeight/3;

    // 再帰レベルに応じて図形を変える．
    if( iLevel % 3 == 0 )
    {
      // 矩形描画
      rectMode( CENTER );  // 矩形の座標を中心点で指定する
      rect( fCenterX, fCenterY, fRectW, fRectH );
    }
    else if( iLevel % 3 == 1 )
    {
      // ひし形
      quad( fCenterX, fCenterY - fRectH/2,
            fCenterX + fRectW/2, fCenterY,
            fCenterX, fCenterY + fRectW/2,
            fCenterX - fRectW/2, fCenterY );
    }
    else if( iLevel % 3 == 2 )
    {
      // 円
      ellipse( fCenterX, fCenterY, fRectW, fRectH );
    }
  
    // 再帰呼び出し
    drawCarpet( fCenterX - fRectW, fCenterY - fRectH, fRectW, fRectH, iLevel - 1 );
    drawCarpet( fCenterX, fCenterY - fRectH, fRectW, fRectH, iLevel - 1 );
    drawCarpet( fCenterX + fRectW, fCenterY - fRectH, fRectW, fRectH, iLevel - 1 );
    drawCarpet( fCenterX - fRectW, fCenterY, fRectW, fRectH, iLevel - 1 );
    drawCarpet( fCenterX + fRectW, fCenterY, fRectW, fRectH, iLevel - 1 );
    drawCarpet( fCenterX - fRectW, fCenterY + fRectH, fRectW, fRectH, iLevel - 1 );
    drawCarpet( fCenterX, fCenterY + fRectH, fRectW, fRectH, iLevel - 1 );
    drawCarpet( fCenterX + fRectW, fCenterY + fRectH, fRectW, fRectH, iLevel - 1 );
  }
}
