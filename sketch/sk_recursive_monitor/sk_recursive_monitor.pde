void setup()
{
  size( 600, 400 );
  noLoop();  // アニメーションしない
}

void draw()
{
  // 最初の再帰呼び出し
  drawMonitor( width/2, height/2, 1, 6 );
}

/**
  再帰関数：モニターに映る映像を再帰的に描画する．
*/
void drawMonitor( float fCenterX, float fCenterY, float fScale, int iLevel )
{
  if ( iLevel > 0 )
  {
    // モニターの描画
    pushMatrix();

    translate( fCenterX, fCenterY );
    scale( fScale );
  
    rectMode( CENTER );
  
    // スタンド
    fill( 20 );
    rect( -80, 100, 80, 120 );
    rect( -80, 160, 220, 20 );
  
    // モニター枠
    rect( -80, -50, 400, 230 );

    // モニタースクリーン背景
    fill( 255 );
    rect( -80, -50, 360, 190 );
    
    
    // 再帰呼び出し（座標変換は継続）
    drawMonitor( -80, -50, 0.5, iLevel - 1 );
    
    popMatrix();
  }
}
