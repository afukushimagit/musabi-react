// 調整用定数
final float DIVIDE_RANGE = 0.6;  // 分割の振れ幅(0~1)
final int OFS_X = 10;            // スクリーン左右の空白
final int OFS_Y = 10;

void setup()
{
  size( 600, 600 );
  noLoop();  // アニメーションしない
}

void draw()
{
  drawRectDivided( OFS_X, OFS_Y, width - 2 * OFS_X, height - 2 * OFS_Y, 10 );  // 最初の再帰呼び出し
}

/**
  再帰関数：矩形を上下or左右に再帰的に分割する．
*/
void drawRectDivided( float iX, float iY, float fWidth, float fHeight, int iLevel )
{
  if ( iLevel > 0 )
  {
    // 矩形描画
    rect( iX, iY, fWidth, fHeight );
    
    if ( fWidth > fHeight )
    {
      // 左右に二つに割る
      
      // 割った後の左の矩形の幅
      float fWidthLRect = fWidth * random( ( 1 - DIVIDE_RANGE )/2.0, 1 - ( 1 - DIVIDE_RANGE )/2.0 );
      
      drawRectDivided( iX, iY, fWidthLRect, fHeight, iLevel - 1 );                            //左側の矩形
      drawRectDivided( iX + fWidthLRect, iY, fWidth - fWidthLRect, fHeight, iLevel - 1 );     //右側の矩形
    }
    else 
    {
      // 上下に二つに割る
      
      // 割った後の上の矩形の高さ
      float fHeightUpper = fHeight * random( ( 1 - DIVIDE_RANGE )/2.0, 1 - ( 1 - DIVIDE_RANGE )/2.0 );
      
      drawRectDivided( iX, iY, fWidth, fHeightUpper, iLevel - 1 );                           //上側の矩形
      drawRectDivided( iX, iY + fHeightUpper, fWidth, fHeight - fHeightUpper, iLevel - 1 );  //下側の矩形
    }
  }
}
