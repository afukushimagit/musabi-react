class Face
{
  // フィールド
  float m_fX;
  float m_fY;
  float m_fR;
  float m_fG;
  float m_fB;
  float m_fRad;

  // コンストラクタ
  Face( float fX, float fY )
  {
    m_fX = fX;
    m_fY = fY;
  }

  // 目的地へ移動する．
  void moveToDestination( float fDestX, float fDestY, float fBrake )
  {
    float fDistanceX = fDestX - m_fX;
    float fDistanceY = fDestY - m_fY;
    m_fX += fDistanceX / fBrake;
    m_fY += fDistanceY / fBrake;
    
    // 目的地まで一定距離内に近づくと色を変える．
    float fDistance = dist( m_fX, m_fY, fDestX, fDestY );
    if( fDistance < 40 )
    {
      m_fR = 220;
      m_fG = 80;
      m_fB = 20;
    }
    else
    {
      m_fR = 255;
      m_fG = 255;
      m_fB = 255;
    }
    
    // 目的地を向く
    m_fRad = atan2( fDistanceY, fDistanceX ) + HALF_PI;
  }

  // 描画する．
  void draw()
  {
    pushMatrix();
    translate( m_fX, m_fY );
    rotate( m_fRad );

    strokeWeight( 2 );

    // 顔輪郭と耳
    fill( m_fR, m_fG, m_fB );
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

    popMatrix();
  }
}
