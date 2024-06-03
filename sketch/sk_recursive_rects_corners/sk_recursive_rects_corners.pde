void setup()
{
  size( 600, 600 );
  noLoop();  // アニメーションしない
}

void draw()
{
  background( 255 );  // 背景白
  drawRecursiveRects( width/2, height/2, width/2, height/2, 5 );  // 最初の再帰呼び出し
}

/**
  再帰関数：矩形の４つの角に小さな矩形を再帰的描画する．
*/
void drawRecursiveRects( float fCenterX, float fCenterY, float fWidth, float fHeight, int iLevel )
{  
  if( iLevel > 0 )
  {    
    // 矩形描画
    rectMode( CENTER );  // 矩形の座標を中心点で指定する
    rect( fCenterX, fCenterY, fWidth, fHeight );
    
    float fNewW = fWidth /2.0;
    float fNewHeight = fHeight /2.0;

    // 再帰呼び出し（矩形の４つの角に）
    drawRecursiveRects( fCenterX - fNewW, fCenterY - fNewHeight, fNewW, fNewHeight, iLevel - 1 );
    drawRecursiveRects( fCenterX + fNewW, fCenterY - fNewHeight, fNewW, fNewHeight, iLevel - 1 );
    drawRecursiveRects( fCenterX + fNewW, fCenterY + fNewHeight, fNewW, fNewHeight, iLevel - 1 );
    drawRecursiveRects( fCenterX - fNewW, fCenterY + fNewHeight, fNewW, fNewHeight, iLevel - 1 );
  }
}
