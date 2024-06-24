// デ情くんオブジェクト
Dejoukun obj;

void setup()
{
  size( 400, 400 );
  
  // オブジェクト生成
  obj = new Dejoukun( 200, 200 );
}

void draw()
{
  background( 204 );
  
  // マウスカーソルの位置へ移動
  obj.moveToDestination( mouseX, mouseY, 40 );

  // オブジェクト描画
  obj.draw();
}

class Dejoukun
{
  // フィールド
  float m_fX;
  float m_fY;
  
  // コンストラクタ
  Dejoukun( float fX, float fY )
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
  }
  
  // 描画する．
  void draw()
  {
    pushMatrix();
    translate( m_fX, m_fY );
    
    noStroke();
    
    // finger
    fill( 0 );
    ellipse( 98, -50, 103, 132 );
    
    // finger mask
    fill( 204 );
    ellipse( 168, -68, 155, 190 );
    
    // daen
    fill( 0 );
    ellipse( 0, 30, 253, 200 );
    
    // mouth mask
    fill( 204 );
    ellipse( -2, 2, 116, 186 );
    
    // ue daen
    fill( 0 );
    ellipse( -2, -4, 200, 134 );
    
    // daen mask
    fill( 204 );
    ellipse( -2, 4, 89, 58 );
    
    popMatrix();
  }
}
