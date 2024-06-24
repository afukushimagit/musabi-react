class Face
{
  // フィールド
  float m_fX;
  float m_fY;
  float m_fScale;
  float m_fR;
  float m_fG;
  float m_fB;
  float m_fRad;
  float m_fMouthHeight;

  // コンストラクタ
  Face( float fX, float fY, float fScale )
  {
    m_fX = fX;
    m_fY = fY;
    m_fScale = fScale;
  }

  // 目的地へ移動する．
  void moveToDestination( float fDestX, float fDestY, float fBrake )
  {
    float fDistanceX = fDestX - m_fX;
    float fDistanceY = fDestY - m_fY;
    float fDistance = dist( m_fX, m_fY, fDestX, fDestY );
    
    // 一定範囲内でしか引き付けない．
    if( fDistance < 300 )
    {
      m_fX += fDistanceX / fBrake;
      m_fY += fDistanceY / fBrake;
    }
    m_fX = constrain( m_fX, 0, width );  // スクリーン内に留める
    m_fY = constrain( m_fY, 0, height ); 

    // 目的地を向く
    m_fRad = atan2( fDistanceY, fDistanceX ) + HALF_PI;
    
    // 目的地まで一定距離内に近づくと色を変える．
    if( fDistance < 40 )
    {
      m_fR = 238;
      m_fG = 130;
      m_fB = 238;
    }
    else
    {
      m_fR = 255;
      m_fG = 255;
      m_fB = 255;
    }    
  }

  // 弾き飛ばす．
  void flick()
  {
    m_fX += random( 100, 200 ) * cos( m_fRad + HALF_PI );
    m_fY += random( 100, 200 ) * sin( m_fRad + HALF_PI );
  }
  
  // 口を開ける
  void mouth( float fHeight )
  {
    m_fMouthHeight = fHeight;
  }
  
  // 描画する．
  void draw()
  {
    pushMatrix();
    translate( m_fX, m_fY );
    rotate( m_fRad );
    scale( m_fScale );

    strokeWeight( 2 );

    // 顔輪郭と耳
    fill( m_fR, m_fG, m_fB );
    stroke( 0 );
    ellipse( 0, 0, 80, 70 );
    arc( -23, -27, 14, 20, radians( -220 ), radians( -10 ) );
    arc(  23, -27, 14, 20, radians( -170 ), radians( 40 ) );

    // 目
    fill( 0 );
    circle( -13, -2, 9 );
    circle(  13, -2, 9 );

    // 眉
    line( -18, -12, -10, -13 );
    line(  18, -12, 10, -13 );

    // 目のハイライト
    fill( 255 );
    noStroke();
    ellipse( -13, -4, 6, 5 );
    ellipse(  13, -4, 6, 5 );

    // 口
    fill( m_fR, m_fG, m_fB );
    stroke( 0 );
    arc( -3, 10, 6, 6, radians( 0 ), radians( 180 ) );
    arc(  3, 10, 6, 6, radians( 0 ), radians( 180 ) );
    
    // 開いた口
    fill( m_fR, m_fG, m_fB );
    stroke( 0 );
    arc( 0, 14, 6, m_fMouthHeight, radians( 0 ), radians( 180 ) );

    popMatrix();
  }
}
